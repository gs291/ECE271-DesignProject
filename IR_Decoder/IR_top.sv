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
	
clock_counter divider(
	.clk_in(osc_clk),
	.clk_out(slow_clk)
);

ir_FSM IR_data_collection(
	.reset(reset),
	.ir_data(ir_data),
	.slow_clk(),
	.ir_data_array(ir_data_array)
);

ir_decoder IR_data_decoder(
	.ir_data_in(ir_data_array),
    .clk(),
    .ir_data_out(IR_output_value)
);

endmodule 