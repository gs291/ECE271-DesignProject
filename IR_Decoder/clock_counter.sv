module clock_counter(

	input logic reset,
	output logic slow_clk
);

	logic [7:0] clock_counter;
	
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

endmodule