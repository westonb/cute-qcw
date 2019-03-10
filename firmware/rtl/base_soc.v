`timescale 1ns/1ps
//`default_nettype none

module base_soc(
	//base signals
	input wire clk_i,
	input wire reset_i, 
	//wb bus signals
	output wire [31:0] wb_adr_o,
	output wire [31:0] wb_dat_o,
	input wire [31:0] wb_dat_i,
	output wire wb_we_o,
	output wire [3:0] wb_sel_o,
	output wire wb_stb_o,
	input wire wb_ack_i,
	output wire wb_cyc_o, 
	//base peripheral signals
	output wire [31:0] gpio_o,
	input wire [31:0] gpio_i,
	output wire spi_mosi_o,
	output wire spi_sclk_o,
	input wire spi_miso_i,
	output wire tx_o,
	input wire rx_i
	);


	wire [31:0] wb_dat_i_internal;
	wire wb_ack_i_internal;

	//wb ram
	wire [31:0] wb_ram_dat_o;
	wire wb_ram_ack_o;

	//wb rom 
	wire [31:0] wb_rom_dat_o;
	wire wb_rom_ack_o;

	//wb gpio
	wire [31:0] wb_gpio_dat_o;
	wire wb_gpio_ack_o;

	//wb uart
	wire [31:0] wb_uart_dat_o;
	wire wb_uart_ack_o;

	//wb spi
	wire [31:0] wb_spi_dat_o;
	wire wb_spi_ack_o;

	assign wb_ack_i_internal = 
		wb_ack_i | wb_ram_ack_o | wb_rom_ack_o | wb_gpio_ack_o | wb_uart_ack_o | wb_spi_ack_o;
	assign wb_dat_i_internal = 
		wb_dat_i | wb_ram_dat_o | wb_rom_dat_o | wb_gpio_dat_o | wb_uart_dat_o | wb_spi_dat_o;

	picorv32_wb #(
		.ENABLE_MUL(0),
		.ENABLE_IRQ(0),
		.PROGADDR_RESET(32'h100000), //start of ROM
		.STACKADDR(32'h001000) //end of RAM
	) processor (
		.mem_instr(),
		.wb_clk_i(clk_i),
		.wb_rst_i(reset_i),
		.wbm_adr_o(wb_adr_o),
		.wbm_dat_i(wb_dat_i_internal),
		.wbm_stb_o(wb_stb_o),
		.wbm_ack_i(wb_ack_i_internal),
		.wbm_cyc_o(wb_cyc_o),
		.wbm_dat_o(wb_dat_o),
		.wbm_we_o(wb_we_o),
		.wbm_sel_o(wb_sel_o)
	);

	//wb ram, 4KB
	wb_memory #(
		.BASE_ADR(32'h00000000),
		.LOG_SIZE(10), //size in words
		.MEMFILE ("")
	) ram (
		.wb_clk_i(clk_i),
		.wb_rst_i(reset_i),
		.wb_adr_i(wb_adr_o),
		.wb_dat_i(wb_dat_o),
		.wb_sel_i(wb_sel_o),
		.wb_we_i (wb_we_o),
		.wb_cyc_i(wb_cyc_o),
		.wb_stb_i(wb_stb_o),
		.wb_ack_o(wb_ram_ack_o),
		.wb_dat_o(wb_ram_dat_o)
	);

	//wb rom, 16KB
	wb_memory #(
		.BASE_ADR(32'h00100000),
		.LOG_SIZE(12),
		.MEMFILE ("src/firmware.hex")
	) rom (
		.wb_clk_i(clk_i),
		.wb_rst_i(reset_i),
		.wb_adr_i(wb_adr_o),
		.wb_dat_i(wb_dat_o),
		.wb_sel_i(wb_sel_o),
		.wb_we_i (wb_we_o),
		.wb_cyc_i(wb_cyc_o),
		.wb_stb_i(wb_stb_o),
		.wb_ack_o(wb_rom_ack_o),
		.wb_dat_o(wb_rom_dat_o)
	);

	//wb uart 
	wb_simpleuart #(
		.BASE_ADR(32'h02000000),
		.DAT_ADR_OFFSET(32'h08),
		.DIV_ADR_OFFSET(32'h04)
	) uart (
		.wb_clk_i(clk_i),
		.wb_rst_i(reset_i),
		.wb_adr_i(wb_adr_o),
		.wb_dat_i(wb_dat_o),
		.wb_sel_i(wb_sel_o),
		.wb_we_i (wb_we_o),
		.wb_cyc_i(wb_cyc_o),
		.wb_stb_i(wb_stb_o),
		.wb_ack_o(wb_uart_ack_o),
		.wb_dat_o(wb_uart_dat_o),
		.rx      (rx_i),
		.tx      (tx_o)
	);

	//wb gpio
	wb_gpio #(
		.BASE_ADR(32'h02100000)
	) gpio (
		.wb_clk_i(clk_i),
		.wb_rst_i(reset_i),
		.wb_adr_i(wb_adr_o),
		.wb_dat_i(wb_dat_o),
		.wb_sel_i(wb_sel_o),
		.wb_we_i (wb_we_o),
		.wb_cyc_i(wb_cyc_o),
		.wb_stb_i(wb_stb_o),
		.wb_ack_o(wb_gpio_ack_o),
		.wb_dat_o(wb_gpio_dat_o),
		.gpio_i  (gpio_i),
		.gpio_o  (gpio_o)
	);

	
	//wb spi
	wb_spi #(
		.BASE_ADR(32'h02200000)
	) spi (
		.wb_clk_i(clk_i),
		.wb_rst_i(reset_i),
		.wb_adr_i(wb_adr_o),
		.wb_dat_i(wb_dat_o),
		.wb_sel_i(wb_sel_o),
		.wb_we_i (wb_we_o),
		.wb_cyc_i(wb_cyc_o),
		.wb_stb_i(wb_stb_o),
		.wb_ack_o(wb_spi_ack_o),
		.wb_dat_o(wb_spi_dat_o),
		.miso    (spi_miso_i),
		.mosi    (spi_mosi_o),
		.sclk     (spi_sclk_o)
	);


endmodule