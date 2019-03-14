module wb_power_interface #(
	parameter BASE_ADR = 32'h1000000
	)(
	input wire wb_clk_i,
	input wire wb_rst_i,

	input wire [31:0] wb_adr_i,
	input wire [31:0] wb_dat_i,
	input wire [3:0] wb_sel_i, // byte write enable
	input wire wb_we_i, //write enable from bus
	input wire wb_cyc_i, //wishbone transaction is taking place
	input wire wb_stb_i, //wishbone transction request

	output reg wb_ack_o, //bus request ack'ed
	output reg [31:0] wb_dat_o, //data output


	output wire qcw_start,
	output wire [15:0] qcw_cycle_limit,
	output wire [7:0] qcw_phase_shift,

	input wire qcw_done,
	input wire qcw_cycle_finished,
	input wire qcw_fault,
	input wire qcw_halt,
	input wire [9:0] qcw_current

	);

	localparam ADR_RANGE = 4*6;

	localparam PHASE_START_OFFSET = 0*4;
	localparam PHASE_STEP_OFFSET = 1*4;
	localparam CYCLE_LIMIT_OFFSET = 2*4;
	localparam START_OFFSET = 3*4;
	localparam STATUS_OFFSET = 4*4;
	localparam CURRENT_OFFSET = 5*4;

	localparam FSM_IDLE = 0;
	localparam FSM_START = 1;



	reg [7:0] phase_start = 0;
	reg [15:0] phase_step = 0; 
	reg [15:0] cycle_limit = 0;
	reg start_reg = 0;
	reg [7:0] phase_value = 0;
	reg [15:0] cycle_counter = 0;

	reg [23:0] phase_accum = 0;

	reg [3:0] fsm_state = 0;

	reg qcw_done_last = 0;
	wire burst_finished;

	wire adr_selected;

	assign burst_finished = (qcw_done == 1) && (qcw_done_last == 0) ? 1 : 0;


	assign adr_selected = (BASE_ADR <= wb_adr_i) && (wb_adr_i <= (BASE_ADR + ADR_RANGE));
	assign qcw_start = start_reg;
	assign qcw_cycle_limit = cycle_limit;
	assign qcw_phase_shift = phase_value;



	always @(posedge wb_clk_i) begin
		qcw_done_last <= qcw_done;
	//reset condition 
		if (wb_rst_i) begin	
			start_reg <= 0;
			phase_start <= 0;
			phase_step <= 0;
			cycle_limit <= 0;
			fsm_state <= 0;
			phase_value <= 0;
		end
		else begin
			//FSM 
			case(fsm_state)
				(FSM_IDLE): begin
					cycle_counter <= 0;
					phase_accum <= 0;
					if(start_reg) begin
						fsm_state <= FSM_START;
						phase_value <= phase_start;
					end 
				end

				(FSM_START): begin
					if(qcw_cycle_finished) begin
						cycle_counter <= cycle_counter + 1;
						phase_accum <= phase_accum + phase_step;
						phase_value <= phase_start + (phase_accum>>8);
					end
					if(burst_finished || (cycle_counter>=cycle_limit)) begin
						fsm_state <= FSM_IDLE;
					end
				end

				default: fsm_state <= FSM_IDLE;

			endcase


			if (wb_stb_i && adr_selected) begin
				case(wb_adr_i)
					(BASE_ADR + PHASE_START_OFFSET): begin
						if(wb_we_i) phase_start <= wb_dat_i[7:0];
						wb_dat_o <= phase_start;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + PHASE_STEP_OFFSET): begin
						if(wb_we_i) phase_step <= wb_dat_i[15:0];
						wb_dat_o <= phase_step;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + CYCLE_LIMIT_OFFSET): begin
						if(wb_we_i) cycle_limit <= wb_dat_i[15:0]; 
						wb_dat_o <= cycle_limit;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + START_OFFSET): begin
						if(wb_we_i) start_reg <= wb_dat_i[0]; 
						wb_dat_o <= wb_dat_i;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + STATUS_OFFSET): begin
						wb_dat_o <= {30'b0,qcw_fault, qcw_done};
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + CURRENT_OFFSET): begin
						wb_dat_o <= {22'b0, qcw_current};
						wb_ack_o <= 0;
					end

					default: begin
						wb_ack_o <= 1'b0;
						wb_dat_o <= 32'b0;
					end
				endcase
			end
			else begin
				start_reg <= 1'b0;
				wb_ack_o <= 1'b0;
				wb_dat_o <= 32'b0;
			end
		end
	end
endmodule 