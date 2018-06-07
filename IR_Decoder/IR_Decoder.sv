/***************************************
* Affiliation: Oregon State University
* Author: Haolin Liu
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Button Board Decoder
* Start Date: 06/03/2018
*
****************************************/
module ir_decoder(
    input logic [31:0] ir_data_in,
    input logic clk,

    output logic [15:0] ir_data_out
);

always_comb 
        begin
            case(ir_data_in)
			16'h0000: ir_data_out <= 16'b1111111111111111;
			16'h572F: ir_data_out <= 16'b1111111111111110; // 0.csv
			16'h577F: ir_data_out <= 16'b1111111111111101; // 1.csv
			16'h57BF: ir_data_out <= 16'b1111111111111011; // 2.csv
			16'h573F: ir_data_out <= 16'b1111111111110111; // 3.csv
			16'h57DF: ir_data_out <= 16'b1111111111101111; // 4.csv
			16'h575F: ir_data_out <= 16'b1111111111011111; // 5.csv
			16'h579F: ir_data_out <= 16'b1111111110111111; // 6.csv
			16'h571F: ir_data_out <= 16'b1111111101111111; // 7.csv
			16'h57EF: ir_data_out <= 16'b1111111011111111; // 8.csv
			16'h576F: ir_data_out <= 16'b1111110111111111; // 9.csv
			16'h570F: ir_data_out <= 16'b1111101111111111; // unused
			16'h57AF: ir_data_out <= 16'b1111011111111111; // unused
			16'h57CF: ir_data_out <= 16'b1110111111111111; // unused
			16'h574F: ir_data_out <= 16'b1101111111111111; // unused
			16'h578F: ir_data_out <= 16'b1011111111111111; // unused
			16'h57FF: ir_data_out <= 16'b0111111111111111; // unused
			default:  ir_data_out <= 16'b1111111111111111;
		endcase
        end



endmodule