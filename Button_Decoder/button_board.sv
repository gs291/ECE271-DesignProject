/***************************************
* Affiliation: Oregon State University
* Author: Matt Guo
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Button Board Decoder
* Start Date: 06/03/2018
*
****************************************/
module button_decoder(

	input logic [7:0] button,
	output logic [15:0] button_data


);

	parameter idle = 8'b11111111;
	parameter B = 8'b11111110;
	parameter Y = 8'b11111101;
	parameter start = 8'b11111011;
	parameter select = 8'b11110111;
	parameter up = 8'b11101111;
	parameter down = 8'b11011111;
	parameter left = 8'b10111111;
	parameter right = 8'b01111111;
	parameter A = 8'b01111110;
	parameter X = 8'b01111101;


always_comb
	begin
		case(button)
		
			idle: button_data = 16'b1111111111111111;
			B: button_data = 16'b1111111111111110;
			Y: button_data = 16'b1111111111111101;
			start: button_data = 16'b1111111111111011;
			select: button_data = 16'b1111111111110111;
			up: button_data = 16'b1111111111101111;
			down: button_data = 16'b1111111111011111;
			left: button_data = 16'b1111111110111111;
			right: button_data = 16'b1111111101111111;
			A: button_data = 16'b1111111011111111;
			X: button_data = 16'b1111110111111111;
		
		endcase
	
		
	end

endmodule
