/***************************************
* Affiliation: Oregon State University
* Author: Gregory Sanchez
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Serially outputs the button input(s) to
*               to the SNES console using a shift register
* Start Date: 06/03/2018
*
****************************************/
module translator(input logic [15:0] data,
                  input logic SNES_latch,
                  input logic reset,
                  input logic SNES_clk,
                  output logic SNES_data,
                  output logic [15:0] shift_register);

always_ff @(negedge SNES_clk, posedge SNES_latch, posedge reset)
if(reset)
  shift_register <= 0;
else if (SNES_latch)
  shift_register <= data;
else
  shift_register <= {shift_register[14:0], 1'bz};

assign SNES_data = shift_register[15];

endmodule
