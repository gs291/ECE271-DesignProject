/***************************************
* Affiliation: Oregon State University
* Author: Matt Guo
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Clock Counter for IR State Machine
* Start Date: 06/05/2018
*
****************************************/


module clock_counter(

	input logic reset,			//takes in active high reset from top module
	input logic clk_in,			//takes in 2.08MHz clock signal from top module
	output logic slow_clk		//outputs 16kHz clock signal to IR State Machine
);

	logic [7:0] clock_counter;	//internal clock counter
	
	
	always_ff @ (posedge clk_in, posedge reset)
	begin
		if(reset) clock_counter <= 0;
		else	  clock_counter <= clock_counter + 1;
	end
	
	assign slow_clk = clock_counter[6];

endmodule