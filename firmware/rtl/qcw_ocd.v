module qcw_ocd #(
	parameter OCD_LIMIT = 500
	)(
	input wire adc_clk,
	input wire system_clk, 
	input wire reset,
	input wire qcw_start,
	input wire qcw_done,
	input wire [9:0] adc_dout,
	output reg [9:0] current_max,
	output reg qcw_halt
	);

	localparam FSM_IDLE = 0;
	localparam FSM_RUN = 1;

	initial qcw_halt = 0;
	initial current_max = 0;

	reg [9:0] adc_latched_1;
	reg [9:0] adc_latched_2;

	reg [3:0] fsm_state = 0;

	wire [9:0] adc_abs = (adc_latched_2 >= 10'b10_0000_0000) ? adc_latched_2 - 10'b10_0000_0000 : 10'b10_0000_0000 - adc_latched_2;

	always@(posedge adc_clk) begin
		adc_latched_1 <= adc_dout;
	end

	always@(posedge system_clk) begin
		adc_latched_2 <= adc_latched_1;

		if (reset) begin
			qcw_halt <= 0;
			current_max <= 0;
			fsm_state <= 0;
		end

		case (fsm_state) 
			FSM_IDLE: begin
				qcw_halt <= 0;
				fsm_state <= qcw_start ? FSM_RUN : FSM_IDLE;
				current_max <= qcw_start ? 0 : current_max;
			end

			FSM_RUN: begin
				if (adc_abs > current_max) current_max <= adc_abs;
				if (current_max >= OCD_LIMIT) begin
					qcw_halt <= 1;
					fsm_state <= FSM_IDLE; 
				end
				if (qcw_done) fsm_state <= FSM_IDLE;
			end

			default: begin
				fsm_state <= FSM_IDLE;
			end
		endcase 
	end 
endmodule 