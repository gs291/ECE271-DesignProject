/***************************************
* Affiliation: Oregon State University
* Author: Haolin Liu
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Button Board Decoder
* Start Date: 06/03/2018
*
****************************************/
module Ps2_decoder(
    input logic [7:0] key_byte,
    input logic clk,

    output logic [15:0] key_data_out
);

<<<<<<< HEAD
logic key_fo;
=======
logic key_fo, start_key;
>>>>>>> e4b7f01f2617dba9263e654e9e253d017ad28f95

logic initialize;

always_comb
    if(initialize != 0)
      begin
        key_data_out = 65535;
        initialize = 0;
      end
    else if(key_byte == 8'hf0)
        key_fo = 1;
    else if (key_fo == 1)
        begin
            //key_data_out = 65535; //Assigns output to all HIGH Values

            //The SNES console requires the selected button to be LOW
            case(key_byte)
                8'h1d: key_data_out[0] = 1'b1; // w for up
                8'h24: key_data_out[1] = 1'b1; // e for A
                8'h2D: key_data_out[2] = 1'b1; // r for B
                8'h2C: key_data_out[3] = 1'b1; // t for start
                8'h1C: key_data_out[4] = 1'b1; // a for left
                8'h1B: key_data_out[5] = 1'b1; // s for down
                8'h23: key_data_out[6] = 1'b1; // d for right
                8'h2B: key_data_out[7] = 1'b1; // f for select
                8'h34: key_data_out[8] = 1'b1; // g for X
                8'h35: key_data_out[9] = 1'b1; // y for Y
            endcase

            key_fo = 0;

        end
    else
        begin
            //key_data_out = 65535; //Assigns output to all HIGH Values

            //The SNES console requires the selected button to be LOW
            case(key_byte)
                8'h1d: key_data_out[0] = 1'b0; // w for up
                8'h24: key_data_out[1] = 1'b0; // e for A
                8'h2D: key_data_out[2] = 1'b0; // r for B
                8'h2C: key_data_out[3] = 1'b0; // t for start
                8'h1C: key_data_out[4] = 1'b0; // a for left
                8'h1B: key_data_out[5] = 1'b0; // s for down
                8'h23: key_data_out[6] = 1'b0; // d for right
                8'h2B: key_data_out[7] = 1'b0; // f for select
                8'h34: key_data_out[8] = 1'b0; // g for X
                8'h35: key_data_out[9] = 1'b0; // y for Y
                default: key_data_out = 16'b1111111111111111;
            endcase
        end



endmodule
