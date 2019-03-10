module wb_gpio #(
	parameter BASE_ADR = 32'h1000000
)(
	input wb_clk_i,
	input wb_rst_i,

	input [31:0] wb_adr_i,
	input [31:0] wb_dat_i,
	input [3:0] wb_sel_i, // byte write enable
	input wb_we_i, //write enable from bus
	input wb_cyc_i, //wishbone transaction is taking place
	input wb_stb_i, //wishbone transction request

	output reg wb_ack_o, //bus request ack'ed
	output reg [31:0] wb_dat_o, //data output

	input [31:0] gpio_i,
	output [31:0] gpio_o
	);

	localparam CONFIG_REG_OFFSET = 0;
	localparam OUT_REG_OFFSET = 4;
	localparam IN_REG_OFFSET = 8;
	localparam ADR_RANGE = 8;

	reg [31:0] gpio_config_reg; //1 bit value sets as output
	reg [31:0] gpio_out_reg; //1 bit value sets output high
	reg [31:0] gpio_in_reg; //read input state

	wire adr_selected;

	assign gpio_o = gpio_out_reg;
	assign adr_selected = (BASE_ADR <= wb_adr_i) && (wb_adr_i <= (BASE_ADR + ADR_RANGE));
	/*
	genvar I;
	generate
	for (I=0; I<32; I=I+1) begin
	  assign gpio_o[I] = gpio_config_reg[I] ? gpio_out_reg[I] : 1'bz;
	end
	endgenerate
	*/

	always @(posedge wb_clk_i) begin

	//reset condition 
		if (wb_rst_i) begin	
			gpio_config_reg <= 0;
			gpio_out_reg <= 0;
			gpio_in_reg <= 0;
		end
		else begin
			gpio_in_reg <= gpio_i;
			if (wb_stb_i && adr_selected) begin
				case(wb_adr_i)
					(BASE_ADR + CONFIG_REG_OFFSET): begin
						if(wb_we_i) gpio_config_reg <= wb_dat_i;
						wb_dat_o <= gpio_config_reg;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + OUT_REG_OFFSET): begin
						if(wb_we_i) gpio_out_reg <= wb_dat_i;
						wb_dat_o <= gpio_out_reg;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + IN_REG_OFFSET): begin
						//if(wb_we_i) gpio_in_reg <= wb_dat_i; //no writes
						wb_dat_o <= gpio_in_reg;
						wb_ack_o <= 1'b1;
					end

					default: begin
						wb_ack_o <= 1'b0;
						wb_dat_o <= 32'b0;

					end
				endcase
			end
			else begin
				wb_ack_o <= 1'b0;
				wb_dat_o <= 32'b0;
			end
		end
	end
endmodule