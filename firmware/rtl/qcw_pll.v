`timescale 1ns/1ps
module qcw_pll #(
	parameter STARTING_PERIOD = 600,
	parameter FORCE_CYCLES = 10,
	parameter OUTPUT_DELAY = 20
	)(
	input wire clk, 
	input wire signal_in,
	input wire halt, 
	input wire start,
	input wire [7:0] phase_shift,
	input wire [15:0] cycle_limit,
	output reg cycle_finished,
	output reg fault,
	output wire out_A,
	output wire out_B,
	output wire out_enable,
	output reg done
	);

	localparam FSM_IDLE = 0;
	localparam FSM_START1 = 1;
	localparam FSM_START2 = 2;
	localparam FSM_START3 = 3;
	localparam FSM_RUN1 = 4;

	localparam K_GAIN = 1;

	localparam PERIOD_MIN = 100;
	localparam PERIOD_MAX = 1000;

	initial fault = 0;
	initial cycle_finished = 0;
	initial done = 0;


	reg [OUTPUT_DELAY:0] out_delay = 0;

	reg [5:0] fsm_state = 0;

	reg [15:0] cycle_counter;
	reg [15:0] period_counter;
	reg [15:0] latched_period_value = STARTING_PERIOD;
	reg [23:0] period_value;  

	reg osc_enable = 0;
	reg phase_comp_enable = 0;

	reg latch_rise_in = 0;
	reg latch_rise_out = 0;

	reg latch_halt = 0;

	reg signal_in_last;
	wire signal_out;
	wire signal_out_last;

	reg [15:0] out_B_compare_a = 0;
	reg [15:0] out_B_compare_b = STARTING_PERIOD >> 2;

	reg out_A_reg = 0;
	reg out_B_reg = 0;
	reg out_enable_reg = 0;


	assign out_A = out_A_reg;
	assign out_B = out_B_reg;
	assign out_enable = osc_enable;

	assign signal_out = out_delay[OUTPUT_DELAY-1];
	assign signal_out_last = out_delay[OUTPUT_DELAY];


	always@(posedge clk) begin
		out_delay <= {out_delay[OUTPUT_DELAY-1:0], out_A_reg};
		signal_in_last <= signal_in;

		case (fsm_state)
			FSM_IDLE: begin //wait for other logic to start
				cycle_counter <= 16'b0;
				osc_enable <= 0;
				phase_comp_enable <= 0;
				fsm_state <= start ? FSM_START1 : FSM_IDLE;
			end

			FSM_START1: begin //load period and enable osc
				done <= 0;
				fault <= 0;
				period_value <= (STARTING_PERIOD<<12)/K_GAIN;
				latched_period_value <= STARTING_PERIOD;
				osc_enable <= 1;
				fsm_state <= FSM_START2;
			end

			FSM_START2: begin //wait for FORCE_CYCLES to finish
				fsm_state <= (cycle_counter >= FORCE_CYCLES) ? FSM_START3 : FSM_START2;
			end

			FSM_START3: begin //start phase comparator when half way though cycle
				if (period_counter == (latched_period_value>>1)) begin
					phase_comp_enable <= 1;
					fsm_state <= FSM_RUN1;
				end
			end

			FSM_RUN1: begin
				latch_halt <= halt ? 1 : latch_halt;
				if (cycle_counter >= cycle_limit) begin
					osc_enable <= 0;
					phase_comp_enable <=0;
					fsm_state <= FSM_IDLE;
					done <= 1;
				end
			end
		endcase

		//counter
		if (osc_enable) begin
			//limit check
			/*
			if ((latched_period_value >= PERIOD_MAX) || (latched_period_value <= PERIOD_MIN)) begin
				osc_enable <= 0;
				phase_comp_enable <= 0;
				fault <= 1;
			end
			*/
			//counter reset
			if(period_counter >= latched_period_value) begin
				if(latch_halt) begin
					fault <= 1;
					osc_enable <= 0;
					phase_comp_enable <= 0;
					fsm_state <= FSM_IDLE;
				end
				cycle_finished <= 1;
				period_counter <= 0; 
				latched_period_value <= (period_value * K_GAIN)>>12;
				cycle_counter <= cycle_counter + 1;
				out_B_compare_a <= (phase_shift*((period_value * K_GAIN)>>12))>>9;
				out_B_compare_b <= ((phase_shift*((period_value * K_GAIN)>>12))>>9) + ((period_value * K_GAIN)>>13);
			end
			else begin
				period_counter <= period_counter + 1;
				cycle_finished <= 0;
			end

			//output signal generation
			out_A_reg <= (period_counter < (latched_period_value>>1)) ? 1 : 0;
			out_B_reg <= ((period_counter <= out_B_compare_b) && (period_counter > out_B_compare_a));

		end else begin //counter shutdown
			out_A_reg <= 0;
			out_B_reg <= 0;
			period_counter <= 0;
			cycle_counter <= 0;
		end

		//phase comparator 
		if (phase_comp_enable) begin
			if (latch_rise_in && latch_rise_out) begin
				latch_rise_in <= 0;
				latch_rise_out <= 0;
			end
			else begin
				latch_rise_in <= (!signal_in_last && signal_in) ? 1 : latch_rise_in;
				latch_rise_out <= (!signal_out_last && signal_out) ? 1 : latch_rise_out;
			end

			//if input rises first, increse frequency (decrease period)
			period_value <= (latch_rise_in && !latch_rise_out) ? period_value-1 : 
				(!latch_rise_in && latch_rise_out) ? period_value+1 : period_value;

		end else begin 
			latch_rise_in <= 0;
			latch_rise_out <= 0;
		end
	end

	`ifdef COCOTB_SIM
	initial begin
  		$dumpfile ("waveform.vcd");
		$dumpvars (0,qcw_pll);
		#1;
	end
	`endif
endmodule 

