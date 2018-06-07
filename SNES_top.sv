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
input logic [1:0] sel,
input logic ps2_keypress, ps2_clk, ir_input_data, reset, SNES_clk, SNES_latch,
output logic [15:0] data_out
);

	logic clk;
	logic [15:0] button_data;
	logic [15:0] ps2_data;
	logic [15:0] ir_data;
	logic [15:0] one_hot_data;


	OSCH #("2.08") osc_int (	//2.08 Mhz FPGA oscillator
								
		.STDBY(1'b0),			
		.OSC(clk),		        //output connected to clk net		
		.SEDSTDBY());	

	/*clk_counter(
	.clk_i(clk)
	.clk_slow(clk_15khz)
	);*/

	mux3 SNES_controller(                 //SNES_controller switches between the 3 different input devices
		.ir_data(ir_data),
		.keyboard_data(ps2_data),
		.button_data(button_data),
		.sel(sel),
		.SNES_data(one_hot_data)
	);
	
	translator SNES_converter(
		.data(one_hot_data),
		.SNES_latch(SNES_latch),
		.reset(reset),
		.SNES_clk(SNES_clk),
		.SNES_data(data_out)
	);

	button_board_Top button_board(        //module containing implimenation to collect button data
		.buttons(buttons),	              //8 bit button value
		.button_data(button_data)         //16 bit output value in one-hot encoding
	);

	ps2_Top ps2_keyboard(                 //top module to collect and process ps2 data
		.reset(reset),                    //reset for FSM
		.clk_15khz(ps2_clk),              //clock signal sent from PS2
		.ps2_data_in(ps2_keypress),       //data signal from PS2
		.ps2_data_out(ps2_data)           //16-bit one-hot output value
	);
	
	IR_top IR_sensor(                     //module to control processing and reading of IR value
	.reset(reset),                        //reset for FSM
	.ir_input_data(ir_input_data),        //Input signal from IR sensor
	.osc_clk(clk),                        //Oscillator clock signal @ 2.08 Mhz
	.IR_output_value(ir_data)             //16-bit one-hot encoded output value
	);
	
endmodule
