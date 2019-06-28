#!/usr/bin/env python

import xml.etree.ElementTree as ET
import collections
import logging

from enum import Enum, auto
from cocotb.log import SimLog


def collimate(lst,delimiter):
    """Helper function for producing nicely aligned text output"""
    out    = []
    maxlen = [0] * len(lst[0].split(delimiter))

    for string in lst:
        for i,s in enumerate(string.split(delimiter)):
            maxlen[i] = max([len(s), maxlen[i]])
    for string in lst:
        out.append(' | '.join( [ s + ' ' * (maxlen[i] - len(s)) for i,s in enumerate(string.split(delimiter)) ] ) )
    return out

def flatten(l, ltypes=(list, tuple)):
    """Takes a list of lists and flattens it"""
    ltype = type(l)
    l = list(l)
    i = 0
    while i < len(l):
        while isinstance(l[i], ltypes):
            if not l[i]:
                l.pop(i)
                i -= 1
                break
            else:
                l[i:i + 1] = l[i]
        i += 1
    return ltype(l)

def to_rtl(path):
    """Modifies a path to look like the RTL net/register names"""
    return path.replace('.', '_')

def divider(string):
    """Inserts a Verilog style divider into a string"""
    return '\n// ' + '-' * 70 + '\n// ' + string + '\n// ' + '-' * 70 + '\n'


class Error(Exception):
    pass

class UnknownHwInfoField(Error):
    """Should never happen, probably a new field that hasn't been seen previously"""
    def __init__(self, message):
        self.message = message

class UnknownChildTag(Error):
    """Should never happen, probably a new field that hasn't been seen previously"""
    def __init__(self, message):
        self.message = message
        
class UnknownRegsetElement(Error):
    """Should never happen, probably a new field that hasn't been seen previously"""
    def __init__(self, message):
        self.message = message

class UnknownRegElement(Error):
    """Should never happen, probably a new field that hasn't been seen previously"""
    def __init__(self, message):
        self.message = message

class UnknownFieldElement(Error):
    """Should never happen, probably a new field that hasn't been seen previously"""
    def __init__(self, message):
        self.message = message

class MissingFieldElement(Error):
    """Should never happen, probably a new field that hasn't been seen previously"""
    def __init__(self, message):
        self.message = message

class IllegalRegWrite(Error):
    """The user has performed a write to reserved/unused register fields"""
    def __init__(self, message):
        self.message = message

class IncorrectAddrType(Error):
    def __init__(self, message):
        self.message = message    

class UnknownPathError(Error):
    """The path specified didn't match against any registers/fields; use to_rtl()?"""
    def __inti__(self, message):
        self.message = message

class PartialPathError(Error):
    """The path specified matches against more than one register; be more verbose"""
    def __inti__(self, message):
        self.message = message

        
class Access(Enum):
    RW = 'RW'
    RO = 'RO'
    RC = 'RC'
    WO = 'WO'

    
class HwAccess(Enum):
    NA = 'na'
    R  = 'r'
    W  = 'w'
    RW = 'rw'

    
class ReadWriteAck(Enum):
    ACK  = 1
    NACK = 0

    
class HwInfo(object):
    """Maps to the SystemRDL Field HwInfo property"""
    
    def __init__(self, elem):
        for e in elem:
            if e.tag == 'hwaccess':
                self.hwaccess = self._hwaccess(e.text)
            elif e.tag == "nextassign":
                self.nextassign = e.text
            elif e.tag == "we":
                self.we = e.text
            else:
                raise UnknownHwInfoField("Unexpected HwInfo.tag={}".format(e.tag))

    def _hwaccess(self, hwaccess):
        """Returns an enum from the input string"""
        return HwAccess(hwaccess)

    
class Intr(object):
    """Maps to the SystemRDL Field Interrupt property"""
    
    def __init__(self, elem):
        # Defaults
        self.input = None
        
        for e in elem:
            if e.tag == 'type':
                self.type = e.text
            elif e.tag == 'stickytype':
                self.stickytype = e.text
            elif e.tag == 'enable':
                self.enable = e.text
            elif e.tag == 'input':
                self.input = e.text
            else:
                raise UnknownFieldElement("Unexpected Intr.tag={}".format(e.tag))

    def to_s(self):
        """Return a string"""

        try:
            return 'irq_type={} irq_stickytype={} irq_enable={} irq_next={}'.format(
                self.type, self.stickytype, to_rtl(self.enable), self.input )
        except AttributeError:
            raise AttributeError("Intr::to_s() missing an attribute; add a default?")

        
class Logger(object):
    """Override this class with your own logger if you don't use cocotb"""
    def __init__(self, claas):
        self.log = SimLog(claas)
        self.log.setLevel(logging.INFO)


class Component(Logger):
    """RDL base class with some common methods"""
    def __init__(self, claas):
        self.claas = claas
        Logger.__init__(self, self.claas)

    def isregfile(self):
        return self.claas == 'RegisterFile'
    
    def isreg(self):
        return self.claas == 'Register'

    def isfield(self):
        return self.claas == 'Field'

        
class Field(Component):
    """Maps to the SystemRDL Field component"""
    
    def __init__(self, args):
        Component.__init__(self, self.__class__.__name__)
        for k,v in args.items():
            setattr(self, k, v)
        self.value = int(self.reset)
        self.parent = None
        self.children = None
        
    def isirq(self):
        return hasattr(self, 'intr')

    def isstickyirq(self):
        """If this is an interrupt, it will be either STICKY or NONSTICKY"""
        if hasattr(self, 'intr'):
            return self.intr.stickytype == 'STICKYBIT'
        else:
            return False

    def hasparent(self):
        """If this is an interrupt, it might have a parent"""
        return not self.parent is None
    
    def haschildren(self):
        """If this is an interrupt, it might have children"""
        return not self.children is None
    
    def iswriteable(self):
        return (self.access in [Access.RW, Access.WO])

    def read(self):
        """ 
        Return the field value shifted to its correct bit location in the word.
        If this an interrupt then we need to clear it on a read.
        """
        value = self.value << int(self.lowidx)
        self.log.info("Field::read() : reading field {}, value={} self.value={} self.lowidx={} self.width={}".format(
            self.path, hex(value), hex(self.value), self.lowidx, self.width))
        
        if self.access is Access.RC and self.isirq():
            self.clear_irq()
        return value
    
    def write(self, value):
        """Accepts an int and picks out the relevant field bits from the word"""
        self.value = (1 * int(self.width)) & (value >> int(self.lowidx))

    def clear_irq(self):
        """"""
        self.value = 0
        self.update_irq_status()
                    
    def set_irq(self):
        """The interrupt has fired so set the field value to 1 and update any parents"""
        self.log.info("Field::set_irq() : setting IRQ for field '{}'".format(self.path))
        self.value = 1
        self.update_irq_status()

    def update_irq_status(self):
        """Called when a sticky interrupt is set or cleared. Any parents should be updated
        who in turn should check all their children and generate a new value."""        

        res = 0
        if self.haschildren():
            for child in self.children:
                res |= child.value
            if (res > 0):
                self.value = 1
            else:
                self.value = 0
            
        if self.hasparent():
            self.parent.update_irq_status()

    def mask(self):
        """Returns a write mask for this field"""
        return (1 * int(self.width)) << int(self.lowidx)

    def to_s(self, verbosity=0):
        string = 'field={} addr={} width={} offset={} value={} sw={} hw={} path={} '.format(
            self.id, hex(int(self.baseaddr,16)), self.width, self.lowidx, self.value, self.access, self.hwinfo.hwaccess, self.path)
        if verbosity > 0:
            string += self.intr.to_s()
        return string

    
class Register(Component):
    """Maps to the SystemRDL Register component"""
    
    def __init__(self, args):
        Component.__init__(self, self.__class__.__name__)
        for k,v in args.items():
            setattr(self, k, v)
        self.wmask = self._wmask(int(self.width))
        
    def __iter__(self):
        return iter(self.fields)

    def read(self):
        """Constructs the read data from each sub-field"""
        data = 0
        for f in self.fields:
            data |= f.read()
        return data
    
    def write(self, value):
        """Performas a write after checking against each field's write access"""
        if (value & ~self.wmask):
            raise IllegalRegWrite(
                "write to non-writeable fields: addr={} wmask={} wdata={}".format(
                    hex(self.baseaddr),hex(self.wmask),hex(value)))
        else:
            [f.write(value) for f in self.fields]

    def to_s(self, verbosity=0):
        """Return a string

        Arguments:
          verbosity - the verbosity level from 0:low to 2:high"""
        string = '\n'
        string += 'address={} name={} path={}'.format(self.baseaddr, self.id, self.path)
        for f in self.fields:
            string += f.to_s() 
        return string

    def _wmask(self, width):
        """Generate a bitwise write mask"""

        mask = 0
        for field in self.fields:
            if field.iswriteable:
                mask += field.mask()
        return mask
        

    
class RegisterFile(Component):
    """Maps to the SystemRDL Register File Component"""
    
    def __init__(self, args):
        Component.__init__(self, self.__class__.__name__)
        for k,v in args.items():
            setattr(self, k, v)
            
    def __iter__(self):
        return iter(self.registers)
    
    def to_s(self, verbosity=0):
        """Return a string

        Arguments:
          verbosity - the verbosity level from 0:low to 2:high"""
        return 'regset={}'.format(self.id)
        

class AddressMap(Logger):
    """Maps to the SystemRDL Address Map component"""
    
    def __init__(self, xmlfile):
        """Initialises the top level register file

        Arguments:
          xmlfile - the full path to the XML file to parse"""
        self.root        = ET.parse(xmlfile).getroot()
        self.id          = self.root.find('id').text
        self.baseaddr    = self.root.find('baseaddr').text
        self.registers   = []
        self.addressmap  = {}
        self.pathmap     = {}
        self.interrupts  = {}
        self.toplevelirq = {}
        self._parse()
        self._addressmap(self.registers)
        self._pathmap(self.registers)
        self._interrupts(self.registers)
        Logger.__init__(self, self.__class__.__name__)

        
    def read(self, addr, verbosity=0):
        try:
            reg = self.get_reg_by_address(addr)
            rdata = reg.read()
            if verbosity > 0: print('AddressMap::read() : addr={} rdata={}'.format(addr,rdata))
            return [ReadWriteAck.ACK.value, rdata]
        except KeyError:
            print("WARN: read to address {} doesn't exist".format(hex(addr)))
            return [ReadWriteAck.NACK.value, 0]

        
    def write(self, addr, value, verbosity=0):
        try:
            reg = self.get_reg_by_address(addr)
            if verbosity > 0: print("AddressMap::write() : addr={} wdata={}".format(addr,value))
            return [ReadWriteAck.ACK.value, reg.write(value)]
        except KeyError:
            print("WARN: write to address {} doesn't exist".format(hex(addr)))
            return [ReadWriteAck.NACK.value, value]
        except IllegalRegWrite as err:
            print(err)
            return [ReadWriteAck.NACK.value, value]

    def get_address_by_field(self, field):
        """Returns a list of addresses given a full or partial path name"""

        return [v.baseaddr for k,v in self.pathmap.items() if (field in k and v.isfield())]

    
    def get_address_by_path(self, path):
        """Returns a list of addresses given a full or partial path name"""

        addr = []
        for k,v in self.pathmap.items():
            if (path in k and v.isreg()):
                addr += [v.baseaddr]

        # We should only get 1 result otherwise we haven't specified a unique path name.  Or we are
        # possibly matching multiple paths such as path_1, path_10, path_11.  If the latter and selecting
        # the first entry in the returned array doesn't work, rename your RDL with unique numbers such as path_01.
        if len(addr)<1:
            raise UnknownPathError("get_address_by_path() couldn't find register matching {}".format(path))
        elif len(addr)>1:
            self.log.warn("AddressMap::get_address_by_path() : found {} matching paths when expecting only 1 for {}. Check your naming for addresses {}".format(len(addr), path, addr))
        return addr[0]
    

    def get_reg_by_address(self, addr):
        """Returns the path of a register given an integer address"""

        try:
            return self.addressmap[addr]
        except:
            try:
                return self.addressmap[int(addr,16)]
            except ValueError as err:
                raise IncorrectAddrType("get_reg_by_address() : wrong base conversion? {}".format(err))
            except:
                raise Exception("get_reg_by_address() : expected string or int, got {}".format(
                    addr.__class__))

    def get_reg_by_path(self, path):
        """Returns a register given a full or partial path"""

        addr = self.get_address_by_path(to_rtl(path))
        reg = self.get_reg_by_address(addr)
        return reg

    
    def get_irqs(self):
        """Returns a list of all interrupt registers"""
        return [f for f in self._fields() if f.isirq()]

    
    def get_sticky_irqs(self):
        """
        Returns a list of all the sticky interrupts; these are 
        associated with the external IRQ inputs from the host
        """
        return [f for f in self._fields() if f.isstickyirq()]

    
    def get_rtl_irq_inputs(self):
        """Returns a list of the host interrupt nets"""
        return list(map(lambda f: 'h2l_' + f.path + '_intr', self.get_sticky_irqs()))

    
    def get_irq_by_path(self, path):
        """Returns the Field component for a given interrupt

        Arguments:
          path - a full or partial hierarchical path to a field"""

        irqs = [v for k,v in self.interrupts.items() if path in k]

        # We should get at least 1 irq
        if len(irqs)<1:
            raise UnknownPathError("get_irq_by_path() couldn't find any irq matching {}".format(path))
        return irqs

    
    def get_irq_enable_registers(self):
        """Returns a list of registers corresponding to all the IRQ enables"""

        fields = []
        # For all fields
        for f in self._fields():
            # If it is an interrupt register
            if f.isirq():
                # Get the name of the enable net ... 
                irq_en = to_rtl(f.intr.enable)
                # ...and find the corresponding enable register
                try:
                    fields.append(self.pathmap[irq_en])
                except KeyError:
                    raise UnknownPathError("pathmap does not have entry for {}".format(path))
        return fields

    def get_toplevel_irq_status(self):
        """"""
        return [ { path: field.value } for path,field in self.toplevelirq.items() ]

    def set_irq(self, irq):
        """Simulates an interrupt firing by directly setting the appropriate field"""

        # Remove the RLT net prefix/suffix from the path
        path = irq.strip('h2l_')
        path = path.strip('_intr')

        # Get a list of all matching IRQs, we hope there's only 1.
        irqs = self.get_irq_by_path(path)

        self.log.info("Addressmap::set_irq() : Model requested to set irq: {}".format(irqs[0].to_s()))
        
        if len(irqs) < 1:
            raise UnknownPathError("no interrupt matching '{}'".format(path))
        if len(irqs) > 1:
            raise PartialPathError("path '{}' matched >1 interrupts".format(path))

        irqs[0].set_irq()
        
    def to_s(self):
        """Return a string

        Arguments:
          verbosity - the verbosity level from 0:low to 2:high"""
        od = collections.OrderedDict(sorted(self.addressmap.items()))
        for addr,reg in od.items():
            print(reg.to_s())
            
    def _parse(self):
        """Parses the Ordt XML tree and constructs the RDL Adress Map hierarchy"""
        
        for child in self.root:
            # Get all the top level Register components
            if child.tag == 'reg':
                self.registers.append(self._parse_reg(child))
            # then parse all Register File components
            elif child.tag == 'regset':
                self.registers.append(self._parse_regset(child))
            # Ignore all other tags
            elif child.tag in ['id', 'baseaddr', 'shorttext']:
                pass
            else:
                raise UnknownChildTag("Unexpected root.tag={}".format(child.tag))
            
    def _parse_regset(self, elem):
        """Parses the RDL Register File componet

        Arguments:
          elem - the XML element over which to iterate"""
        
        regset = {}
        regset['registers'] = []
        
        for e in elem:
            if e.tag in ['id', 'shorttext', 'longtext', 'baseaddr', 'highaddr']:
                regset[e.tag] = e.text
            elif e.tag == 'reg':
                regset['registers'].append(self._parse_reg(e))
            else:
                raise UnknownRegsetElement('Unexpected regset.tag={}'.format(e.tag))
            
        return RegisterFile(regset)
    
    def _parse_reg(self, elem):
        """Parses the RDL Register componet

        Arguments:
          elem - the XML element over which to iterate"""
        
        reg = {}
        reg['fields'] = []

        for e in elem:
            if e.tag in ['id', 'shorttext', 'baseaddr', 'width', 'access', 'parentpath', 'longtext']:
                reg[e.tag] = e.text
            elif e.tag == 'field':
                reg['fields'].append( self._parse_field(e) )
                reg['fields'][-1].baseaddr = reg['baseaddr']
            else:
                raise UnknownRegElement('Unexpected reg.tag={}'.format(e.tag))
            
        return Register(reg)
    
    def _parse_field(self, elem):
        """Parses the RDL Field componet

        Arguments:
          elem - the XML element over which to iterate"""
        field = {}
        
        for e in elem:
            if e.tag in ['id', 'shorttext', 'reset', 'lowidx', 'width', 'longtext', 'hwmod', 'singlepulse']:
                field[e.tag] = e.text if e.text else True
            elif e.tag == 'access':
                field['access'] = Access(e.text)
            elif e.tag == 'hwinfo':
                field['hwinfo'] = HwInfo(e)
            elif e.tag == 'intr':
                field['intr'] = Intr(e)
            else:
                raise UnknownFieldElement("Unexpected field.tag={}".format(e.tag))
            
        return Field(field)
    
    def _pathmap(self, comp, path=''):
        """Construct the full hierarchical paths to each register and their fields"""

        try:
            for c in comp:
                # Construct the full hierarchical path
                p = path + '_' + c.id if path else c.id
                # Update the component's path attribute
                c.path = p
                # Update the pathmap
                self.pathmap[p] = c
                # Recurse...
                self._pathmap(c,p)
        except TypeError:
            comp.path = path
            self.pathmap[path] = comp
                
    def _addressmap(self, comp):
        """Creates a flattened view of the address map by squashing any Register File components"""

        try:
            for c in comp:
                # Only update the addressmap for registers
                if c.isreg(): self.addressmap[int(c.baseaddr, 16)] = c
                self._addressmap(c)
        except TypeError:
            pass

    def _interrupts(self, comp):
        """
        Creates a dict containing all the interrupt registers for fast searching
        and creates a dependency tree of all the hierarchical interrupts.
        """

        # Search all the fields and find any interrupts
        for f in self.get_irqs():
            # Build a dict indexed by the path
            self.interrupts[f.path] = f

        # Now iterate and build the hierarchical links
        for f in self.get_irqs():
            # If it's not sticky, then it's likely a hierarchical aggregator
            if not f.isstickyirq():
                # Any nonsticky interrupt is a parent
                parent = f
                # The nextassign field points to the child
                child = parent.hwinfo.nextassign.replace('(intr)','')
                # Get all matching low level interrupt fields
                children = [ f for f in self.get_irq_by_path(to_rtl(child)) ]
                # Update the parent with all its chidren
                f.children = children
                # Update each child to point to the parent
                for child in children:
                    for f in self.get_irq_by_path(child.path):
                        f.parent = parent
                # Check if this is a top level interrupt
                if not parent.hasparent() and parent.haschildren():
                    self.toplevelirq[parent.path] = parent

    def _fields(self):
        """Returns a list of all the individual fields"""

        return flatten( [r.fields for r in self._registers()] )

    def _registers(self):
        """Returns a list of all registers"""

        return flatten( [r.registers if r.isregfile() else r for r in self.registers] )
        
if __name__ == "__main__":
    
    import argparse

    parser = argparse.ArgumentParser(description="An Ordt XML parser")
    parser.add_argument("xml_file", help="Specify the XML file to parse")
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--get_irq_inputs', action='store_true')
    group.add_argument('--get_irq_registers', action='store_true')
    group.add_argument('--get_irq_enable_registers', action='store_true')
    group.add_argument('--get_irq_by_path', action='store_true')
    group.add_argument('--print_paths', action='store_true')
    group.add_argument('--example', action='store_true', help='generate some example output data')
    parser.add_argument('--verbosity', default=0, type=int, help='specify a verbosity from 0, low, to 2, high.')
    args = parser.parse_args()

    addrmap = AddressMap(args.xml_file)

    if args.example:
        print(divider('ADDRESS MAP SUMMARY'))
        addrmap.to_s()

        print(divider('ADDRESS OF ALL REGS NAMED *irq_enable*'))
        print(addrmap.get_address_by_path('irq_enable', 1))

        print(divider('ALL INTERRUPT REGS'))
        for irq in addrmap.get_irqs():
            print(irq.to_s(1))

        print(divider('STICKY INTERRUPT REGS'))
        for irq in addrmap.get_sticky_irqs():
            print(irq.to_s(1))

        print(divider('RTL IRQ INPUTS'))
        for d1ct in addrmap.get_rtl_irq_inputs():
            print(d1ct['wire'])

        # Perform some reads/writes
        ack = addrmap.write(3,1, args.verbosity)
        [ack, value] = addrmap.read(0x0, args.verbosity)
        ack = addrmap.write(0x0,1, args.verbosity)
        [ack, value] = addrmap.read(0x0, args.verbosity)
        print(ack, value)

    if args.get_irq_inputs:
        for d1ct in addrmap.get_rtl_irq_inputs():
            print(d1ct['wire'])

    if args.get_irq_registers:
        print('\n'.join(collimate( [irq.to_s(args.verbosity) for irq in addrmap.get_irqs()] , ' ')))

    if args.get_irq_by_path:
        fields = addrmap.get_irq_by_path(args.get_irq_by_path)
        [print(f.to_s(1)) for f in fields]
        
    if args.get_irq_enable_registers:
        for f in addrmap.get_irq_enable_registers():
            print("path={} addr={} width={} idx={}".format(
                f.path, f.baseaddr, f.width, f.lowidx))
            
    if args.print_paths:
        for k,v in addrmap.pathmap.items():
            print(k)
            


    # ----------------------------------------------------------------------
    # Scratchpad
    # ----------------------------------------------------------------------

    for k,v in addrmap.addressmap.items():
        print("addr={} path={}".format(hex(k),v.path))


    reg = addrmap.get_reg_by_path('_user_irq_flags._irq_1')
    for r in reg:
        print( r.path)
    exit()

    addrmap.set_irq('h2l__sff_irq_flags__irq_14__tx4_pwr_low_warn_intr')
    status = (addrmap.get_toplevel_irq_status())
    for stat in status:
        for k,v in stat.items():
            print(k + ' : ' + str(v))
    exit()
    for path,field in addrmap.interrupts.items():
        print("\nIRQ {}".format(path))
        if field.hasparent():
            print("IRQ {} has parent '{}'".format(path, field.parent))
        if field.haschildren():
            print(field.children)
            print("IRQ {} has children '{}'".format(path, field.children))
    
    exit()
    path_0 = reg.fields[0].path
    print("'{}'".format(path_0))
    print(addrmap.get_reg_by_path(to_rtl(reg.fields[0].intr.input)))
    exit()
    for f in addrmap.get_reg_by_address(addr):
        addr = addrmap.get_address_by_path(to_rtl(f.intr.input))
        reg  = addrmap.get_reg_by_address(addr)
        print("_sff_irq_status.field={} addr={} value={}".format(f.intr.input, addr, reg.read()))

