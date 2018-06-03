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

    output logic [15:0] key_data_out
)


always_comb 
    begin
        case(key_byte)
            8'h1d: key_ata_out = 16'b1111111111101111; // w for up
            8'h24: key_ata_out = 16'b1111111011111111; // e for A
            8'h2D: key_ata_out = 16'b1111111111111110; // r for B
            8'h2C: key_ata_out = 16'b1111111111111011; // t fro start
            8'h1C: key_ata_out = 16'b1111111110111111; // a for left
            8'h1B: key_ata_out = 16'b1111111111011111; // s for down
            8'h23: key_ata_out = 16'b1111111101111111; // d for right
            8'h2B: key_ata_out = 16'b1111111111110111; // f fro select 
        endcase
    end

endmodule