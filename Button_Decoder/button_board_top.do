vsim work.button_board_Top

add wave *

force /button_board_Top/buttons 11111111 @ 100, 11111110 @ 200, 11111101 @ 300, 11111011 @ 400, 11110111 @ 500, 11101111 @ 600, 11011111 @ 700, 10111111 @ 800, 01111111 @ 900, 01111110 @ 1000

run 1100
