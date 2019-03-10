
clean:
	rm -rf build/*
	rm -f bitstream.bit
	rm -f bitstream.bin
	rm -rf xsim.dir/
	rm -f src/firmware.hex
	rm -f src/firmware.bin
	rm -f src/firmware.elf
	rm -f xvlog.pb
	rm -f xelab.pb
	rm -f webtalk*
	rm -f xsim*
	rm -f top_sim.wdb

all: bitstream.bit

simulate: src/firmware.hex
	xvlog --nolog rtl/*.v
	xelab --nolog -debug typical controller_top_tb -s top_sim
	xsim --nolog -g top_sim
	#vivado -mode tcl -nojournal -log sim/vivado.log -source sim.tcl
pll_simulate:
	xvlog --nolog rtl/qcw_pll.v rtl/qcw_pll_tb.v
	xelab --nolog -debug typical qcw_pll_tb -s pll_sim
	xsim --nolog -g pll_sim

bitstream.bit: src/firmware.hex
	vivado -mode tcl -nojournal -log build/vivado.log -source build.tcl

src/firmware.elf: src/sections.lds src/start.s src/firmware.c
	riscv32-unknown-elf-gcc -march=rv32i -Wl,-Bstatic,-T,src/sections.lds,--strip-debug -ffreestanding -nostdlib -o src/firmware.elf src/start.s src/firmware.c

src/firmware.bin: src/firmware.elf
	riscv32-unknown-elf-objcopy -O binary src/firmware.elf src/firmware.bin

src/firmware.hex: src/firmware.bin
	python3 makehex.py src/firmware.bin 4096 > src/firmware.hex



