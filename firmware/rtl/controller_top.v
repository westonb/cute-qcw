`timescale 1ns/1ps
//`default_nettype none

module controller_top(
	//ADC data bus
	input wire [9:0] ADC_DATA,
	input wire ADC_DCO,
	//ADC configuration interface
	output wire ADC_SCLK, 
	output wire ADC_SDIO,
	output wire ADC_CS,
	output wire ADC_MODE,
	//debug / status
	output wire LED1,
	output wire LED2,
	output wire DEBUG_TX,
	input wire DEBUG_RX,
	//interface
	output wire FIBER_TX,
	input wire FIBER_RX,
	output wire RS485D,
	output wire RS485DE,
	input wire RS485R,
	output wire RS485RE,
	output wire RELAY1,
	output wire RELAY2,
	//comparator inputs
	input wire ULVO, 
	input wire ZCS,
	//gate drive
	output wire GATE1_P,
	output wire GATE1_N,
	output wire GATE2_P,
	output wire GATE2_N
	);

	//clock signals
	wire clk_80MHz, clk_320MHz;
 
	//wishbone signals, soc clock domain 
	wire [31:0] wb_adr;
	wire [31:0] wb_dat_i;
	wire [31:0] wb_dat_o;
	wire [3:0] wb_sel; 
	wire wb_stb;
	wire wb_ack;
	wire wb_cyc;
	wire wb_we;

	wire [31:0] gpio_i, gpio_o;

	//reset generation
	reg [31:0] reset_counter = 0;
	wire reset = ~reset_counter[31];

	always@(posedge clk_80MHz) begin
		reset_counter <= {reset_counter[30:0], 1'b1};
	end 

	clocking system_clocks (
		.clk_80MHz_i(ADC_DCO),
		.clk_80MHz_o(clk_80MHz),
		.clk_320MHz_o(clk_320MHz)
	);

	base_soc soc (
		.clk_i(clk_80MHz),
		.reset_i   (reset),
		.wb_adr_o  (wb_adr),
		.wb_dat_o  (wb_dat_o),
		.wb_dat_i  (wb_dat_i),
		.wb_we_o   (wb_we),
		.wb_sel_o  (wb_sel),
		.wb_stb_o  (wb_stb),
		.wb_ack_i  (wb_ack),
		.wb_cyc_o  (wb_cyc),
		.gpio_o    (gpio_o),
		.gpio_i    (gpio_i),
		.spi_mosi_o(ADC_CS),
		.spi_sclk_o(ADC_SCLK),
		.spi_miso_i(1'b0),
		.tx_o      (DEBUG_TX),
		.rx_i      (DEBUG_RX)
	);

	
	
   endmodule

