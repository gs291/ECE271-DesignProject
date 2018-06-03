module button_board_Top(
input logic [7:0] buttons
output logic [15:0] button_data
);

	button_decoder(
	.buttons(buttons),
	.button_data(button_data)
	);
	
endmodule 