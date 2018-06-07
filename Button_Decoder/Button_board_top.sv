/***************************************
* Affiliation: Oregon State University
* Author: Cody McCall
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Design Project
* Team Number: 09
*
* Description: Button Board Top Module
* Start Date: 06/03/2018
*
****************************************/
module button_board_Top(
input logic [7:0] buttons,
output logic [15:0] button_data
);

	button_decoder button_to_onehot(
	.button(buttons),
	.button_data(button_data)
	);
	
endmodule 