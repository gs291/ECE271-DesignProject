/***************************************
* Affiliation: Oregon State University
* Author: Matt Guo
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: IR State Machine
* Start Date: 06/05/2018
*
****************************************/
module ir_FSM(
	
	input logic reset,					//takes in potential reset value from IR
	input logic ir_data,				//takes in the 1 or 0 value from the IR
	input logic slow_clk,				//takes in the slow clk value (16kHz) from the top module
	output logic [15:0] ir_data_array	//outputs the 16-bit hexadecimal value to the IR decoder
	
	);
	
	//logic [7:0] clock_counter;
	//logic clk;
	//logic slow_clk;
	
	logic [10:0] counter;
	
	logic [31:0] shift_register;
	
	logic [5:0] data_count;
	
	typedef enum logic [2:0] {IDLE, START, COLLECT, VERIFY, REPEAT} statetype;
	statetype [2:0] state, nextstate;
	
	//internal clock divider
	/*OSCH #("2.08") osc_int (	
		.STDBY(1'b0),			
		.OSC(clk),				
		.SEDSTDBY()				
	);	
	
	always_ff @ (posedge clk, posedge reset)
	begin
		if(reset) clock_counter <= 0;
		else	  clock_counter <= clock_counter + 1;
	end
	
	assign slow_clk = clock_counter[6];
	
	*/
	
	//always_ff @ (posedge slow_clk)
	always_comb
		state <= nextstate;
		
		
	//always_comb
	always_ff @ (posedge slow_clk)
		begin
			
			case(state)
				
				//checks to see if the start signal is initiated
				//if initiated, state machine will transition to the collect state
				
				IDLE:
					begin
						ir_data_array = 16'h0000;
						counter <= 0;
						nextstate <= START;
						
					end
				
				START:
					begin
						if(ir_data) 
							begin
								counter <= counter + 1;
								nextstate <= START;
							end
						else if(~ir_data && counter > 10)
							begin
								counter <= 0;
								data_count <= 0;
								nextstate <= COLLECT;
							end
						else
							nextstate <= IDLE;
					end
				
				//checks to see if the data recieved is a 1 or a 0
				//based on the length of the count
				COLLECT:
					begin
							if(data_count == 32)
								nextstate <= VERIFY;
							else
								begin
									
									if(ir_data)
						begin
							counter <= counter + 1;
							nextstate <= COLLECT;
						end
					else 
						begin
							counter <= 0;
							if(counter >= 12 && counter <= 30)
								begin
									counter <= 0;
									shift_register <= {shift_register[30:0], 1'b1};
									data_count <= data_count + 1;
								end
							else if (counter > 6 && counter < 11)
								begin
									counter <= 0;
									shift_register <= {shift_register[30:0], 1'b0};
									data_count <= data_count + 1;
								end
									
									
								end	
								nextstate <= COLLECT;
						end
					end
				//the Verify state that checks to see if the addition of one nibble and the complement
				//nibble equal 4'b1111 (F in hexadecimal)
				VERIFY:
					begin
						if( shift_register[3:0]   ^ shift_register[11:8]  == 4'hF &&
							shift_register[7:4]   ^ shift_register[15:12] == 4'hF &&
							shift_register[19:16] ^ shift_register[27:24] == 4'hF &&
							shift_register[23:20] ^ shift_register[31:28] == 4'hF)
							
							begin
								//data_count <= 0;
								
								//outputs 16-bits, ignoring the complement of the nibble counterparts
								ir_data_array[3:0] = shift_register[3:0];
								ir_data_array[7:4] = shift_register[7:4];
								ir_data_array[11:8] = shift_register[19:16];
								ir_data_array[15:12] = shift_register[23:20];

		
								nextstate <= REPEAT;
								
								
							end	
							
						else
							begin
								data_count <= 0;
								nextstate <= IDLE;
								
							end
						
						
						
					end	
					
					
				REPEAT:
					begin
						if(ir_data)
							begin
								if(counter >= 1000)
									nextstate <= IDLE;
								else if(counter >= 600)
									begin
										counter <= 0;
										nextstate <= COLLECT;
										
									end
								
							end
						else
							begin
								if(counter >= 1000)
									nextstate <= IDLE;
								else
									begin
										counter <= counter + 1;
										nextstate <= REPEAT;
									end
							end
						
						
					end
					
				
				default: nextstate <= IDLE;
				
				endcase
						
						
					
			
			
			
			
		end	
		
		
	
	
	
	
	
	endmodule