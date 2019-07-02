export TB_HOME:=$(shell pwd)

TOPLEVEL_LANG ?= verilog
PYTHONPATH := $(TB_HOME)/../python:$(TB_HOME):$(PYTHONPATH)
SIM ?= questa

# Verilog source
VERILOG_SOURCES=$(TB_HOME)/tb.v
VERILOG_SOURCES+=$(TB_HOME)/../verilog/regfile.v
VERILOG_SOURCES+=$(TB_HOME)/../verilog/regfile_addr_map_pio.v
VERILOG_SOURCES+=$(TB_HOME)/../verilog/regfile_addr_map_jrdl_decode.v
VERILOG_SOURCES+=$(TB_HOME)/../verilog/regfile_addr_map_jrdl_logic.v

# Define the top level module name
TOPLEVEL:=tb

# Define the Python test
MODULE:=test_regfile

# 
PLUSARGS=+top_$(TOPLEVEL)

export PYTHON_BIN=python3
export PYTHONPATH
export TOPLEVEL_LANG
#export COCOTB_LOG_LEVEL=DEBUG
#export COCOTB_SCHEDULER_DEBUG
#export COCOTB_RESOLVE_X=1
#export COMPILE_ARGS=-Wall -pfileline=1
#export SIM_ARGS=-pfileline=1

include $(shell cocotb-config --makefiles)/Makefile.inc
include $(shell cocotb-config --makefiles)/Makefile.sim
