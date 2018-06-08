/***************************************
* Affiliation: Oregon State University
* Author: Cody McCall
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Design Project
* Team Number: 09
*
* Description: IR top module
* Start Date: 06/07/2018
*
****************************************/

module IR_top(
	input logic reset, ir_input_data, osc_clk,
	output logic [15:0] IR_output_value
);

	logic slow_clk;
	logic [15:0] ir_data_array;


	//This module is instantiated from different file, 'clock_counter.sv'
	//It will take an input 2 MHz clock, and reset
	//output the  slowed clock
	clock_counter divider(
		.reset(reset)
		.clk_in(osc_clk),
		.slow_clk(slow_clk)
	);

	//This module is instantiated from different file, 'ir_state.sv'
	//It will take an input reset, serially inptued IR data, and slowed clock
	//output the inputer IR data as a 16-bit bus.
	ir_FSM IR_data_collection(
		.reset(reset),
		.ir_data(ir_input_data),
		.slow_clk(slow_clk),
		.ir_data_array(ir_data_array)
	);

	//This module is instantiated from different file, 'IR_Decoder.sv'
	//It will take an IR data
	//output the key press as a 16-bit SNES compatible button input.
	ir_decoder IR_data_decoder(
		.ir_data_in(ir_data_array),
	    .ir_data_out(IR_output_value)
	);

endmodule
