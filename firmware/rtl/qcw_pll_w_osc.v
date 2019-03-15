`timescale 1ns/1ps
module qcw_pll_w_osc #(
	parameter STARTING_PERIOD = 1000,
	parameter FORCE_CYCLES = 10,
	parameter OUTPUT_DELAY = 20
	)(
	input wire clk, 
	input wire clk_serdes,
	input wire reset,
	input wire signal_in,
	input wire halt, 
	input wire start,
	input wire [7:0] phase_shift,
	input wire [15:0] cycle_limit,
	output reg cycle_finished,
	output reg fault,
	output wire GDT1_A,
	output wire GDT1_B,
	output wire GDT2_A,
	output wire GDT2_B,
	output reg done
	);

	localparam FSM_IDLE = 0;
	localparam FSM_START1 = 1;
	localparam FSM_START2 = 2;
	localparam FSM_START3 = 3;
	localparam FSM_RUN1 = 4;

	localparam K_GAIN = 8;

	localparam PERIOD_MIN = 100;
	localparam PERIOD_MAX = 1000;

	initial fault = 0;
	initial cycle_finished = 0;
	initial done = 0;


	reg [OUTPUT_DELAY:0] out_delay = 0;

	reg [5:0] fsm_state = 0;

	reg [15:0] cycle_counter;
	reg [15:0] latched_period_value = STARTING_PERIOD;

	reg [25:0] period_value;  


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


	reg osc_run = 0;
	reg osc_load = 0;

	reg [23:0] osc_period = 0;
	reg [23:0] osc_phase_shift = 0;


	wire osc_out_ref;
	wire osc_cycle_done;


	assign signal_out = out_delay[OUTPUT_DELAY-1];
	assign signal_out_last = out_delay[OUTPUT_DELAY];


	always@(posedge clk) begin
		out_delay <= {out_delay[OUTPUT_DELAY-1:0], osc_out_ref};
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
				osc_period <= STARTING_PERIOD;
				osc_phase_shift <= (phase_shift*STARTING_PERIOD) >> 8;
				osc_load <= 1;
				osc_enable <= 1;
				fsm_state <= FSM_START2;
			end

			FSM_START2: begin //wait for FORCE_CYCLES to finish
				fsm_state <= (cycle_counter >= FORCE_CYCLES) ? FSM_START3 : FSM_START2;
			end

			FSM_START3: begin //start phase comparator when half way though cycle
				
				phase_comp_enable <= 1;
				fsm_state <= FSM_RUN1;
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

		
		if (osc_enable) begin
			osc_run <= 1;
			if(osc_cycle_done) begin  //compute new values
				if(latch_halt) begin
					osc_run <= 0;
					fault <= 1;
					phase_comp_enable <= 0;
					fsm_state <= FSM_IDLE;
				end

				cycle_counter <= cycle_counter + 1;
				cycle_finished <= 1; 
				osc_period <= (period_value * K_GAIN)>>12;
				osc_phase_shift <= (phase_shift*((period_value * K_GAIN)>>12))>>9;
			end else begin
				cycle_finished <= 0;
			end
		end
		else begin
			osc_run <= 0;
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

 	qcw_osc osc(
	 	.clk_logic  (clk),
	 	.clk_serdes (clk_serdes),
	 	.period     (osc_period),
	 	.phase_shift(osc_phase_shift),
	 	.load      (osc_load),
	 	.enable     (osc_run),
	 	.reset      (reset),
	 	.out_ref    (osc_out_ref),
	 	.cycle_done (osc_cycle_done),
	 	.GDT1_A     (GDT1_A),
	 	.GDT1_B     (GDT1_B),
	 	.GDT2_A     (GDT2_A),
	 	.GDT2_B     (GDT2_B) 
 	);


endmodule 

