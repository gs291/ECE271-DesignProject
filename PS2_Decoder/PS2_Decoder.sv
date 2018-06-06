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
)

logic key_fo;

always_comb 
    if(key_byte == F0)
        key_fo = 1;
    else if (key_fo == 1)
        begin
            case(key_byte)
                8'h1d: key_ata_out[0] = 1'b1; // w for up
                8'h24: key_ata_out[1] = 1'b1; // e for A
                8'h2D: key_ata_out[2] = 1'b1; // r for B
                8'h2C: key_ata_out[3] = 1'b1; // t fro start
                8'h1C: key_ata_out[4] = 1'b1; // a for left
                8'h1B: key_ata_out[5] = 1'b1; // s for down
                8'h23: key_ata_out[6] = 1'b1; // d for right
                8'h2B: key_ata_out[7] = 1'b1; // f fro select 
            endcase

            key_fo = 0;

        end
    else
        begin
            case(key_byte)
                8'h1d: key_ata_out[0] = 1'b0; // w for up
                8'h24: key_ata_out[1] = 1'b0; // e for A
                8'h2D: key_ata_out[2] = 1'b0; // r for B
                8'h2C: key_ata_out[3] = 1'b0; // t fro start
                8'h1C: key_ata_out[4] = 1'b0; // a for left
                8'h1B: key_ata_out[5] = 1'b0; // s for down
                8'h23: key_ata_out[6] = 1'b0; // d for right
                8'h2B: key_ata_out[7] = 1'b0; // f fro select
            endcase
        end



endmodule