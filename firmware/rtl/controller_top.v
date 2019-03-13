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
	output reg GATE1_P,
	output reg GATE1_N,
	output reg GATE2_P,
	output reg GATE2_N
	);

	//clock signals
	wire clk_80MHz, clk_160MHz;
 
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

	//QCW driver signals
	wire qcw_zcs;
	wire qcw_halt;
	wire qcw_start;
	wire [7:0] qcw_phase_shift;
	wire [15:0] qcw_cycle_limit;
	wire qcw_cycle_finished;
	wire qcw_fault;
	wire qcw_out_A;
	wire qcw_out_B;
	wire qcw_out_en;
	wire qcw_done;
	wire [9:0] qcw_current_max;

	//reset generation
	reg [31:0] reset_counter = 0;
	wire reset = ~reset_counter[31];

	assign qcw_zcs = ZCS;

	assign {ADC_CS, LED1, LED2, RELAY1, RELAY2} = gpio_o[4:0];
	assign gpio_i = 32'b0;

	always@(*) begin
		if(qcw_out_en) begin
			GATE1_P = qcw_out_A;
			GATE1_N = ~qcw_out_A;
			GATE2_P = qcw_out_B;
			GATE2_N = ~qcw_out_B;
		end
		else begin 
			GATE1_P = 0;
			GATE1_N = 0;
			GATE2_P = 0;
			GATE2_N = 0;
		end
	end

	always@(posedge clk_160MHz) begin
		reset_counter <= {reset_counter[30:0], 1'b1};
	end 

	system_clocking system_clocks (
		.clk_80MHz_i(ADC_DCO),
		.clk_80MHz_o(clk_80MHz),
		.clk_160MHz_o(clk_160MHz)
	);


	qcw_pll #(
		.STARTING_PERIOD(300),
		.FORCE_CYCLES   (10),
		.OUTPUT_DELAY   (20)
	) qcw_driver (
		.clk           (clk_160MHz),
		.signal_in     (qcw_zcs),
		.halt          (qcw_halt),
		.start         (qcw_start),
		.phase_shift   (qcw_phase_shift),
		.cycle_limit   (qcw_cycle_limit),
		.cycle_finished(qcw_cycle_finished),
		.fault         (qcw_fault),
		.out_A         (qcw_out_A),
		.out_B         (qcw_out_B),
		.out_enable    (qcw_out_en),
		.done          (qcw_done)
	);

	qcw_ocd #(
		.OCD_LIMIT(500)
	) qcw_ocd_inst (
		.adc_clk    (clk_80MHz),
		.system_clk (clk_160MHz),
		.reset      (reset),
		.qcw_start	(qcw_start),
		.qcw_done	(qcw_done),
		.adc_dout   (ADC_DATA),
		.current_max(qcw_current_max),
		.qcw_halt	(qcw_halt)
	);
	

	wb_power_interface #(
		.BASE_ADR(32'h03000000)
	) qcw_interface (
		.wb_clk_i          (clk_160MHz),
		.wb_rst_i          (reset),
		.wb_adr_i          (wb_adr),
		.wb_sel_i          (wb_sel),
		.wb_we_i           (wb_we),
		.wb_cyc_i          (wb_cyc),
		.wb_stb_i          (wb_stb),
		.wb_ack_o          (wb_ack),
		.wb_dat_i          (wb_dat_o),
		.wb_dat_o          (wb_dat_i),

		.qcw_start         (qcw_start),
		.qcw_cycle_limit   (qcw_cycle_limit),
		.qcw_phase_shift   (qcw_phase_shift),
		.qcw_done          (qcw_done),

		.qcw_cycle_finished(qcw_cycle_finished),
		.qcw_fault         (qcw_fault),
		.qcw_halt          (qcw_halt)
	);


	base_soc soc (
		.clk_i(clk_160MHz),
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
		.spi_mosi_o(ADC_SDIO),
		.spi_sclk_o(ADC_SCLK),
		.spi_miso_i(1'b0),
		.tx_o      (FIBER_TX),
		.rx_i      (FIBER_RX)
	);

	
	
endmodule
