vsim -gui work.translator

add wave *

force /translator/SNES_latch 0 0 ms, 1 6 ms, 0 12 ms
force /translator/SNES_clk 0 6 ms, 1 12 ms -repeat 12 ms

force /translator/data 2#0111_1111_1111_1111 3 ms

run 200 ms