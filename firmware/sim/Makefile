
CWD=$(shell pwd)
COCOTB=~/Projects/cocotb
TOPLEVEL_LANG ?=verilog

VERILOG_SOURCES=$(CWD)/../rtl/qcw_pll.v


TOPLEVEL=qcw_pll
MODULE=$(TOPLEVEL)_cocotb

CUSTOM_SIM_DEPS=$(CWD)/Makefile


include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim

# list all required Python files here
sim: $(MODULE).py

plot: 
	plot.py


