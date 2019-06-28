export PATH:=./scripts:${PATH}
export JAVA_HOME:=/usr/lib/jvm/jre-1.8.0
export CWD=`pwd`

.PHONY: all preproc verilog

# Generate all outputs
all: preproc verilog 

# Expand any Perl macros in the RDL
preproc:
	@rdl_prepro.pl -noenv ${CWD}/rdl/regfile.rdl

# Run it
verilog:
	@ordt \
	-parms    ${CWD}/rdl/rdl.params \
	-xml      ${CWD}/xml/ordt_addrmap.xml \
	-verilog  ${CWD}/verilog/ \
	          ${CWD}/rdl/regfile.rdl.pp.final

