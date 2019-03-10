module wb_spi #(
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

	input miso,
	output reg mosi,
	output reg sclk
	);

	localparam DIV_REG_OFFSET = 0;
	localparam TX_REG_OFFSET = 4;
	localparam RX_REG_OFFSET = 8;
	localparam STATUS_REG_OFFSET = 12;
	localparam ADR_RANGE = 12;

	reg [31:0] spi_div_reg;

	reg [31:0] div_counter;

	reg [2:0] FSM_state;
	reg [3:0] bit_counter;
	reg [7:0] rx_byte;
	reg [7:0] tx_byte;
	reg transaction_done;

	wire adr_selected; 

	assign adr_selected = (BASE_ADR <= wb_adr_i) && (wb_adr_i <= (BASE_ADR + ADR_RANGE));

	always @(posedge wb_clk_i) begin

		//reset condition 
		if (wb_rst_i) begin	
			spi_div_reg <= 0;
			rx_byte <= 0;
			FSM_state <= 0;
			transaction_done <= 1;
		end
		else begin
			
			//read/write data on falling edge of clock
			case(FSM_state)

				0: begin //idle state
					sclk <= 1;
					mosi <= 1;
					div_counter <= 0;
					//mark something done here
				end

				1: begin // started, sclk goes low
					sclk <= 0;
					bit_counter <= 0;
					mosi <= tx_byte[0];
					FSM_state <= 2;
				end 

				2: begin //wait for first half of clock period
					if (div_counter < (spi_div_reg>>1)) begin
						div_counter <= div_counter+1;
					end
					else begin
						sclk <= 1;
						rx_byte[bit_counter] <= miso;
						if (bit_counter == 7) begin
							FSM_state <= 0;
							transaction_done <= 1;
						end
						else begin
							FSM_state <= 3;
							bit_counter <= bit_counter+1;
						end
					end
				end

				3: begin //wait for second half of clock period
					if (div_counter < spi_div_reg) begin
						div_counter <= div_counter+1;
					end
					else begin
						sclk <= 0;
						mosi <= tx_byte[bit_counter];
						div_counter <= 0;
						FSM_state <= 2;
					end
				end

			endcase 


			//addressing logic
			if(wb_stb_i && adr_selected) begin
				case(wb_adr_i)
					(BASE_ADR + DIV_REG_OFFSET): begin
						if(wb_we_i) spi_div_reg <= wb_dat_i;
						wb_dat_o <= spi_div_reg;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + TX_REG_OFFSET): begin
						if(wb_we_i) begin
							FSM_state <= 1;
							transaction_done <= 0;
							tx_byte <= wb_dat_i[7:0];
						end
						wb_dat_o <= 32'b0;
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + RX_REG_OFFSET): begin
						//no writes
						wb_dat_o <= {24'b0, rx_byte};
						wb_ack_o <= 1'b1;
					end

					(BASE_ADR + STATUS_REG_OFFSET): begin
						 //no writes
						wb_dat_o <= transaction_done ? ~32'b0 : 32'b0;
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

	//uart logic 
	always @(posedge wb_clk_i) begin

	end
endmodule