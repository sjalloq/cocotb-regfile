import random
import logging
import cocotb
import os
from cocotb.decorators import coroutine
from cocotb.triggers import Event, RisingEdge, FallingEdge, ReadOnly, Timer, ClockCycles, NextTimeStep
from cocotb.scoreboard import Scoreboard
from cocotb.monitors import Monitor, BusMonitor
from cocotb.drivers import Driver, BusDriver
from cocotb.generators.byte import random_data, get_bytes
from cocotb.binary import BinaryValue
from cocotb.clock import Clock
from cocotb.result import TestFailure, ReturnValue
from cocotb.utils import get_sim_time, get_sim_steps

import ordt_addrmap as AM


# ----------------------------------------------------------------------
# 
# ----------------------------------------------------------------------

@cocotb.coroutine
def wait_for_signals(self, entity, signals=[]):
   yield ReadOnly()
   while ( any( entity.sig.value.integer != 1 for sign in signals) ):
      yield [RisingEdge(entity.sig.value) for sign in signals]
      yield ReadOnly()
   yield NextTimeStep()

      
# ----------------------------------------------------------------------
#  
# ----------------------------------------------------------------------

class TestbenchError(Exception):
   def __init__(self, message):
      self.message = message
      
class RegfileReadWriteError(Exception):
   def __init__(self, message):
      self.message = message


# ----------------------------------------------------------------------
# Host Side IRQ Driver
# ----------------------------------------------------------------------

class IrqDriver(Driver):
   """
   Class       : IrqDriver
   Description : Allows simulation of interrupts firing from the host.
   """
   
   def __init__(self, entity, regfile):
      self.dut     = entity
      self.regfile = regfile
      self.irqs    = self.regfile.get_rtl_irq_inputs()
      Driver.__init__(self)
      self._reset()

      
   def _reset(self):
      for irq in self.irqs:
         obj = self.dut.__getattr__(irq)
         obj.setimmediatevalue(0)


   def num_irqs(self):
      return len(self.irqs)

   
   @cocotb.coroutine
   def fire_irq(self, idx):
      try:
         irq = self.irqs[idx]
         yield self.send(irq)
      except:
         raise Exception("Blah")

      
   @cocotb.coroutine
   def fire_random_irq(self):
      idx  = random.randrange(len(self.irqs))
      irq  = self.irqs[idx]
      self.log.info("IrqDriver::fire_random_irq : random IRQ generated : irq={}".format(irq))
      yield self.send(irq)

      
   @cocotb.coroutine
   def send(self, irq):
      yield self._driver_send(irq)

      
   @cocotb.coroutine
   def _driver_send(self, irq):
      clkedge = RisingEdge(self.dut.clk)
      yield clkedge
      self.dut.__setattr__(irq,1)
      for _ in range(2):
         yield clkedge
      self.dut.__setattr__(irq,0)

   
         
# ----------------------------------------------------------------------
#  IRQ Monitor
# ----------------------------------------------------------------------

class IrqMonitor(Monitor):
   def __init__(self, entity, regfile, callback=None, event=None):
      self.dut     = entity
      self.regfile = regfile
      self.irqs    = regfile.get_rtl_irq_inputs()
      Monitor.__init__(self, callback=callback, event=event)

   @cocotb.coroutine
   def _monitor_recv(self):
      """Monitors all IRQ inputs and updates the model when they fire """

      while True:
         res = yield [RisingEdge(self.dut.__getattr__(irq)) for irq in self.irqs]
         self.log.info("IrqMonitor::_monitor_recv : interrupt fired was {}".format(res.signal._name))
         self.regfile.set_irq(res.signal._name)

         
# ----------------------------------------------------------------------
# Register Read/Write Transactions
# ----------------------------------------------------------------------

class RegTrxn():
   """A single read or write to the register file"""

   _default_config = {
      "dataWidth" : 16,
      "addrWidth" : 10
   }

   def __init__(self, read=False, write=False, addr=0, wdata=0, rdata=0, ack=0, nack=0, config=_default_config):
      if read and write:
         raise AttributeError("Cant' read and write!")

      if isinstance(addr, cocotb.binary.BinaryValue):
         paddr = addr.integer
      elif isinstance(addr, int):
         paddr = addr
      else:
         raise Exception("class of addr={}".format(addr.__class__))
      
      #print("RegTrxn::__init__ : read={} write={} addr={} addr.class={}".format(read, write, hex(paddr), paddr.__class__))
      
      self.ren   = 1 if read else 0
      self.wen   = 1 if write else 0
      self.addr  = BinaryValue(addr,  n_bits=config["addrWidth"], bigEndian=False)
      self.wdata = BinaryValue(wdata, n_bits=config["dataWidth"], bigEndian=False)
      self.rdata = BinaryValue(rdata, n_bits=config["dataWidth"], bigEndian=False)      
      self.ack   = ack
      self.nack  = nack

   def compare(self, trxn):
      return ( (self.ren   == trxn.ren  ) and
               (self.wen   == trxn.wen  ) and
               (self.addr  == trxn.addr ) and
               (self.rdata == trxn.rdata) and
               (self.wdata == trxn.wdata) and
               (self.ack   == trxn.ack  ) and
               (self.nack  == trxn.nack ) )
   
   def isread(self):
      return self.ren == 1
   
   def to_s(self):
      return 'ren={} wen={} addr={} rdata={} wdata={} ack={} nack={}'.format(
         self.ren, self.wen, hex(self.addr.value), hex(self.rdata.value), hex(self.wdata.value), self.ack, self.nack)
      
class RegRdTrxn(RegTrxn):
   """A single read to the register file"""

   def __init__(self, addr, rdata=0, ack=0, nack=0):
      RegTrxn.__init__(self, read=True, addr=addr, rdata=rdata, ack=ack, nack=nack)

      
class RegWrTrxn(RegTrxn):
   """A single write to the register file"""

   def __init__(self, addr, wdata, ack=0, nack=0):
      RegTrxn.__init__(self, write=True, addr=addr, wdata=wdata, ack=ack, nack=0)
      
      
# ----------------------------------------------------------------------
# Register File Driver
# ----------------------------------------------------------------------

class RegfileDriver(BusDriver):

   _signals = ["ren", "wen", "addr", "wdata", "rdata", "ack", "nack"]

   def __init__(self, entity, name, clock, **kwargs):
      BusDriver.__init__(self, entity, name, clock, **kwargs)
      self.bus.ren.setimmediatevalue(0)
      self.bus.wen.setimmediatevalue(0)
      self.bus.addr.setimmediatevalue(0)
      self.bus.wdata.setimmediatevalue(0)
      
   def read(self, addr, event=None):
      if not isinstance(addr, int):
         raise Exception(
            "RegfileDriver::read : expecting integer address; you gave addr={}".format(addr.__class__))
      trxn = RegRdTrxn(addr=addr)
      self.append(trxn, event)
      
   def write(self, addr, value, event=None):
      if (not isinstance(addr, int) or not isinstance(value, int)):
         raise Exception(
            "RegfileDriver::write : expecting integer address/wdata; you gave addr={} value={}".format(addr.__class__, value.__class__))
      trxn = RegWrTrxn(addr=addr, wdata=value)
      self.append(trxn, event)

   @cocotb.coroutine
   def _wait_for_ack_nack(self):
      yield ReadOnly()
      while (self.bus.ack.value.integer != 1) and (self.bus.nack.value.integer != 1):
         yield [RisingEdge(self.bus.ack), RisingEdge(self.bus.nack)]
         #yield RisingEdge(self.bus.ack)
         yield ReadOnly()
      yield NextTimeStep()
      
   @cocotb.coroutine
   def _driver_send(self, trxn, sync=True):
      """Override the implementation for BusDriver to force synchronous transactions

        Args:
            transaction: The transaction to send.
            sync (bool, optional): Synchronise the transfer by waiting for a rising edge.
        """

      self.log.info ("RegfileDriver::_driver_send() : sending transaction : {}".format(trxn.to_s()))
      
      # Drive the transaction
      yield RisingEdge(self.clock)
      self.bus <= trxn

      # De-assert the read/write enable in the next cycle
      yield RisingEdge(self.clock)
      self.bus.ren <= 0
      self.bus.wen <= 0

      # We can't initiate another read/write until the current one is acknowledged
      yield self._wait_for_ack_nack()


# ----------------------------------------------------------------------
#
# ----------------------------------------------------------------------

class RegfileMonitor(BusMonitor):
   """Monitors any SPI to regfile transactions"""

   _signals = ["ren", "wen", "addr", "wdata", "rdata", "ack", "nack"]
   _optional_signals = []

   def __init__(self, *args, **kwargs):
      BusMonitor.__init__(self, *args, **kwargs)

   @cocotb.coroutine
   def _wait_for_ack_nack(self):
      yield ReadOnly()
      while (self.bus.ack.value.integer != 1) and (self.bus.nack.value.integer != 1):
         yield [RisingEdge(self.bus.ack), RisingEdge(self.bus.nack)]
         #yield RisingEdge(self.bus.ack)
         yield ReadOnly()
      yield NextTimeStep()
      
   @cocotb.coroutine
   def _monitor_recv(self):
      """Capture all regfile accesses"""
   
      clkedge = RisingEdge(self.clock)
      rdonly  = ReadOnly()

      def valid():
         return self.bus.ren.value or self.bus.wen.value

      def invalid():
         return self.bus.ren.value and self.bus.wen.value

      while True:
         yield clkedge
         yield rdonly

         if invalid():
            raise RegfileReadWriteError("Illegal simulataneous read and write transactions")

         if valid():
            if self.bus.ren.value == 1:

               trxn = RegRdTrxn(addr=self.bus.addr.value.integer)

               yield clkedge
               yield rdonly
               yield self._wait_for_ack_nack()
               
               trxn.rdata = self.bus.rdata.value
               trxn.ack   = self.bus.ack.value
               trxn.nack  = self.bus.nack.value
               self.log.info("RegfileMonitor::_monitor_recv : read trxn: {}".format(trxn.to_s()))
            
            if self.bus.wen.value == 1:

               trxn = RegWrTrxn(addr=self.bus.addr.value.integer, wdata=self.bus.wdata.value.integer)
            
               yield clkedge
               yield rdonly
               yield self._wait_for_ack_nack()
               
               trxn.ack   = self.bus.ack.value
               trxn.nack  = self.bus.nack.value
               self.log.info("RegfileMonitor::_monitor_recv : write trxn: {}".format(trxn.to_s()))

            self._recv(trxn)
                                       
      
# ----------------------------------------------------------------------
# Host Monitor
# ----------------------------------------------------------------------

class HostMon(Monitor):

   def __init__(self, entity, callback=None, event=None, debug=False):
      self.dut = entity
      Monitor.__init__(self, callback=callback, event=event)

   @cocotb.coroutine
   def _monitor_recv(self):
      """Capture all DUT to Host IRQ requests"""

      irq = self.dut.reg_host_irq
      
      # Wait for the logic to be reset
      yield ReadOnly()
      yield RisingEdge(self.dut.reset_n)
      
      while True:

         # Wait on the regfile to assert the IRQ
         while irq.value.integer != 1:
            yield RisingEdge(irq)

         # Signal any subscribers that the IRQ has fired
         self._recv( {'time' : get_sim_time('ns')} )

         # Wait for the interrupt(s) to be cleared
         while irq.value.integer == 1:
            yield FallingEdge(irq)

                    
# ----------------------------------------------------------------------
# Scoreboard
# ----------------------------------------------------------------------

class RegfileScoreboard(Scoreboard):

   def __init__(self, entity):
      Scoreboard.__init__(self, entity)

   def compare(self, got, exp, log, strict_type=True):
      """Common function for comparing two transactions.

        Can be re-implemented by a subclass.
        
        Args:
            got: The received transaction.
            exp: The expected transaction.
            log: The logger for reporting messages.
            strict_type (bool, optional): Require transaction type to match
                exactly if ``True``, otherwise compare its string representation.

        Raises:
            :any:`TestFailure`: If received transaction differed from
                expected transaction when :attr:`fail_immediately` is ``True``.
                If *strict_type* is ``True``,
                also the transaction type must match.
        """

      # Compare the types
      if strict_type and type(got) != type(exp):
         self.errors += 1
         log.error("Received transaction type is different than expected")
         log.info("Received: %s but expected %s" % (str(type(got)), str(type(exp))))
         if self._imm:
            raise TestFailure("Received transaction of wrong type. "
                              "Set strict_type=False to avoid this.")
         return

      # Compare directly
      if not exp.compare(got):
         self.errors += 1
         log.error("Received transaction differed from expected output")
         log.error("Received: {}".format(got.to_s()))
         log.error("Expected: {}".format(exp.to_s()))
         
         if self._imm:
            raise TestFailure("Received transaction differed from expected"
                                  "transaction")
      else:
         # Don't want to fail the test
         # if we're passed something without __len__
         log.debug("Received expected transaction : %s" % got.to_s())
      
   
# ----------------------------------------------------------------------
# Testbench
# ----------------------------------------------------------------------
#
# The overall structure here is as follows:
#                    
#  +-------------+      +---------------+           +-----------+         +-------------+
#  |TB Processes |----->|Regfile Driver |-----+---->|    DUT    |<--+-----| IRQ Driver  |
#  +-------------+      +---------------+     |     +-----------+   |     +-------------+
#                                             |        |            |
#  +-------------+      +---------------+     |        |            |     +-------------+
#  |Regfile Model|<-----|Regfile Monitor|<----+        |            +---->| IRQ Monitor |
#  +-------------+      +---------------+              |                  +-------------+
#               |                |                     |Host IRQ
#               |                V                     V
#               |       +---------------+       +---------------+         +-------------+
#               +------>| Regfile Scbd  |       | Host Monitor  |-------->|TB Processes |
#                       +---------------+       +---------------+         +-------------+
#
#
# The Regfile components are fairly self explanatory.  We have the usual components of a
# driver, monitor and a scoreboard with a model to generate the expected transactions.
#
# The Host Monitor watches the host IRQ output and kicks the TB into performing the
# IRQ handler process.  This mimics what an MCU would do to walk the interrupt hierarchy.
#
# The IRQ driver/monitor allow control/monitoring of all the host IRQ inputs to the DUT.
#                    
# ----------------------------------------------------------------------

class RegfileTB(object):

   def __init__(self, dut, debug=False):
      self.dut         = dut
      self.regfile     = AM.AddressMap(os.path.join(os.environ['TB_HOME'], '../xml/ordt_addrmap.xml'))
      self._irq        = Event(name="Host IRQ Event")
      self.irq_drv     = IrqDriver(dut, self.regfile)
      self.irq_mon     = IrqMonitor(dut, self.regfile)
      self.host_mon    = HostMon(dut, event=self._irq)
      self.regfile_drv = RegfileDriver(dut, "host_reg", dut.clk)
      self.regfile_mon = RegfileMonitor(dut, "host_reg", dut.clk)

      # Set the verbosity of our units.
      level = logging.DEBUG if debug else logging.INFO
      self.regfile_drv.log.setLevel(level)
      self.regfile_mon.log.setLevel(level)
      self.regfile.log.setLevel(level)

      # Add a callback to the Regfile Monitor so that we can generate expected data
      self.regfile_mon.add_callback(self.model)

      # Create a scoreboard
      self.trxns_seen = 0
      self.expected_output = []
      self.scoreboard = RegfileScoreboard(dut)
      self.scoreboard.add_interface(self.regfile_mon, self.expected_output, strict_type=False)

      # Start a coroutine to monitor the host side IRQ
      self._thread = cocotb.fork(self.process_irq(self._irq))

      
   def model(self,trxn):
      if trxn.isread():
         ack,rdata = self.regfile.read(trxn.addr.value)
         expctd    = RegRdTrxn(trxn.addr.value, rdata=rdata, ack=ack, nack=~ack&0x1)
      else:
         ack    = self.regfile.write(trxn.addr.value, trxn.wdata.value)[0]
         expctd = RegWrTrxn(trxn.addr.value, wdata=trxn.wdata.value, ack=ack, nack=~ack&0x1)
         
      self.dut._log.info("RegfileTB::model : expected transaction is: {}".format(expctd.to_s()))
      self.expected_output.append(expctd)
      self.trxns_seen += 1

   @cocotb.coroutine
   def reset(self, duration=30000):
      yield Timer(5500)
      self.dut.reset_n <= 0
      yield Timer(duration)
      yield RisingEdge(self.dut.clk)
      self.dut.reset_n <= 1
      yield ReadOnly()

      
   @cocotb.coroutine
   def read_register(self, addr):
      """Reads a register and returns the monitored transaction"""

      # Double check we get an int address
      if not isinstance(addr, int): raise Exception(
            "RegfileTB::read_register : expecting integer address; you gave addr={}".format(addr.__class__))
      
      # Send the read transaction to the driver
      self.regfile_drv.read(addr=addr)
      self.dut._log.info("RegfileTB::read_register : reading register @ {}".format(hex(addr)))
         
      # Process the monitored transactions and select the matching transaction to return
      match = 0
      while not match:
         trxn = yield self.regfile_mon.wait_for_recv()
         match = (addr == trxn.addr.integer)
      self.dut._log.info("RegfileTB::process_irq : interrupt status register was {}".format(hex(trxn.rdata.integer)))

      raise ReturnValue(trxn)
      

   @cocotb.coroutine
   def process_irq(self, _host_irq):
      """Process the IRQ"""

      # Get the status reg from the model (returns ordt::Register type)
      irq_status_register = self.regfile.get_reg_by_path('_user_irq_status')

      while True:
         yield _host_irq.wait()
         _host_irq.clear()
         self.dut._log.debug("RegfileTB::process_irq : interrupt received!")

         # Read the status register
         trxn = yield self.read_register(int(irq_status_register.baseaddr, 16))
         self.dut._log.debug("RegfileTB::process_irq : status_reg binstr is {}".format(trxn.rdata.binstr))
         
         # Now read the low level IRQ registers to find out which IRQ fired (2 levels of hierarchy only)
         irq_regs = []
         for idx,bit in enumerate(trxn.rdata.binstr[::-1]):
            if bit == '1':
               # If the flag is set, read the lower level IRQ register
               path = irq_status_register.fields[idx].intr.input
               self.dut._log.info("RegfileTB::process_irq : idx={} bit={} path={}".format(idx, bit, path))
               src_reg = self.regfile.get_reg_by_path(path)
               self.dut._log.info("RegfileTB::process_irq : reading IRQ reg @ {}".format(src_reg.baseaddr))
               self.regfile_drv.read(addr=int(src_reg.baseaddr, 16))
               irq_regs.append(src_reg)

         # Iterate over all the interrupt registers we have read
         for reg in irq_regs:
            match = 0
            # Get the read data from the monitor
            while not match:
               trxn = yield self.regfile_mon.wait_for_recv()
               match = (int(reg.baseaddr,16) == trxn.addr.integer)
            # Find out which IRQ fired
            for idx,bit in enumerate(trxn.rdata.binstr[::-1]):
               if bit == '1':
                  # If the flag is set, print the IRQ
                  irq = reg.fields[idx].path
                  self.dut._log.info("RegfileTB::process_irq : interrupt fired = {}".format(irq))

         # Done processing so exit the loop
         break
                  
   @cocotb.coroutine
   def wait_on_pending(self):
      while self.regfile_drv._sendQ:
         yield RisingEdge(self.dut.clk)

         
   @cocotb.coroutine
   def wait_on_event(self, evnt):
      yield evnt.wait()
      self.dut._log.info("Event {} fired!".format(evnt.name))

      
   def enable_all_irqs(self, event=None):
      """Calls the model to generate the write transactions to enable all IRQs"""

      trxns = {}
      for f in self.regfile.get_irq_enable_registers():
         # We are iterating over fields so we may have multiple entries with the same address
         if not f.baseaddr in trxns:
            trxns[f.baseaddr] = f.mask()
         else:
            trxns[f.baseaddr] |= f.mask()

      # For each transaction, convert the address/data to ints and send
      for a,d in trxns.items():
         addr = int(a,16)
         data = d
         self.dut._log.info("RegfileTB::enable_all_irqs:  generated write transaction: addr={} data={}".format(hex(addr), hex(data)))
         self.regfile_drv.write(addr,data)

      if event:
         event.set()
   
# ----------------------------------------------------------------------
# Main Test
# ----------------------------------------------------------------------

@cocotb.test()
def bringup_test(dut):

   posedge = RisingEdge(dut.clk)
   dut.reset_n.setimmediatevalue(1)
   cocotb.fork(Clock(dut.clk, 5000).start())
   tb = RegfileTB(dut, debug=False)

   dut._log.info("Asserting Reset")
   yield(tb.reset())

   # Enable all the interrupts
   dut._log.info("Enabling interrupts")
   tb.enable_all_irqs()
   
   # Wait for the final transaction
   yield tb.wait_on_pending()

   # Fire a random IRQ
   yield tb.irq_drv.fire_random_irq()
   
   # Wait a few cycles before ending the test
   for i in range(20):
      yield RisingEdge(dut.clk)

   # How many transactions did we see?
   dut._log.info("End of test; seen %d transactions" % tb.trxns_seen)
   raise tb.scoreboard.result
