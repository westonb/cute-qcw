/*

module qcw_osc (
	input wire clk_logic,
	input wire clk_serdes,
	input wire [23:0] period,
	input wire [23:0] b_phase,
	input wire latch,
	input wire enable,
	input wire reset,
	output wire out_ref.
	output wire GDT1_A,
	output wire GDT1_B,
	output wire GDT2_A,
	output wire GDT2_B
);
	
	localparam FSM_IDLE = 0;
	localparam FSM_RUN = 1;

	reg [23:0] period_counter = 0;
	reg [23:0] period_latched = 0;
	reg [23:0] b_phase_latched = 0;

	wire [23:0] A_compare;
	wire [23:0] B_compare;

	reg [2:0] fsm_state = 0;

	reg [5:0] GDT1_A_ser = 0;
	reg [5:0] GDT1_B_ser = 0;
	reg [5:0] GDT2_A_ser = 0;
	reg [5:0] GDT2_B_ser = 0;

	reg [7:0] GDT1_A_ser_in;
	reg [7:0] GDT1_B_ser_in;
	reg [7:0] GDT2_A_ser_in;
	reg [7:0] GDT2TB_ser_in;

	assign A_compare = period_latched>>1;
	assign B_compare_start = b_phase;
	assign B_compare_end = b_phase + (period_latched>>1);


	always@(posedge clk_logic) begin

		if(reset) begin
			fsm_state <= FSM_IDLE;
			GDT1_A_ser <= 0;
			GDT1_B_ser <= 0;
			GDT2_A_ser <= 0;
			GDT2_B_ser <= 0;
		end

		else begin

			case (fsm_state) 

			FSM_IDLE: begin

				GDT1_A_ser <= 0;
				GDT1_B_ser <= 0;
				GDT2_A_ser <= 0;
				GDT2_B_ser <= 0;
				period_counter <= 0;

				if (enable) begin
					fsm_state <= FSM_RUN;
					period_latched <= period;
					b_phase_latched <= b_phase;
				end 
			end 

			FSM_RUN: begin

				//period counter
				if (period_counter >= (period_latched + 8)) begin
					period_counter <= period_latched + 8 - period_counter;
				end else begin
					period_counter <= period_counter + 8;
				end

				
				if(period_counter[23:3] < A_compare[23:3]) begin //output A on, output B off
					//output A on, output B off
					GDT1_A_ser <= 16;
					GDT1_B_ser <= 0;
				end
				else if (period_counter[23:3] == A_compare[23:3]) begin //transistion state
					GDT1_A_ser <= 
				
				end
				else if (period_counter[23:3] == period_latched[23:3]) begin //end state

					GDT1_A_ser <= ((period_latched[2:0] - period_counter[2:0]) == 0) ? 16 : 8 - (period_latched[2:0] - period_counter[2:0]);
					GDT1_B_ser <= 8 + (period_latched[2:0] - period_counter[2:0]);

				end
				else begin //output A off, output B on
					GDT1_A_ser <= 0;
					GDT1_B_ser <= 16;

				end 


				//output B compare 
			end

		endcase 

		end

	end


	//output serializer decoding
	always@(*) begin 
		case (GDT1_A_ser) 
			0:   GDT1_A_ser_in <= 8'b0000_0000;
			1:   GDT1_A_ser_in <= 8'b0000_0001;
			2:   GDT1_A_ser_in <= 8'b0000_0011;
			3:   GDT1_A_ser_in <= 8'b0000_0111;
			4:   GDT1_A_ser_in <= 8'b0000_1111;
			5:   GDT1_A_ser_in <= 8'b0001_1111;
			6:   GDT1_A_ser_in <= 8'b0011_1111;
			7:   GDT1_A_ser_in <= 8'b0111_1111;
			8:   GDT1_A_ser_in <= 8'b0000_0000;
			9:   GDT1_A_ser_in <= 8'b1000_0000;
			10:  GDT1_A_ser_in <= 8'b1100_0000;
			11:  GDT1_A_ser_in <= 8'b1110_0000;
			12:  GDT1_A_ser_in <= 8'b1111_0000;
			13:  GDT1_A_ser_in <= 8'b1111_1000;
			14:  GDT1_A_ser_in <= 8'b1111_1100;
			15:  GDT1_A_ser_in <= 8'b1111_1110;
			16:  GDT1_A_ser_in <= 8'b1111_1111;
			default: GDT1_A_ser_in <= 0;
		endcase 

		case (GDT1_B_ser) 
			0:   GDT1_B_ser_in <= 8'b0000_0000;
			1:   GDT1_B_ser_in <= 8'b0000_0001;
			2:   GDT1_B_ser_in <= 8'b0000_0011;
			3:   GDT1_B_ser_in <= 8'b0000_0111;
			4:   GDT1_B_ser_in <= 8'b0000_1111;
			5:   GDT1_B_ser_in <= 8'b0001_1111;
			6:   GDT1_B_ser_in <= 8'b0011_1111;
			7:   GDT1_B_ser_in <= 8'b0111_1111;
			8:   GDT1_B_ser_in <= 8'b0000_0000;
			9:   GDT1_B_ser_in <= 8'b1000_0000;
			10:  GDT1_B_ser_in <= 8'b1100_0000;
			11:  GDT1_B_ser_in <= 8'b1110_0000;
			12:  GDT1_B_ser_in <= 8'b1111_0000;
			13:  GDT1_B_ser_in <= 8'b1111_1000;
			14:  GDT1_B_ser_in <= 8'b1111_1100;
			15:  GDT1_B_ser_in <= 8'b1111_1110;
			16:  GDT1_B_ser_in <= 8'b1111_1111;
			default: GDT1_B_ser_in <= 0;
		endcase 

		case (GDT2_A_ser) 
			0:   GDT2_A_ser_in <= 8'b0000_0000;
			1:   GDT2_A_ser_in <= 8'b0000_0001;
			2:   GDT2_A_ser_in <= 8'b0000_0011;
			3:   GDT2_A_ser_in <= 8'b0000_0111;
			4:   GDT2_A_ser_in <= 8'b0000_1111;
			5:   GDT2_A_ser_in <= 8'b0001_1111;
			6:   GDT2_A_ser_in <= 8'b0011_1111;
			7:   GDT2_A_ser_in <= 8'b0111_1111;
			8:   GDT2_A_ser_in <= 8'b0000_0000;
			9:   GDT2_A_ser_in <= 8'b1000_0000;
			10:  GDT2_A_ser_in <= 8'b1100_0000;
			11:  GDT2_A_ser_in <= 8'b1110_0000;
			12:  GDT2_A_ser_in <= 8'b1111_0000;
			13:  GDT2_A_ser_in <= 8'b1111_1000;
			14:  GDT2_A_ser_in <= 8'b1111_1100;
			15:  GDT2_A_ser_in <= 8'b1111_1110;
			16:  GDT2_A_ser_in <= 8'b1111_1111;
			default: GDT2_A_ser_in <= 0;
		endcase 

		case (GDT2_B_ser) 
			0:   GDT2_B_ser_in <= 8'b0000_0000;
			1:   GDT2_B_ser_in <= 8'b0000_0001;
			2:   GDT2_B_ser_in <= 8'b0000_0011;
			3:   GDT2_B_ser_in <= 8'b0000_0111;
			4:   GDT2_B_ser_in <= 8'b0000_1111;
			5:   GDT2_B_ser_in <= 8'b0001_1111;
			6:   GDT2_B_ser_in <= 8'b0011_1111;
			7:   GDT2_B_ser_in <= 8'b0111_1111;
			8:   GDT2_B_ser_in <= 8'b0000_0000;
			9:   GDT2_B_ser_in <= 8'b1000_0000;
			10:  GDT2_B_ser_in <= 8'b1100_0000;
			11:  GDT2_B_ser_in <= 8'b1110_0000;
			12:  GDT2_B_ser_in <= 8'b1111_0000;
			13:  GDT2_B_ser_in <= 8'b1111_1000;
			14:  GDT2_B_ser_in <= 8'b1111_1100;
			15:  GDT2_B_ser_in <= 8'b1111_1110;
			16:  GDT2_B_ser_in <= 8'b1111_1111;
			default: GDT2_B_ser_in <= 0;
		endcase 
	end




endmodule
*/