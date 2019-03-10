//a simple wishbone memory


module wb_memory #(
	parameter BASE_ADR = 32'h1000000,
	parameter LOG_SIZE = 14, //size in words
	parameter MEMFILE = ""
)(
	input wb_clk_i,
	input wb_rst_i,

	input [31:0] wb_adr_i,
	input [31:0] wb_dat_i,
	input [3:0] wb_sel_i,
	input wb_we_i,
	input wb_cyc_i,
	input wb_stb_i,

	output reg wb_ack_o,
	output reg [31:0] wb_dat_o
	);
	
	reg [31:0] ram[(2**LOG_SIZE-1):0];
	wire adr_selected;
	wire [LOG_SIZE:0] adr_translated;

	initial begin
	  if (MEMFILE != "") begin
	    $readmemh(MEMFILE, ram);
	  end
	end

	//check address
	assign adr_selected = (BASE_ADR <= wb_adr_i) && (wb_adr_i < (BASE_ADR + (4 * 2**LOG_SIZE)));
	assign adr_translated = wb_adr_i>>2;

	always @(posedge wb_clk_i) begin

	    if (wb_stb_i && adr_selected) begin

	    	wb_ack_o <= 1;

	    	wb_dat_o <= ram[adr_translated];

	    	if(wb_we_i) begin

		    	if(wb_sel_i[0]) begin
		        	ram[adr_translated][7:0] <= wb_dat_i[7:0];
		    	end
		    	if(wb_sel_i[1]) begin
		        	ram[adr_translated][15:8] <= wb_dat_i[15:8];
		    	end
		    	if(wb_sel_i[2]) begin
		        	ram[adr_translated][23:16] <= wb_dat_i[23:16];
		    	end
		    	if(wb_sel_i[3]) begin
		        	ram[adr_translated][31:24] <= wb_dat_i[31:24];
		    	end
	    	end
    	end
    	else begin
    		wb_ack_o <= 1'b0;
    		wb_dat_o <= 32'b0;
		end
    end        
endmodule 
