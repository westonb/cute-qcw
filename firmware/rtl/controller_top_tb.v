`timescale 1ns/1ps
module controller_top_tb;
	reg ADC_BIT_CLK;
	reg ADC_BIT_CLK_N;
	reg ADC_FRAME_CLK;
	reg ADC_FRAME_CLK_N;
	reg [7:0] ADC_DATA;
	reg [7:0] ADC_DATA_N;
	reg FPGA_CLK;

	wire ADC_CS;
	wire ADC_MUX;
	wire ADC_SYNC;
	wire ADC_SCLK;
	wire ADC_RESET;
	wire ADC_SDATA;
	wire ADC_PDN;
	wire [11:0] OUTPUT_BUS;

	reg rx;
	wire tx;
	reg GPIO_i;
	wire GPIO_o;
	wire clk_o;


	always #10 FPGA_CLK = ~FPGA_CLK;
	always #7 ADC_FRAME_CLK = ~ADC_FRAME_CLK;

	initial begin
		ADC_BIT_CLK = 0;
		ADC_BIT_CLK_N = 0;
		ADC_FRAME_CLK = 0;
		ADC_FRAME_CLK_N = 0;
		ADC_DATA = 0;
		ADC_DATA_N = 0;
		FPGA_CLK = 0;

		rx = 0;
		GPIO_i = 0;
	end

	controller_top uut (
		.ADC_BIT_CLK    (ADC_BIT_CLK),
		.ADC_BIT_CLK_N  (ADC_BIT_CLK_N),
		.ADC_FRAME_CLK  (ADC_FRAME_CLK),
		.ADC_FRAME_CLK_N(ADC_FRAME_CLK_N),
		.ADC_DATA       (ADC_DATA),
		.ADC_DATA_N     (ADC_DATA_N),
		.ADC_CS         (ADC_CS),
		.ADC_MUX        (ADC_MUX),
		.ADC_SYNC       (ADC_SYNC),
		.ADC_SCLK       (ADC_SCLK),
		.ADC_RESET      (ADC_RESET),
		.ADC_SDATA      (ADC_SDATA),
		.ADC_PDN        (ADC_PDN),
		.FPGA_CLK       (FPGA_CLK),
		.OUTPUT_BUS     (OUTPUT_BUS),
		.DEBUG_BUS_A    (tx),
		.DEBUG_BUS_B    (rx),
		.DEBUG_BUS_C    (GPIO_o),
		.DEBUG_BUS_D    (GPIO_i),
		.DEBUG_BUS_E    (clk_o)
		);

endmodule 