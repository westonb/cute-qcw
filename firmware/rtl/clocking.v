`timescale 1ns/1ps

module clocking(
	input clk_80MHz_i,
	output wire clk_80MHz_o,
	output wire clk_320MHz_o,
	output wire locked_o
	);

	wire clk_80MHz_nobuff;
	wire clk_320MHz_nobuff;
	wire clk_fb_nobuff;
	wire clk_fb;

	 MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (12.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (12.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (3),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (12.500)
    )mmcm_adv_inst(
    // Output clocks
    .CLKFBOUT            (clk_fb_nobuff),
    .CLKFBOUTB           (),
    .CLKOUT0             (clk_80MHz_nobuff),
    .CLKOUT0B            (),
    .CLKOUT1             (clk_320MHz_nobuff),
    .CLKOUT1B            (),
    .CLKOUT2             (),
    .CLKOUT2B            (),
    .CLKOUT3             (),
    .CLKOUT3B            (),
    .CLKOUT4             (),
    .CLKOUT5             (),
    .CLKOUT6             (),
     // Input clock control
    .CLKFBIN             (clk_fb),
    .CLKIN1              (clk_80MHz_i),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (),
    .DRDY                (),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (),
    // Other control and status signals
    .LOCKED              (locked_o),
    .CLKINSTOPPED        (),
    .CLKFBSTOPPED        (),
    .PWRDWN              (1'b0),
    .RST                 (1'b0));

    //buffering
  BUFG clkf_buf
   (.O (clk_fb),
    .I (clk_fb_nobuff)
    );

  BUFG clkout1_buf
   (.O   (clk_80MHz_o),
    .I   (clk_80MHz_nobuff)
    );


  BUFG clkout2_buf
   (.O   (clk_320MHz_o),
    .I   (clk_320MHz_nobuff)
    );

endmodule 