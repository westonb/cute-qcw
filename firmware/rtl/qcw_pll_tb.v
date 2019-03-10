module qcw_pll_tb;

	reg clk; 
	wire signal_in;
	reg halt;
	reg start;
	reg [7:0] phase_shift;
	reg [15:0] cycle_limit;
	wire cycle_finished;
	wire fault;
	wire out_A;
	wire out_B;

	reg [7:0] phase_shift_;

	reg [1023:0] delay_reg;

	qcw_pll #(
		.STARTING_PERIOD(300),
		.FORCE_CYCLES(10),
		.OUTPUT_DELAY(5)
		)uut(
		.clk       (clk),
		.signal_in (signal_in),
		.halt          (halt),
		.start         (start),
		.phase_shift   (phase_shift_),
		.cycle_limit   (cycle_limit),
		.cycle_finished(cycle_finished),
		.fault         (fault),
		.out_A         (out_A),
		.out_B         (out_B)
	);


	assign signal_in = delay_reg[900];

	initial begin
		phase_shift_ = 0;
		clk = 0;
		delay_reg = 0;
		halt = 0;
		start = 0;
		phase_shift = 100;
		cycle_limit = 500;

		#100;
		start = 1;
		#20000;
		phase_shift = 200;
		#4000;
		phase_shift = 50;
		#4000;
		phase_shift = 10;
		#4000;
		phase_shift = 0;
		#4000;
		phase_shift = 255;

	end

	always@(posedge clk) begin
		delay_reg <= {delay_reg[1022:0], out_A};
	end

	always@(posedge cycle_finished) begin
		phase_shift_ <= phase_shift_ + 1;

	end

	always #5 clk = ~clk;



endmodule 