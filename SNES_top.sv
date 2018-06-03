/***************************************
* Affiliation: Oregon State University
* Author: Cody McCall
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Design Project
* Team Number: 09
*
* Description: Overall top module
* Start Date: 06/03/2018
*
****************************************/
module SNES_Top(
input logic [7:0] buttons,
input logic ps2_data, sel,
output logic [15:0] data_out
);

	logic clk;
	logic [15:0] button_data;
	logic [15:0] ps2_data;
	
			//This is an instance of a special, built in module that accesses our chip's oscillator
	OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz.
								//Other clock frequencies can be found in the MachX02's documentation
		.STDBY(1'b0),			//Specifies active state
		.OSC(clk),				//Outputs clock signal to 'clk' net
		.SEDSTDBY());			//Leaves SEDSTDBY pin unconnected

	clk_counter(
	.clk_i(clk)
	.clk_slow(clk_15khz)
	);
	
	mux2 SNES_controller(
	.keyboard_data()
	.button_data(button_data)
	.sel(sel)
	.SNES_data(data_out)
	);
	
	button_board_Top button_board(
	.buttons(buttons)
	.button_data(button_data)
	);
	
	ps2_Top ps2_keyboard(
	
	);
	
endmodule 