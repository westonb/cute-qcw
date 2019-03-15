`timescale 1ns/1ps
module qcw_osc (
	input wire clk_logic,
	input wire clk_serdes,
	input wire [23:0] period,
	input wire [23:0] phase_shift,
	input wire load,
	input wire enable,
	input wire reset,
	output wire out_ref,
	output wire cycle_done,
	output wire GDT1_A,
	output wire GDT1_B,
	output wire GDT2_A,
	output wire GDT2_B
);
	
	localparam FSM_IDLE = 0;
	localparam FSM_RUN = 1;

	reg [23:0] period_counter = 0;
	reg [23:0] period_latched = 0;
	reg [23:0] phase_shift_latched = 0;

	wire [23:0] compare_start_1 = 0;
	wire [23:0] compare_end_1 = period_latched >> 1;
	wire [23:0] compare_start_2 = phase_shift;
	wire [23:0] compare_end_2 = phase_shift + (period_latched>>1);

	reg [23:0] next1 = 0;
	reg [23:0] next2 = 0;
	reg [23:0] next3 = 0;
	reg [23:0] next4 = 0;
	reg [23:0] next5 = 0;
	reg [23:0] next6 = 0;
	reg [23:0] next7 = 0;
	reg [23:0] next8 = 0;

	reg [2:0] fsm_state = 0;

	reg [5:0] GDT1_A_ser = 0;
	reg [5:0] GDT1_B_ser = 0;
	reg [5:0] GDT2_A_ser = 0;
	reg [5:0] GDT2_B_ser = 0;

	reg [7:0] GDT1_A_ser_in;
	reg [7:0] GDT1_B_ser_in;
	reg [7:0] GDT2_A_ser_in;
	reg [7:0] GDT2_B_ser_in;

	reg cycle_done_reg;
	wire enable_int = enable;

	assign cycle_done = cycle_done_reg;

	assign out_ref = GDT1_A_ser_in[0];

	always@(posedge clk_logic) begin
		GDT1_A_ser_in[7] <= enable_int ? ((compare_start_1<=next1) && (next1<compare_end_1)) ? 1 : 0 : 0;
		GDT1_A_ser_in[6] <= enable_int ? ((compare_start_1<=next2) && (next2<compare_end_1)) ? 1 : 0 : 0;
		GDT1_A_ser_in[5] <= enable_int ? ((compare_start_1<=next3) && (next3<compare_end_1)) ? 1 : 0 : 0;
		GDT1_A_ser_in[4] <= enable_int ? ((compare_start_1<=next4) && (next4<compare_end_1)) ? 1 : 0 : 0;
		GDT1_A_ser_in[3] <= enable_int ? ((compare_start_1<=next5) && (next5<compare_end_1)) ? 1 : 0 : 0;
		GDT1_A_ser_in[2] <= enable_int ? ((compare_start_1<=next6) && (next6<compare_end_1)) ? 1 : 0 : 0;
		GDT1_A_ser_in[1] <= enable_int ? ((compare_start_1<=next7) && (next7<compare_end_1)) ? 1 : 0 : 0;
		GDT1_A_ser_in[0] <= enable_int ? ((compare_start_1<=next8) && (next8<compare_end_1)) ? 1 : 0 : 0;

		GDT1_B_ser_in[7] <= enable_int ? ((compare_start_1<=next1) && (next1<compare_end_1)) ? 0 : 1 : 0;
		GDT1_B_ser_in[6] <= enable_int ? ((compare_start_1<=next2) && (next2<compare_end_1)) ? 0 : 1 : 0;
		GDT1_B_ser_in[5] <= enable_int ? ((compare_start_1<=next3) && (next3<compare_end_1)) ? 0 : 1 : 0;
		GDT1_B_ser_in[4] <= enable_int ? ((compare_start_1<=next4) && (next4<compare_end_1)) ? 0 : 1 : 0;
		GDT1_B_ser_in[3] <= enable_int ? ((compare_start_1<=next5) && (next5<compare_end_1)) ? 0 : 1 : 0;
		GDT1_B_ser_in[2] <= enable_int ? ((compare_start_1<=next6) && (next6<compare_end_1)) ? 0 : 1 : 0;
		GDT1_B_ser_in[1] <= enable_int ? ((compare_start_1<=next7) && (next7<compare_end_1)) ? 0 : 1 : 0;
		GDT1_B_ser_in[0] <= enable_int ? ((compare_start_1<=next8) && (next8<compare_end_1)) ? 0 : 1 : 0;

		GDT2_A_ser_in[7] <= enable_int ? ((compare_start_2<=next1) && (next1<compare_end_2)) ? 1 : 0 : 0;
		GDT2_A_ser_in[6] <= enable_int ? ((compare_start_2<=next2) && (next2<compare_end_2)) ? 1 : 0 : 0;
		GDT2_A_ser_in[5] <= enable_int ? ((compare_start_2<=next3) && (next3<compare_end_2)) ? 1 : 0 : 0;
		GDT2_A_ser_in[4] <= enable_int ? ((compare_start_2<=next4) && (next4<compare_end_2)) ? 1 : 0 : 0;
		GDT2_A_ser_in[3] <= enable_int ? ((compare_start_2<=next5) && (next5<compare_end_2)) ? 1 : 0 : 0;
		GDT2_A_ser_in[2] <= enable_int ? ((compare_start_2<=next6) && (next6<compare_end_2)) ? 1 : 0 : 0;
		GDT2_A_ser_in[1] <= enable_int ? ((compare_start_2<=next7) && (next7<compare_end_2)) ? 1 : 0 : 0;
		GDT2_A_ser_in[0] <= enable_int ? ((compare_start_2<=next8) && (next8<compare_end_2)) ? 1 : 0 : 0;


		GDT2_B_ser_in[7] <= enable_int ? ((compare_start_2<=next1) && (next1<compare_end_2)) ? 0 : 1 : 0;
		GDT2_B_ser_in[6] <= enable_int ? ((compare_start_2<=next2) && (next2<compare_end_2)) ? 0 : 1 : 0;
		GDT2_B_ser_in[5] <= enable_int ? ((compare_start_2<=next3) && (next3<compare_end_2)) ? 0 : 1 : 0;
		GDT2_B_ser_in[4] <= enable_int ? ((compare_start_2<=next4) && (next4<compare_end_2)) ? 0 : 1 : 0;
		GDT2_B_ser_in[3] <= enable_int ? ((compare_start_2<=next5) && (next5<compare_end_2)) ? 0 : 1 : 0;
		GDT2_B_ser_in[2] <= enable_int ? ((compare_start_2<=next6) && (next6<compare_end_2)) ? 0 : 1 : 0;
		GDT2_B_ser_in[1] <= enable_int ? ((compare_start_2<=next7) && (next7<compare_end_2)) ? 0 : 1 : 0;
		GDT2_B_ser_in[0] <= enable_int ? ((compare_start_2<=next8) && (next8<compare_end_2)) ? 0 : 1 : 0;

	end

	always@(posedge clk_logic) begin

		if(reset) begin
			fsm_state <= FSM_IDLE;
		end
		else begin

			if(load) begin
				period_latched <= period;
				phase_shift_latched <= phase_shift;

			end

			case (fsm_state) 

			FSM_IDLE: begin

				period_counter <= 0;
				cycle_done_reg <= 0;
				if (enable) begin
					fsm_state <= FSM_RUN;
					period_latched <= period;
					phase_shift_latched <= phase_shift;
				end 
			end 

			FSM_RUN: begin

				//period counter
				if ((period_counter + 8) >= (period_latched)) begin
					period_counter <= period_counter  + 8 - period_latched;
					if (~enable) begin
						fsm_state <= FSM_IDLE;
					end
					//reload
					//period_latched <= period;
					//phase_shift_latched <= phase_shift;
					cycle_done_reg <= 1;
				end else begin
					period_counter <= period_counter + 8;
					cycle_done_reg <= 0;
				end

				next1 <= (period_counter + 1) >= period_latched ? period_counter + 1 - period_latched : period_counter + 1;
				next2 <= (period_counter + 2) >= period_latched ? period_counter + 2 - period_latched : period_counter + 2;
				next3 <= (period_counter + 3) >= period_latched ? period_counter + 3 - period_latched : period_counter + 3;
				next4 <= (period_counter + 4) >= period_latched ? period_counter + 4 - period_latched : period_counter + 4;
				next5 <= (period_counter + 5) >= period_latched ? period_counter + 5 - period_latched : period_counter + 5;
				next6 <= (period_counter + 6) >= period_latched ? period_counter + 6 - period_latched : period_counter + 6;
				next7 <= (period_counter + 7) >= period_latched ? period_counter + 7 - period_latched : period_counter + 7;
				next8 <= (period_counter + 8) >= period_latched ? period_counter + 8 - period_latched : period_counter + 8;
			end

		endcase 

		end

	end

	//SERDES A channel 
	OSERDESE2 #(
		.DATA_RATE_OQ("DDR"), // DDR, SDR
		.DATA_RATE_TQ("SDR"), // DDR, BUF, SDR
		.TRISTATE_WIDTH (1),
		.DATA_WIDTH(8), // Parallel data width (2-8,10,14)
		.INIT_OQ(1'b0), // Initial value of OQ output (1'b0,1'b1)
		.INIT_TQ(1'b0), // Initial value of TQ output (1'b0,1'b1)
		.SERDES_MODE("MASTER"), // MASTER, SLAVE
		.SRVAL_OQ(1'b0), // OQ output value when SR is used (1'b0,1'b1)
		.SRVAL_TQ(1'b0) // TQ output value when SR is used (1'b0,1'b1)
	) OSERDESE2_GDT1_A (
		.OQ(GDT1_A), // 1-bit output: Data path output
		// SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
		.CLK(clk_serdes), // 1-bit input: High speed clock
		.CLKDIV(clk_logic), // 1-bit input: Divided clock
		// D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
		.D1(GDT1_A_ser_in[7]), //fist bit down the wire
		.D2(GDT1_A_ser_in[6]),
		.D3(GDT1_A_ser_in[5]),
		.D4(GDT1_A_ser_in[4]),
		.D5(GDT1_A_ser_in[3]),
		.D6(GDT1_A_ser_in[2]),
		.D7(GDT1_A_ser_in[1]),
		.D8(GDT1_A_ser_in[0]),
		.OCE(1'b1), // 1-bit input: Output data clock enable
		.RST(reset), // 1-bit input: Reset
		//unused
		.OFB(), //unused
		.TFB(), // 1-bit output: 3-state control
		.TQ(), // 1-bit output: 3-state control
		.SHIFTOUT1(),
		.SHIFTOUT2(),
		.TBYTEOUT(), // 1-bit output: Byte group tristate
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0),
		.T1(1'b0),
		.T2(1'b0),
		.T3(1'b0),
		.T4(1'b0),
		.TBYTEIN(1'b0), // 1-bit input: Byte group tristate
		.TCE(1'b0) // 1-bit input: 3-state clock enable
	);

	//SERDES A channel 
	OSERDESE2 #(
		.DATA_RATE_OQ("DDR"), // DDR, SDR
		.DATA_RATE_TQ("SDR"), // DDR, BUF, SDR
		.TRISTATE_WIDTH (1),
		.DATA_WIDTH(8), // Parallel data width (2-8,10,14)
		.INIT_OQ(1'b0), // Initial value of OQ output (1'b0,1'b1)
		.INIT_TQ(1'b0), // Initial value of TQ output (1'b0,1'b1)
		.SERDES_MODE("MASTER"), // MASTER, SLAVE
		.SRVAL_OQ(1'b0), // OQ output value when SR is used (1'b0,1'b1)
		.SRVAL_TQ(1'b0) // TQ output value when SR is used (1'b0,1'b1)
	) OSERDESE2_GDT1_B (
		.OQ(GDT1_B), // 1-bit output: Data path output
		// SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
		.CLK(clk_serdes), // 1-bit input: High speed clock
		.CLKDIV(clk_logic), // 1-bit input: Divided clock
		// D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
		.D1(GDT1_B_ser_in[7]), //fist bit down the wire
		.D2(GDT1_B_ser_in[6]),
		.D3(GDT1_B_ser_in[5]),
		.D4(GDT1_B_ser_in[4]),
		.D5(GDT1_B_ser_in[3]),
		.D6(GDT1_B_ser_in[2]),
		.D7(GDT1_B_ser_in[1]),
		.D8(GDT1_B_ser_in[0]),
		.OCE(1'b1), // 1-bit input: Output data clock enable
		.RST(reset), // 1-bit input: Reset
		//unused
		.OFB(), //unused
		.TFB(), // 1-bit output: 3-state control
		.TQ(), // 1-bit output: 3-state control
		.SHIFTOUT1(),
		.SHIFTOUT2(),
		.TBYTEOUT(), // 1-bit output: Byte group tristate
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0),
		.T1(1'b0),
		.T2(1'b0),
		.T3(1'b0),
		.T4(1'b0),
		.TBYTEIN(1'b0), // 1-bit input: Byte group tristate
		.TCE(1'b0) // 1-bit input: 3-state clock enable
	);

	//SERDES A channel 
	OSERDESE2 #(
		.DATA_RATE_OQ("DDR"), // DDR, SDR
		.DATA_RATE_TQ("SDR"), // DDR, BUF, SDR
		.TRISTATE_WIDTH (1),
		.DATA_WIDTH(8), // Parallel data width (2-8,10,14)
		.INIT_OQ(1'b0), // Initial value of OQ output (1'b0,1'b1)
		.INIT_TQ(1'b0), // Initial value of TQ output (1'b0,1'b1)
		.SERDES_MODE("MASTER"), // MASTER, SLAVE
		.SRVAL_OQ(1'b0), // OQ output value when SR is used (1'b0,1'b1)
		.SRVAL_TQ(1'b0) // TQ output value when SR is used (1'b0,1'b1)
	) OSERDESE2_GDT2_A (
		.OQ(GDT2_A), // 1-bit output: Data path output
		// SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
		.CLK(clk_serdes), // 1-bit input: High speed clock
		.CLKDIV(clk_logic), // 1-bit input: Divided clock
		// D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
		.D1(GDT2_A_ser_in[7]), //fist bit down the wire
		.D2(GDT2_A_ser_in[6]),
		.D3(GDT2_A_ser_in[5]),
		.D4(GDT2_A_ser_in[4]),
		.D5(GDT2_A_ser_in[3]),
		.D6(GDT2_A_ser_in[2]),
		.D7(GDT2_A_ser_in[1]),
		.D8(GDT2_A_ser_in[0]),
		.OCE(1'b1), // 1-bit input: Output data clock enable
		.RST(reset), // 1-bit input: Reset
		//unused
		.OFB(), //unused
		.TFB(), // 1-bit output: 3-state control
		.TQ(), // 1-bit output: 3-state control
		.SHIFTOUT1(),
		.SHIFTOUT2(),
		.TBYTEOUT(), // 1-bit output: Byte group tristate
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0),
		.T1(1'b0),
		.T2(1'b0),
		.T3(1'b0),
		.T4(1'b0),
		.TBYTEIN(1'b0), // 1-bit input: Byte group tristate
		.TCE(1'b0) // 1-bit input: 3-state clock enable
	);

	//SERDES A channel 
	OSERDESE2 #(
		.DATA_RATE_OQ("DDR"), // DDR, SDR
		.DATA_RATE_TQ("SDR"), // DDR, BUF, SDR
		.TRISTATE_WIDTH (1),
		.DATA_WIDTH(8), // Parallel data width (2-8,10,14)
		.INIT_OQ(1'b0), // Initial value of OQ output (1'b0,1'b1)
		.INIT_TQ(1'b0), // Initial value of TQ output (1'b0,1'b1)
		.SERDES_MODE("MASTER"), // MASTER, SLAVE
		.SRVAL_OQ(1'b0), // OQ output value when SR is used (1'b0,1'b1)
		.SRVAL_TQ(1'b0) // TQ output value when SR is used (1'b0,1'b1)
	) OSERDESE2_GDT2_B (
		.OQ(GDT2_B), // 1-bit output: Data path output
		// SHIFTOUT1 / SHIFTOUT2: 1-bit (each) output: Data output expansion (1-bit each)
		.CLK(clk_serdes), // 1-bit input: High speed clock
		.CLKDIV(clk_logic), // 1-bit input: Divided clock
		// D1 - D8: 1-bit (each) input: Parallel data inputs (1-bit each)
		.D1(GDT2_B_ser_in[7]), //fist bit down the wire
		.D2(GDT2_B_ser_in[6]),
		.D3(GDT2_B_ser_in[5]),
		.D4(GDT2_B_ser_in[4]),
		.D5(GDT2_B_ser_in[3]),
		.D6(GDT2_B_ser_in[2]),
		.D7(GDT2_B_ser_in[1]),
		.D8(GDT2_B_ser_in[0]),
		.OCE(1'b1), // 1-bit input: Output data clock enable
		.RST(reset), // 1-bit input: Reset
		//unused
		.OFB(), //unused
		.TFB(), // 1-bit output: 3-state control
		.TQ(), // 1-bit output: 3-state control
		.SHIFTOUT1(),
		.SHIFTOUT2(),
		.TBYTEOUT(), // 1-bit output: Byte group tristate
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0),
		.T1(1'b0),
		.T2(1'b0),
		.T3(1'b0),
		.T4(1'b0),
		.TBYTEIN(1'b0), // 1-bit input: Byte group tristate
		.TCE(1'b0) // 1-bit input: 3-state clock enable
	);


	/*
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

	*/


endmodule
