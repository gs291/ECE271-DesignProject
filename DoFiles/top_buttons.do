vsim work.SNES_Top

add wave *

# 0 for buttons
force -deposit /SNES_Top/sel 0 @ 1

#buttons
force /SNES_Top/buttons 8'b11111111 @ 100, 8'b11111110 @ 200, 8'b11111101 @ 300, 8'b11111011 @ 400, 8'b11110111 @ 500, 8'b11101111 @ 600, 8'b11011111 @ 700, 8'b10111111 @ 800, 8'b01111111 @ 900, 8'b01111110 @ 1000

force /SNES_Top/SNES_latch 0 0 ms, 1 6 ms, 0 12 ms
force /SNES_Top/SNES_clk 0 6 ms, 1 12 ms -repeat 12 ms

run 200 ms