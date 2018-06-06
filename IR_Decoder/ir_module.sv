//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Colin Murphy
// 
// Create Date:    05/25/2018
// Design Name:    
// Module Name:    ir_module
// Project Name:   
// Target Devices: MachX03LF
// Tool versions:  Lattice Diamond 3.10
// Description:    1Receives encoded IR input and simulates a key press on a controller.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ir_top( 
	input logic reset_n,
	input logic ir_i,

	output logic [15:0] data_o
);

	logic clk;
	logic clk_slow;
	
	logic ir_filtered;
	logic [4:0]ir_buffer;
	
	logic [6:0] clock_count;
	logic [11:0] sample_count;
	logic sample_reset;
	
	logic [5:0] data_count;
	
	logic [31:0] ir_shift;
	logic [15:0] ir_out;

	enum{R_IDLE, R_START, R_RECEIVE, R_VERIFY, R_LISTEN, R_REPEAT} r_state;	
	
	OSCH #("2.08") osc_int (	
		.STDBY(1'b0),			
		.OSC(clk),				
		.SEDSTDBY()				
	);			
	
	// Clock divider for 16KHz, 62.5us period
	assign clk_slow = clock_count[6];
	
	always_ff @( posedge clk, negedge reset_n )
	begin
		if ( !reset_n ) clock_count <= 0;
		else clock_count <= clock_count + 1;
	end
	
	// Noise filter for IR signal
	// waits for 3 consistent sample values  (12 samples per half of a short pulse period)
	always_ff @( posedge clk_slow, negedge reset_n )
	begin
		
		if ( !reset_n )
		begin
			ir_filtered <= 0;
			ir_buffer <= 0;
		end
		
		ir_buffer <= { ir_buffer[2:0], ir_i };
		
		if ( ir_filtered == 0 )
			if ( ir_buffer == 7 ) ir_filtered <= 1;
		if ( ir_filtered == 1 )
			if ( ir_buffer == 0 ) ir_filtered <= 0;	
	end

	// Counter for determining long vs short pulses
	always_ff @( posedge clk_slow, negedge sample_reset, negedge reset_n )
	begin
		if ( sample_reset || !reset_n ) sample_count <= 0;
		else sample_count <= sample_count + 1;
		sample_reset <= 0;
	end

	always_ff @( posedge ir_filtered )
	begin
		case(r_state)
			
			R_IDLE:	
			begin
				ir_shift = 0;
				if ( ir_filtered == 1 ) 
				begin
					r_state <= R_START;
					sample_reset <= ~sample_reset;
				end
			end
			
			R_START:
			begin
				if ( sample_count < 75 | sample_count > 120 ) r_state <= R_IDLE;
				else
				begin
					sample_reset <= ~sample_reset;
					data_count <= 0;
					r_state <= R_RECEIVE;
				end
			end
			
			R_RECEIVE:
			begin
				if ( sample_count < 16 | sample_count > 40 ) r_state <= R_IDLE;
				else
				begin
					if ( sample_count >= 32 ) ir_shift = { ir_shift[30:0], 1'b0 };
					else if ( sample_count >= 16 ) ir_shift = { ir_shift[30:0], 1'b1 };
					data_count++;
					sample_reset <= ~sample_reset;
					if ( data_count == 32 ) r_state <= R_VERIFY;
				end		
			end
			
			R_REPEAT:
			begin
				if ( sample_count < 40 | sample_count > 50 ) r_state <= R_IDLE;
				else r_state <= R_LISTEN;	
			end
			
		endcase
	end
	
	always_ff @( posedge clk_slow )
	begin	
		case( r_state )
			
			R_LISTEN:
			begin
				if ( sample_count > 850 ) r_state <= R_IDLE;
				if ( sample_count > 800 )
				begin
					if ( ir_filtered == 1 )
					begin
						sample_reset <= ~sample_reset;
						r_state <= R_REPEAT;
					end
				end
			end
			
		endcase
	end
	
	always_ff @( posedge clk )
	begin
		case( r_state )
			
			R_IDLE:
			begin
				ir_out = 16'h0000;
				sample_reset <= 0;
			end
		
			R_VERIFY:
			begin
				if ( 	
						ir_shift[31:28] ^ ir_shift[23:20] == 4'hF
					&&	ir_shift[27:24] ^ ir_shift[19:16] == 4'hF
					&&	ir_shift[15:12] ^ ir_shift[7:4] == 4'hF
					&&	ir_shift[11:8] ^ ir_shift[3:0] == 4'hF 
				)
				begin
					
					ir_out[15:12] = ir_shift[27:24];
					ir_out[11:8] = ir_shift[19:16];
					ir_out[7:4] = ir_shift[11:8];
					ir_out[3:0] = ir_shift[3:0];
					
					r_state <= R_LISTEN;
				end
				else r_state <= R_IDLE;

			end
			
		endcase
	end

	always_comb // Decoder for one-hot transmission.
	begin
		case(ir_out)
			16'h0000: data_o <= 16'b1111111111111111;
			16'h572F: data_o <= 16'b1111111111111110; // 0.csv
			16'h577F: data_o <= 16'b1111111111111101; // 1.csv
			16'h57BF: data_o <= 16'b1111111111111011; // 2.csv
			16'h573F: data_o <= 16'b1111111111110111; // 3.csv
			16'h57DF: data_o <= 16'b1111111111101111; // 4.csv
			16'h575F: data_o <= 16'b1111111111011111; // 5.csv
			16'h579F: data_o <= 16'b1111111110111111; // 6.csv
			16'h571F: data_o <= 16'b1111111101111111; // 7.csv
			16'h57EF: data_o <= 16'b1111111011111111; // 8.csv
			16'h576F: data_o <= 16'b1111110111111111; // 9.csv
			16'h570F: data_o <= 16'b1111101111111111; // unused
			16'h57AF: data_o <= 16'b1111011111111111; // unused
			16'h57CF: data_o <= 16'b1110111111111111; // unused
			16'h574F: data_o <= 16'b1101111111111111; // unused
			16'h578F: data_o <= 16'b1011111111111111; // unused
			16'h57FF: data_o <= 16'b0111111111111111; // unused
			default:  data_o <= 16'b1111111111111111;
		endcase			
	end

endmodule
