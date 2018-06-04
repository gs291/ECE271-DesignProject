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
	
	input logic clk,
	input logic ps2_keypress,
	input logic reset,
	output logic [7:0] shift_register
	
	);
	
	logic [2:0] counter;
	logic [7:0] shift_register;
	
	typedef enum {IDLE, START, COLLECT, VERIFY, STOP} statetype;
	statetype state = IDLE;
	statetype nextstate;
	
	
	
	always_ff@(negedge clk, posedge reset)
	
		begin
			
			if(reset) state <= IDLE;
			else 	  state <= nextstate;

		
		case(state)
			
				IDLE: 
					begin
						counter <= 0;
						nextstate <= START;
					end
						
				START:
					if(!ps2_keypress) nextstate <= COLLECT;
					else			  nextstate <= IDLE;
					  
				COLLECT: 
				
					begin
						for(integer i = 1; i < 9; i = i + 1)
							shift_register[i] <= shift_register[i - 1];
							
						
						shift_register[0] <= ps2_keypress;						
						counter <= counter + 1;
						
						if(counter == 8)
							nextstate <= VERIFY;
						else
							nextstate <= COLLECT;
							
					end		
							
				VERIFY: 
					if(^shift_register != 1)
						nextstate <= IDLE;
						
					else
						nextstate <= STOP;
						
				STOP: 
				
					begin
						if(!ps2_keypress)
							ps2_data_array[0] <= shift_register[7];
							ps2_data_array[1] <= shift_register[6];
							ps2_data_array[2] <= shift_register[5];
							ps2_data_array[3] <= shift_register[4];
							ps2_data_array[4] <= shift_register[3];
							ps2_data_array[5] <= shift_register[2];
							ps2_data_array[6] <= shift_register[1];
							ps2_data_array[7] <= shift_register[0];
							shift_register <= 0;
							nextstate <= IDLE;
						
							
						
					end
						
			
			
			
			
			
			
			
			endcase
						
	
		end
	
	
endmodule