vsim -gui work.translator

add wave *

force /translator/SNES_latch 1 0 us, 0 12 us
force /translator/SNES_clk 1 @ 0us
force /translator/data 2#1010_1111_1111_1111

run 15 ms

force /translator/SNES_clk 0 0us, 1 6us -r 12us

run 180ms
