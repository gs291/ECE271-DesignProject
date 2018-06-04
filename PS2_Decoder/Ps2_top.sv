/***************************************
* Affiliation: Oregon State University
* Author: Cody McCall
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Design Project
* Team Number: 09
*
* Description: Ps2 Keyboard Top Module
* Start Date: 06/03/2018
*
****************************************/
module ps2_Top(
input logic ps2_data_in, clk_15khz,
output logic [15:0] ps2_data_out
);

logic [10:0} ps2_data_array;

	FSM ps2_FSM(
	.clk(clk_15khz),
	.ps2_keypress(ps2_data_in),
	);
	
	decoder ps2_decoder(
	.key_byte(ps2_data_array);
	.key_data_output(ps2_data_out);
	);

	
endmodule 