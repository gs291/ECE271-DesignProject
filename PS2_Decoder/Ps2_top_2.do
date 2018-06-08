vsim work.ps2_Top

add wave *

#clk every 100 ns
force -deposit /ps2_Top/clk_15khz 1 0, 0 {50 ns} -repeat 100

#reset at begin
force /ps2_Top/reset 1 @ 100, 0 @ 200

#keep sending 1 at begin
force /ps2_Top/ps2_data_in 1 @ 340

#code of d(23) 0 1100 0100 0 1
force /ps2_Top/ps2_data_in 0 @ 740, 1 @ 840, 0 @ 1040, 1 @ 1340, 0 @ 1440, 1 @ 1740

#code of F0 0 0000 1111 1 1
force /ps2_Top/ps2_data_in 0 @ 2540, 1 @ 3040

#code of d(23) 0 1100 0100 0 1
force /ps2_Top/ps2_data_in 0 @ 3740, 1 @ 3840, 0 @ 4040, 1 @ 4340, 0 @ 4440, 1 @ 4740

force /ps2_Top/ps2_data_in 0 @ 6000

run 6000
