`timescale 1ns/1ps
module qcw_osc_tb;

	reg clk_serdes;
	reg clk_logic;
	reg [23:0] period;
	reg [23:0] b_phase;
	reg latch;
	reg enable;
	reg reset; 

	wire GDT1_A;
	wire GDT1_B;
	wire GDT2_A;
	wire GDT2_B;
	
	qcw_osc uut(
		.clk_logic (clk_logic),
		.clk_serdes(clk_serdes),
		.period    (period),
		.phase_shift   (b_phase),
		.latch     (latch),
		.enable    (enable),
		.reset     (reset),
		.GDT1_A    (GDT1_A),
		.GDT1_B    (GDT1_B),
		.GDT2_A    (GDT2_A),
		.GDT2_B    (GDT2_B)
	);

	always #16 clk_logic = ~clk_logic;
	always #4 clk_serdes = ~clk_serdes;

	initial begin 
		clk_serdes = 0;
		clk_logic = 0;
		period = 7*111;
		b_phase = period >>2;
		latch = 0;
		reset = 0;
		enable = 0;
		#64;
		reset = 1;
		#64;
		reset = 0;
		#64
		enable = 1;
		latch = 1;



	end


endmodule 