vsim work.ps2_Top

add wave *

force -deposit /ps2_Top/clk_15khz 1 0, 0 {50 ns} -repeat 100

force /ps2_Top/reset 1 @ 10, 0 @ 20

force /ps2_Top/ps2_data_in 0 @ 40, 1 @ 340, 0 @ 640, 1 @ 1040, 0 @ 1210, 1 @ 1340, 0 @ 1410, 1 @ 1530, 0 @ 1670, 1 @ 1720, 0 @ 1860

run 1900
