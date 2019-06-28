# cocotb-regfile

An example testbench around an open-register-design-tool generated register file

# open-register-design-tool

The fork available here: https://github.com/sjalloq/open-register-design-tool has
a new Python folder under utils/ which includes a Python script that builds a
model of the register file by parsing the XML output.

For ease of running this example, the script is included in this repo under python/
but please check my repo for updates as it is currently minimally tested.

## Python Model

In order to model the register file for use in the TB scoreboard, I created the
Python script ordt_addrmap.py.  The script parses the XML outpt from Ordt and
generates a structure that mimics the SystemRDL description.  This allows the TB
to not only read/write registers, but to set IRQs and update the various levels
of hierarchy.

## Register File Config

The register file is configured using SystemRDL and then auto-generated using Ordt.
The simple example here has a number of config/status registers as well as a two
levels of hierarchal interrupts.

## Regenerating The Register File

Run `make all` from the root directory of this repo.

Note that Ordt is a Java executable and requires a specific version of the JRE.  This
is set in the Makefile.

# Testbench Structure

The testbench is written using Python and the cocotb testbench environment.  It is set
up to use Icarus by default and to run the TB, cd into the tb/ directory and run `make`.

The bringup_test in test_regfile.py enables all the interrupts, fires a random
interrupt and then handles what would be the CPU interrupt status routine to find
which one fired.

It's a simple example but it shows all the cocotb classes in action and the use of Events
to signal between coroutines.

Having the Python model auto-generated from the XML description of the regfile means that
no changes need to be made to anything but the SystemRDL when making modifications.

# Limitations and Disclaimers

The Python model of the regfile currently only implements a simple subset of the Ordt
configuration space.  Trying to do anything more complex such as more than 2 levels of
interrupt hierarchy, or accessing external decoder space, will not be handled correctly.
It works for this example which mostly covers my current usage.
