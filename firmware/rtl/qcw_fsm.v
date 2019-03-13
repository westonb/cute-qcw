/*

module qcw_fsm(
	//clocks
	input wire system_clk,
	input wire pwm_clk,
	//analog data
	input wire [9:0] ADC_din,
	input wire zcs,
	input wire halt,
	//wishbone bus
	input wb_rst_i,
	input [31:0] wb_adr_i,
	input [31:0] wb_dat_i,
	input [3:0] wb_sel_i,
	input wb_we_i,
	input wb_cyc_i,
	input wb_stb_i,
	output reg wb_ack_o,
	output reg [31:0] wb_dat_o,
	//gdt outputs
	output wire GDT1_a,
	output wire GDT1_b,
	output wire GDT2_a,
	output wire GDT2_b,
	//other
	output wire started
	);
	
	localparam FSM_IDLE = 0;
	localparam FSM_START = 1;
	localparam FSM_RUN = 2;
	localparam FSM_FINISH = 3;

	localparam FORCE_CYCLES = 10;
	localparam FORCE_PERIOD = 1000;
	localparam FORCE_PHASE = 300;

	reg [15:0] burst_length = 0;
	reg [3:0] fsm_state = 0;

	reg nco_start;
	reg nco_load;
	reg [15:0] nco_period;
	reg [15:0] nco_phase; 

	reg pll_enable;

	reg [15:0] cycle_counter; 
	reg [23:0] period_counter; 


	//FSM and control logic
	always@(posedge system_clk) begin
		cycle_counter <= cyc_inc ? cycle_counter + 1 : cycle_counter;

		case (fsm_state)
			FSM_IDLE: begin //wait for other logic to start
				cycle_counter <= 16'b0;
			end

			FSM_START1: begin //load NCO
				nco_period <= FORCE_PERIOD;
				nco_phase <= FORCE_PHASE;
				nco_load <= 1'b1;
				fsm_state <= FSM_START2;
			end

			FSM_START2: begin //wait for FORCE_CYCLES to finish
				nco_load <= 1'b0;
				nco_start <= 1'b1;
				fsm_state <= (cycle_counter == FORCE_CYCLES) ? FSM_START3 : FSM_START2;
			end

			FSM_START3: begin //start PLL 

			end






	end

	always@(posedge pwm_clk) begin

	end

endmodule


module nco_phaseshift #(
	parameter PERIOD_MIN = 16'h100,
	parameter PERIOD_MAX = 16'h2000
)(
	input wire pwm_clk,
	input wire logic_clk,
	input wire [15:0] period_next,
	input wire [15:0] phase_next,
	input wire load,
	input wire reset,
	input wire enable,
	output wire next,
	output wire phase_a,
	output wire phase_b
);
	reg [3:0] FSM_STATE = 0;

	always@(posedge logic_clk) begin

		case (FSM_STATE) 

			FSM_IDLE 

	end

	always@(posedge pwm_clk) begin 

	end


endmodule
*/