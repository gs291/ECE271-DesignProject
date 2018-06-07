vsim -gui work.mux3

add wave *

#SNES button press B and start
force /mux3/keyboard_data 2#0110_1111_1111_1111 @ 0

#SNES button press B
force /mux3/button_data 2#0111_1111_1111_1111 @ 50

#SNES button press up, right, and a
force /mux3/ir_data 2#1111_0101_01111_1111 @ 100

#cycle through the inputs every
force /mux3/sel 2#00 @ 0, 2#01 @ 50, 2#11 @ 100 -repeat 100

run 300
