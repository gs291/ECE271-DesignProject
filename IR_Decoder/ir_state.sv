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
	
	input logic reset,
	input logic ir_data,
	output logic [31:0] ir_data_array
	
	);
	
	logic [7:0] clock_counter;
	logic clk;
	logic slow_clk;
	
	logic [7:0] counter;
	
	logic [31:0] shift_register;
	
	logic [5:0] data_count;
	
	typedef enum logic [1:0] {IDLE, COLLECT, VERIFY} statetype;
	statetype [2:0] state, nextstate;
	
	//clock divider
	OSCH #("2.08") osc_int (	
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
	
	
	
	always_ff @ (posedge slow_clk)
		state <= nextstate;
		
		
	always_comb
		begin
			
			case(state)
				
				IDLE:
					begin
						if(ir_data) 
							begin
								counter <= counter + 1;
								nextstate <= IDLE;
							end
						else if(~ir_data && counter > 18)
							begin
								counter <= 0;
								data_count <= 0;
								nextstate <= COLLECT;
							end
						else
							nextstate <= IDLE;
					end
						
				COLLECT:
					begin
					if(ir_data)
						begin
							counter <= counter + 1;
							nextstate <= COLLECT;
						end
					else 
						begin
							if(counter > 17 && counter < 24)
								begin
									counter <= 0;
									shift_register <= {shift_register[30:0], 1'b1};
									data_count <= data_count + 1;
								end
							else if (counter > 6 && counter < 16)
								begin
									counter <= 0;
									shift_register <= {shift_register[30:0], 1'b0};
									data_count <= data_count + 1;
								end
								
							if(data_count == 32)
								nextstate <= VERIFY;
							else
								nextstate <= COLLECT;
						end
					end
								
				VERIFY:
					begin
						if( shift_register[3:0]   ^ shift_register[11:8]  == 4'hF &&
							shift_register[7:4]   ^ shift_register[15:12] == 4'hF &&
							shift_register[19:16] ^ shift_register[27:24] == 4'hF &&
							shift_register[23:20] ^ shift_register[31:28] == 4'hF)
							
							begin
								data_count <= 0;
								ir_data_array = shift_register;
								nextstate <= IDLE;
								
								
							end	
							
						else
							begin
								data_count <= 0;
								nextstate <= IDLE;
								
							end
						
						
						
					end	
					
				
				default: nextstate <= IDLE;
				
				endcase
						
						
					
			
			
			
			
		end	
		
		
	
	
	
	
	
	endmodule
