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
);


logic key_fo; //Break code enable for Hexideciaml F0 (1111_0000)
logic [7:0] key_byte_op;

always_comb
    begin

        key_byte_op[7] = key_byte[0];
        key_byte_op[6] = key_byte[1];
        key_byte_op[5] = key_byte[2];
        key_byte_op[4] = key_byte[3];
        key_byte_op[3] = key_byte[4];
        key_byte_op[2] = key_byte[5];
        key_byte_op[1] = key_byte[6];
        key_byte_op[0] = key_byte[7];

        if(key_byte_op == 8'hf0)
            key_fo = 1;
        else if (key_fo == 1)
            begin
                //The button that was let go will be assigned to HIGH
                //if the break code was sent prior to this key_byte
                case(key_byte_op)
                    8'h2D: key_data_out[15] = 1'b1; // r for B
                    8'h35: key_data_out[14] = 1'b1; // y for Y
                    8'h2B: key_data_out[13] = 1'b1; // f for select
                    8'h2C: key_data_out[12] = 1'b1; // t for start
                    8'h1d: key_data_out[11] = 1'b1; // w for up
                    8'h1B: key_data_out[10] = 1'b1; // s for down
                    8'h1C: key_data_out[9] = 1'b1; // a for left
                    8'h23: key_data_out[8] = 1'b1; // d for right
                    8'h24: key_data_out[7] = 1'b1; // e for A
                    8'h34: key_data_out[6] = 1'b1; // g for X
                endcase

                key_fo = 0;

            end
        else
            begin
                //The SNES console requires the selected button to be LOW
                case(key_byte_op)
                    8'h2D: key_data_out[15] = 1'b0; // r for B
                    8'h35: key_data_out[14] = 1'b0; // y for Y
                    8'h2B: key_data_out[13] = 1'b0; // f for select
                    8'h2C: key_data_out[12] = 1'b0; // t for start
                    8'h1d: key_data_out[11] = 1'b0; // w for up
                    8'h1B: key_data_out[10] = 1'b0; // s for down
                    8'h1C: key_data_out[9] = 1'b0; // a for left
                    8'h23: key_data_out[8] = 1'b0; // d for right
                    8'h24: key_data_out[7] = 1'b0; // e for A
                    8'h34: key_data_out[6] = 1'b0; // g for X
                    default: key_data_out = 16'b1111111111111111;
                endcase
            end
    end



endmodule
