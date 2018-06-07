vsim work.ps2_Top

add wave *

force -deposit /ps2_Top/clk_15khz 1 0, 0 {50 ns} -repeat 100

force /ps2_Top/reset 1 @ 10, 0 @ 20

force /ps2_Top/ps2_data_in 1 @ 340

force /ps2_Top/ps2_data_in 0 @ 640, 1 @ 1040, 0 @ 1340, 1 @ 1740

force /ps2_Top/ps2_data_in 0 @ 3040, 1 @ 3240, 0 @ 3440, 1 @ 3540, 0 @ 3740, 1 @ 4040

force /ps2_Top/ps2_data_in 0 @ 5000

run 5000