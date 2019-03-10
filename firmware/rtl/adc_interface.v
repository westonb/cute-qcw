`timescale 1ns/1ps
//`default_nettype none
module adc_interface(
	//ADC clock domain inputs
	input wire ADC_BIT_CLK_P,
	input wire ADC_BIT_CLK_N,
	input wire ADC_FRAME_CLK_P,
	input wire ADC_FRAME_CLK_N,
	input wire [7:0] ADC_DATA_P,
	input wire [7:0] ADC_DATA_N,

	input wire clk_200MHz,
	input wire reset,
	//adc clock domain outputs
	output wire adc_frame_clk, //frame clock reconstructed from bit clock
	output wire [11:0] ADC7_dout,
	output wire [11:0] ADC6_dout,
	output wire [11:0] ADC5_dout,
	output wire [11:0] ADC4_dout,
	output wire [11:0] ADC3_dout,
	output wire [11:0] ADC2_dout,
	output wire [11:0] ADC1_dout,
	output wire [11:0] ADC0_dout,

	//calibration 
	output wire [11:0] frame_align_dout,
	output wire [11:0] bit_align_dout,

	//control inputs 
	input wire bitslip_p,
	input wire bitslip_n,
	input wire [5:0] delay_value,
	input wire delay_load
);
	
	wire adc_bit_clk;
	wire adc_bit_clk_delayed;
	//wire adc_bit_clk_delayed_inv = ~adc_bit_clk_delayed;
	wire adc_frame_ref; //frame signal from ADC frame clock pins
	wire adc_bit_clk_delayed_tmp;
	wire adc_frame_clk_serdes;


	wire [7:0] adc_serial_data; // data input from ADC after buffering 

	wire [95:0] serdes_out;

	assign ADC0_dout = serdes_out[11:0];
	assign ADC1_dout = serdes_out[23:12];
	assign ADC2_dout = serdes_out[35:24];
	assign ADC3_dout = serdes_out[47:36];
	assign ADC4_dout = serdes_out[59:48];
	assign ADC5_dout = serdes_out[71:60];
	assign ADC6_dout = serdes_out[83:72];
	assign ADC7_dout = serdes_out[95:84];

	//buffer non ADC data bus inputs
	IBUFDS#(
		.IOSTANDARD ("LVDS_25")
	)ibufds_bit_clk(
		.I(ADC_BIT_CLK_P),
    	.IB(ADC_BIT_CLK_N),
    	.O(adc_bit_clk)
  	);

  	IBUFDS#(
		.IOSTANDARD ("LVDS_25")
	)ibufds_frame_ref(
		.I(ADC_FRAME_CLK_P),
    	.IB(ADC_FRAME_CLK_N),
    	.O(adc_frame_ref)
  	);


	//clock to output
	//assign adc_frame_clk = adc_frame_clk_serdes;

	BUFG BUFG_inst (
		.O(adc_frame_clk), // 1-bit output: Clock output
		.I(adc_frame_clk_serdes) // 1-bit input: Clock input
	);
	//assign adc_frame_clk = 0;


	assign adc_bit_clk_delayed_tmp = adc_bit_clk;

    //generate frame clock
    BUFR #(
		.BUFR_DIVIDE("6"), // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
		.SIM_DEVICE("7SERIES") // Must be set to "7SERIES"
	)BUFR_frame_clk(
		.O(adc_frame_clk_serdes), // 1-bit output: Clock output port
		.CE(1'b1), // 1-bit input: Active high, clock enable (Divided modes only)
		.CLR(1'b0), // 1-bit input: Active high, asynchronous clear (Divided modes only)
		.I(adc_bit_clk_delayed_tmp) // 1-bit input: Clock buffer input driven by an IBUFG, MMCM or local interconnect
	);


	BUFIO BUFIO_inst (
		.O(adc_bit_clk_delayed), // 1-bit output: Clock output (connect to I/O clock loads).
		.I(adc_bit_clk_delayed_tmp) // 1-bit input: Clock input (connect to an IBUFG or BUFMR).
	);

    // (    * IODELAY_GROUPiiiiasdf = "bitclk_groups" *)
  	IDELAYCTRL delayctrl (
     .RDY    (),
     .REFCLK (clk_200MHz),
     .RST    (reset)
 	);
  	/*
  	//same group thing goes here
 	IDELAYE2 #(
            .CINVCTRL_SEL           ("FALSE"),            // TRUE, FALSE
            .DELAY_SRC              ("IDATAIN"),        // IDATAIN, DATAIN
            .HIGH_PERFORMANCE_MODE  ("TRUE"),             // TRUE, FALSE
            .IDELAY_TYPE            ("VAR_LOAD"),          // FIXED, VARIABLE, or VAR_LOAD
            .IDELAY_VALUE           (0),                // 0 to 31
            .REFCLK_FREQUENCY       (200.0),
            .PIPE_SEL               ("FALSE"),
            .SIGNAL_PATTERN         ("CLOCK")           // CLOCK, DATA
         )idelaye2_clk(
            .DATAOUT                (adc_bit_clk_delayed_tmp),  // Delayed clock
            .DATAIN                 (1'b0),              // Data from FPGA logic
            .C                      (adc_frame_clk_serdes), //clock input for control data
            .CE                     (1'b0),
            .INC                    (1'b0),
            .IDATAIN                (adc_bit_clk),
            .LD                     (delay_load),
            .LDPIPEEN               (1'b0),
            .REGRST                 (1'b0),
            .CNTVALUEIN             (delay_value),
            .CNTVALUEOUT            (),
            .CINVCTRL               (1'b0)
         );

		*/
    //P pair serdes for bitclk alignment
    ISERDESE2 #(
         .DATA_RATE         ("SDR"),
         .DATA_WIDTH        (6),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (1),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"), 
         .SERDES_MODE       ("MASTER"),
         .IS_CLK_INVERTED     ("0")
   	)iserdese2_p0 (
         .Q1                (bit_align_dout[11]), //in ADC MSB mode this is MSB
         .Q2                (bit_align_dout[9]),
         .Q3                (bit_align_dout[7]),
         .Q4                (bit_align_dout[5]),
         .Q5                (bit_align_dout[3]),
         .Q6                (bit_align_dout[1]),
         .Q7                (), //unused in 6x data width 
         .Q8                (),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .BITSLIP           (bitslip_p),                  // 1-bit Invoke Bitslip.
         .CE1               (1'b1),                        // 1-bit Clock enable input
         .CLK               (adc_bit_clk_delayed),                      // Fast source synchronous clock driven by BUFIO
         .CLKB              (1'b0),                      // Locally inverted fast 
         .CLKDIV            (adc_frame_clk_serdes),                             // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (adc_bit_clk),  // 1-bit Input signal from IOB 
         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
         .RST               (reset),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    	// unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ()
	);                 
   	//n pair serdes for bitclock alignment
	ISERDESE2 #(
         .DATA_RATE         ("SDR"),
         .DATA_WIDTH        (6),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (1),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"), 
         .SERDES_MODE       ("MASTER"),
         .IS_CLK_INVERTED     (1)
   	) iserdese2_n0 (
         .Q1                (bit_align_dout[10]),
         .Q2                (bit_align_dout[8]),
         .Q3                (bit_align_dout[6]),
         .Q4                (bit_align_dout[4]),
         .Q5                (bit_align_dout[2]),
         .Q6                (bit_align_dout[0]),
         .Q7                (),
         .Q8                (),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .BITSLIP           (bitslip_n),                  // 1-bit Invoke Bitslip.
         .CE1               (1'b1),                        // 1-bit Clock enable input
         .CLK               (adc_bit_clk_delayed),                      // Fast source synchronous clock driven by BUFIO
         .CLKB              (1'b0),                      // Locally inverted fast 
         .CLKDIV            (adc_frame_clk_serdes),                             // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (adc_bit_clk),  // 1-bit Input signal from IOB 
         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
         .RST               (reset),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    	// unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ()
	);                 

   	//p side SERDES for frame alignment 
	ISERDESE2 #(
         .DATA_RATE         ("SDR"),
         .DATA_WIDTH        (6),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (1),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"), 
         .SERDES_MODE       ("MASTER"),
         .IS_CLK_INVERTED     (0)
   	) iserdese2_p1 (
         .Q1                (frame_align_dout[11]),
         .Q2                (frame_align_dout[9]),
         .Q3                (frame_align_dout[7]),
         .Q4                (frame_align_dout[5]),
         .Q5                (frame_align_dout[3]),
         .Q6                (frame_align_dout[1]),
         .Q7                (),
         .Q8                (),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .BITSLIP           (bitslip_p),                  // 1-bit Invoke Bitslip.
         .CE1               (1'b1),                        // 1-bit Clock enable input
         .CLK               (adc_bit_clk_delayed),                      // Fast source synchronous clock driven by BUFIO
         .CLKB              (1'b0),                      // Locally inverted fast 
         .CLKDIV            (adc_frame_clk_serdes),                             // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (adc_frame_ref),  // 1-bit Input signal from IOB 
         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
         .RST               (reset),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    	// unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ()
	);                 

 	//n side SERDES for frame alignment 
	ISERDESE2 #(
         .DATA_RATE         ("SDR"),
         .DATA_WIDTH        (6),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (1),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"), 
         .SERDES_MODE       ("MASTER"),
         .IS_CLK_INVERTED     (1)
   	) iserdese2_n1 (
         .Q1                (frame_align_dout[10]),
         .Q2                (frame_align_dout[8]),
         .Q3                (frame_align_dout[6]),
         .Q4                (frame_align_dout[4]),
         .Q5                (frame_align_dout[2]),
         .Q6                (frame_align_dout[0]),
         .Q7                (),
         .Q8                (),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .BITSLIP           (bitslip_n),                  // 1-bit Invoke Bitslip.
         .CE1               (1'b1),                        // 1-bit Clock enable input
         .CLK               (adc_bit_clk_delayed),                      // Fast source synchronous clock driven by BUFIO
         .CLKB              (1'b0),                      // Locally inverted fast 
         .CLKDIV            (adc_frame_clk_serdes),                             // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (adc_frame_ref),  // 1-bit Input signal from IOB 
         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
         .RST               (reset),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    	// unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ()
	);                 


   	//serdes for ADC data pairs 0-7
    genvar i;
    generate 
    	for (i = 0; i < 8; i = i + 1) begin
		    // Instantiate a buffer for every bit of the data bus
		    IBUFDS #(
		    	.DIFF_TERM  ("TRUE"),             // Differential termination
		        .IOSTANDARD ("LVDS_25")
		    ) ibufds_inst (
		        .I          (ADC_DATA_P  [i]),
				.IB         (ADC_DATA_N  [i]),
				.O          (adc_serial_data[i])
		 	);

		    //P pair serdes 
		    ISERDESE2 #(
		         .DATA_RATE         ("SDR"),
		         .DATA_WIDTH        (6),
		         .INTERFACE_TYPE    ("NETWORKING"), 
		         .DYN_CLKDIV_INV_EN ("FALSE"),
		         .DYN_CLK_INV_EN    ("FALSE"),
		         .NUM_CE            (1),
		         .OFB_USED          ("FALSE"),
		         .IOBDELAY          ("NONE"), 
		         .SERDES_MODE       ("MASTER"),
		         .IS_CLK_INVERTED     (0)
		   	) iserdese2_p (
		         .Q1                (serdes_out[12*i-1]), //MSB
		         .Q2                (serdes_out[12*i-3]),
		         .Q3                (serdes_out[12*i-5]),
		         .Q4                (serdes_out[12*i-7]),
		         .Q5                (serdes_out[12*i-9]),
		         .Q6                (serdes_out[12*i-11]),
		         .Q7                (), //unused in 6 bit mode
		         .Q8                (),
		         .SHIFTOUT1         (),
		         .SHIFTOUT2         (),
		         .BITSLIP           (bitslip_p),                  // 1-bit Invoke Bitslip.
		         .CE1               (1'b1),                        // 1-bit Clock enable input
		         .CLK               (adc_bit_clk_delayed),                      // Fast source synchronous clock driven by BUFIO
		         .CLKB              (1'b0),                      // Locally inverted fast 
		         .CLKDIV            (adc_frame_clk_serdes),                             // Slow clock from BUFR.
		         .CLKDIVP           (1'b0),
		         .D                 (adc_serial_data[i]),  // 1-bit Input signal from IOB 
		         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
		         .RST               (reset),                            // 1-bit Asynchronous reset only.
		         .SHIFTIN1          (1'b0),
		         .SHIFTIN2          (1'b0),
		    	// unused connections
		         .DYNCLKDIVSEL      (1'b0),
		         .DYNCLKSEL         (1'b0),
		         .OFB               (1'b0),
		         .OCLK              (1'b0),
		         .OCLKB             (1'b0),
		         .O                 ()
			);  

		   	//n pair serdes
			ISERDESE2 #(
		         .DATA_RATE         ("SDR"),
		         .DATA_WIDTH        (6),
		         .INTERFACE_TYPE    ("NETWORKING"), 
		         .DYN_CLKDIV_INV_EN ("FALSE"),
		         .DYN_CLK_INV_EN    ("FALSE"),
		         .NUM_CE            (1),
		         .OFB_USED          ("FALSE"),
		         .IOBDELAY          ("NONE"), 
		         .SERDES_MODE       ("MASTER"),
		         .IS_CLK_INVERTED     (1)
		   	) iserdese2_n (
		         .Q1                (serdes_out[12*i-2]), //MSB-1 
		         .Q2                (serdes_out[12*i-4]),
		         .Q3                (serdes_out[12*i-6]),
		         .Q4                (serdes_out[12*i-8]),
		         .Q5                (serdes_out[12*i-10]),
		         .Q6                (serdes_out[12*i-12]),
		         .Q7                (),	//unused in 6 bit mode
		         .Q8                (),
		         .SHIFTOUT1         (),
		         .SHIFTOUT2         (),
		         .BITSLIP           (bitslip_n),                  // 1-bit Invoke Bitslip.
		         .CE1               (1'b1),                        // 1-bit Clock enable input
		         .CLK               (adc_bit_clk_delayed),                      // Fast source synchronous clock driven by BUFIO
		         .CLKB              (1'b0),                      // Locally inverted fast 
		         .CLKDIV            (adc_frame_clk_serdes),                             // Slow clock from BUFR.
		         .CLKDIVP           (1'b0),
		         .D                 (adc_serial_data[i]),  // 1-bit Input signal from IOB 
		         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
		         .RST               (reset),                            // 1-bit Asynchronous reset only.
		         .SHIFTIN1          (1'b0),
		         .SHIFTIN2          (1'b0),
		    	// unused connections
		         .DYNCLKDIVSEL      (1'b0),
		         .DYNCLKSEL         (1'b0),
		         .OFB               (1'b0),
		         .OCLK              (1'b0),
		         .OCLKB             (1'b0),
		         .O                 ()
			);
		end
   	endgenerate


endmodule