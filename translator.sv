module translator(input logic [15:0] data,
                  input logic SNES_latch,
                  input logic reset,
                  input logic SNES_clk,
                  output logic SNES_data
);

                  logic [15:0] shift_register;

always_ff @(negedge SNES_clk, posedge SNES_latch, posedge reset)
	begin
		if(reset)
			shift_register <= 0;
		else if (SNES_latch)
			shift_register <= data;
		else
			shift_register <= {shift_register[14:0], 1'bz};

		
	end
	
	assign SNES_data = shift_register[15];
	
endmodule
