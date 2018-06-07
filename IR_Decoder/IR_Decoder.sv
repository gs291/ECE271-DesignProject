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
	input logic [15:0] ir_data_in, //collects data from the IR State Machine
  //  input logic clk,

	output logic [15:0] ir_data_out //outputs appropriate one hot data to the SNES
);

always_comb 
        begin
            case(ir_data_in)
			16'h572F: ir_data_out = 16'b1111111111111110;	//button 0 for B
			16'h577F: ir_data_out = 16'b1111111111111101; 	//button 1 for Y
			16'h57BF: ir_data_out = 16'b1111111111111011;   //button 2 for start
			16'h573F: ir_data_out = 16'b1111111111110111; 	//button 3 for select
			16'h57DF: ir_data_out = 16'b1111111111101111;	//button 4 for up
			16'h575F: ir_data_out = 16'b1111111111011111; 	//button 5 for down
			16'h579F: ir_data_out = 16'b1111111110111111; 	//button 6 for left
			16'h571F: ir_data_out = 16'b1111111101111111; 	//button 7 for right
			16'h57EF: ir_data_out = 16'b1111111011111111; 	//button 8 for A
			16'h576F: ir_data_out = 16'b1111110111111111; 	//button 9 for X
			default:  ir_data_out = 16'b1111111111111111;   //default to idle
		endcase
        end



endmodule
