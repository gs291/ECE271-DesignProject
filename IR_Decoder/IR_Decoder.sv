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
	input logic [15:0] ir_data_in,
  //  input logic clk,

    output logic [15:0] ir_data_out
);

always_comb 
        begin
            case(ir_data_in)
			16'h572F: ir_data_out = 16'b1111111111111110;	//button 0
			16'h577F: ir_data_out = 16'b1111111111111101; 	//button 1
			16'h57BF: ir_data_out = 16'b1111111111111011;   //button 2
			16'h573F: ir_data_out = 16'b1111111111110111; 	//button 3
			16'h57DF: ir_data_out = 16'b1111111111101111;	//button 4
			16'h575F: ir_data_out = 16'b1111111111011111; 	//button 5
			16'h579F: ir_data_out = 16'b1111111110111111; 	//button 6
			16'h571F: ir_data_out = 16'b1111111101111111; 	//button 7
			16'h57EF: ir_data_out = 16'b1111111011111111; 	//button 8
			16'h576F: ir_data_out = 16'b1111110111111111; 	//button 9
			default:  ir_data_out = 16'b1111111111111111;
		endcase
        end



endmodule
