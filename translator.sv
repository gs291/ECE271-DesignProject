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
                  output logic SNES_data);

logic send_data;
logic [3:0] count;


//On the first and only rising edge of the
//SNES_latch allow the clock to send data to the SNES
always_ff @ (posedge SNES_latch)
if(SNES_latch)
  begin
    send_data <= 1'b1;
    count <= 15;
  end

//On every falling edge of the SNES_clock send values
//For the button presses to the SNES. 
always_ff @(negedge SNES_clk,posedge reset)
begin
  if(reset)
    count <= 0;
	else if(send_data)
    begin
      case(count)
        0: SNES_data <= data[count];
        default:
          begin
          SNES_data <= data[count];
          count <= count - 1;
          end
      endcase
    end
end
endmodule
