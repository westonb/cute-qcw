`timescale 1ns/1ps
module controller_top_tb;
	reg [9:0] ADC_DATA;
	reg ADC_DCO;
	reg DEBUG_RX;
	reg FIBER_RX;
	reg RS485R;
	reg UVLO;
	reg ZCS;

	wire ADC_SCLK;
	wire ADC_SDIO;
	wire ADC_CS;
	wire ADC_MODE;
	wire LED1;
	wire LED2;
	wire DEBUG_TX;
	wire RS485D;
	wire RS485DE;
	wire RS485RE;
	wire RELAY1;
	wire RELAY2;
	wire GATE1_P;
	wire GATE1_N;
	wire GATE2_P;
	wire GATE2_N;


	always #10 ADC_DCO = ~ ADC_DCO;

	initial begin
		ADC_DATA = 12'b10_0010_0000;
		ADC_DCO = 0;
		DEBUG_RX = 1;
		FIBER_RX = 1;
		RS485R = 0;
		UVLO = 0;
		ZCS = 0;
	end

	controller_top uut (
		.ADC_DATA(ADC_DATA),
		.ADC_DCO (ADC_DCO),
		.ADC_SCLK(ADC_SCLK),
		.ADC_SDIO(ADC_SDIO),
		.ADC_CS  (ADC_CS),
		.ADC_MODE(ADC_MODE),
		.LED1    (LED1),
		.LED2    (LED2),
		.DEBUG_TX(DEBUG_TX),
		.DEBUG_RX(DEBUG_RX),
		.FIBER_TX(FIBER_TX),
		.FIBER_RX(FIBER_RX),
		.RS485D  (RS485D),
		.RS485DE (RS485DE),
		.RS485R  (RS485R),
		.RS485RE (RS485RE),
		.RELAY1  (RELAY1),
		.RELAY2  (RELAY2),
		.ULVO    (ULVO),
		.ZCS     (ZCS),
		.GATE1_P (GATE1_P),
		.GATE1_N (GATE1_N),
		.GATE2_P (GATE2_P),
		.GATE2_N (GATE2_N)
		);

endmodule 