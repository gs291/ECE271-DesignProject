/***************************************
* Affiliation: Oregon State University
* Author: Gregory Sanchez
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Button Board Decoder
* Start Date: 06/03/2018
*
****************************************/

module mux2( 	input logic [15:0] keyboard_data, button_data,
				input logic sel,
				output logic [15:0] SNES_data);
				
always_comb
	begin
		case(sel)
			1'b0: SNES_data = keyboard_data;
			1'b1: SNES_data = button_data;
			
			default: SNES_data = 0;
	end
