`timescale 1ns/1ps

module pll_simple_tb;

	reg clk; 
	wire signal_in;
	wire signal_out;
	reg ext_clk;

	reg [31:0] in_reg;
	reg [31:0] out_reg;
	integer in_pipe;
	integer out_pipe;
	integer status;
	integer counter; 

	reg [1023:0] delay_reg;

	pll_simple uut(
		.clk       (clk),
		.signal_in (signal_in),
		.signal_out(signal_out)
		);

	assign signal_in = delay_reg[900];

	initial begin
		clk = 0;
		delay_reg = 0;
		ext_clk = 0;
		counter = 0;
	end

	always@(posedge clk) begin
		delay_reg <= {delay_reg[1022:0], signal_out};
		counter = counter +1;
	end


	always #1 clk = ~clk;
	always #470 ext_clk = ~ext_clk;

endmodule 

module pll_simple(
	input wire clk, 
	input wire signal_in,
	output wire signal_out
	);

	localparam K_GAIN = 50;

	reg [31:0] period_value = 700*(1<<9)/K_GAIN;
	reg [31:0] latched_period_value = 0;  
	reg [31:0] counter_value = 0; 

	reg signal_out_last = 0;
	reg signal_in_last = 0;

	reg latch_rise_in = 0;
	reg latch_rise_out = 0;

	wire output_delayed;

	assign output_delayed = signal_out;

	assign signal_out = (counter_value < (latched_period_value>>1)) ? 1 : 0;


	always@(posedge clk) begin
		signal_out_last <= signal_out;
		signal_out_last <= signal_in;

		if(counter_value == latched_period_value) begin
			counter_value <= 0; 
			latched_period_value <= (period_value * K_GAIN)>>10;
		end
		else begin
			counter_value <= counter_value + 1;
		end

		//period_value <= (output_delayed ^ signal_in) ? period_value+1 : period_value-1;

		//if input rises first, increse frequency (decrease period)
		period_value <= latch_rise_in && !latch_rise_out ? period_value-1 : !latch_rise_in && latch_rise_out ? period_value+1 : period_value;

		if ((!signal_out) && (signal_out_last)) begin //clear on falling edge of output clock
			latch_rise_in <= 0;
			latch_rise_out <= 0; 
		end else begin
			latch_rise_out <= (signal_out && !signal_out_last) ? 1 : latch_rise_out;
			latch_rise_in <= (signal_in && !signal_in_last) ? 1 : latch_rise_in; 

		end

	end
endmodule