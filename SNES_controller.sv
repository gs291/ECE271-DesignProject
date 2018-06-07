/***************************************
* Affiliation: Oregon State University
* Author: Gregory Sanchez
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Data Input Multiplexer
* Start Date: 06/03/2018
*
****************************************/

module mux3(
							input logic [15:0] keyboard_data, button_data, ir_data,
							input logic [1:0] sel,

							output logic [15:0] SNES_data);

//This sends the current data input to the translator
always_comb
	begin
		case(sel)
			2'b00: SNES_data = ir_data;
			2'b01: SNES_data = keyboard_data;
			2'b10: SNES_data = button_data;

			default: SNES_data = 0;
	end
