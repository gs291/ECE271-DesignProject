/***************************************
* Affiliation: Oregon State University
* Author: Matt Guo
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: PS/2 State Machine
* Start Date: 06/03/2018
*
****************************************/

module FSM(
	
	input logic clk,						//clk input from the PS/2 Keyboard
	input logic ps2_keypress,				//data input from the keyboard in serial communication
	input logic reset,						//reset input from the keyboard
	output logic [7:0] ps2_data_array		//parallel 8-bit data from the PS/2 Keyboard
	
	);
	
	logic [3:0] counter;			//counter to count to 8
	logic [7:0] shift_register;		//shift register to store the 8-bit PS/2 data
	logic parity;					//the 10th bit from the 11-bit input of the PS/2
	
	typedef enum logic [2:0]{IDLE, START, COLLECT, VERIFY, STOP} statetype;
	statetype [2:0] state, nextstate;
	
	
	
	always_comb
		begin
			if(reset) state <= IDLE;
			else 	  state <= nextstate;
		end		

	always_ff@(negedge clk)
		begin
			
			case(state)
			
				//idle state to wait for the clk signal
				IDLE: 
					begin
						counter <= 0;
						nextstate <= START;
					end
				
				//checks if the first PS/2 signal is 0
				START:
				
					begin
						if(~ps2_keypress) nextstate <= COLLECT;
						else			  nextstate <= IDLE;
					end
				
				//collects the 8-bits of information based on the keypress
				COLLECT: 
				
					begin
						
						//checks to see if all 8 bits are in the shift register
						if(counter == 8)
							begin
								parity = ps2_keypress;
								nextstate <= VERIFY;	
							end
		
						else
							begin
								counter <= counter + 1;
								shift_register <= {shift_register[6:0], ps2_keypress};
								nextstate <= COLLECT;
							end
							
					end

				//checks to see that with the parity input, there are an odd number of 1's in the data
				VERIFY: 
				
					begin
						if(^shift_register ^ parity != 1)
							nextstate <= IDLE;
						
						else
							nextstate <= STOP;
						
					end	
					
				//forwards this data to the PS/2 decoder	
				STOP: 
				
					begin
						if(~ps2_keypress)
							nextstate <= IDLE;
							
						else
							begin
								ps2_data_array = shift_register;
								nextstate <= IDLE;
							end
						
							
						
					end
					
				default: nextstate <= IDLE;
						
				endcase
						
			end
		
	
	
	
endmodule