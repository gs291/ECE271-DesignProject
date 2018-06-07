vsim work.ps2_Top

add wave *

#clk every 100 ns
force -deposit /ps2_Top/clk_15khz 1 0, 0 {50 ns} -repeat 100

#reset at begin
force /ps2_Top/reset 1 @ 10, 0 @ 20

#keep sending 1 af begin
force /ps2_Top/ps2_data_in 1 @ 340

#code of s(1C) 0 0011 1000 0 1
force /ps2_Top/ps2_data_in 0 @ 740, 1 @ 1040, 0 @ 1340, 1 @ 1740

#code of a(1B) 0 1101 1000 1 1
force /ps2_Top/ps2_data_in 0 @ 3040, 1 @ 3140, 0 @ 3340, 1 @ 3440, 0 @ 3640, 1 @ 3940

#code of F0 0 0000 1111 1 1
force /ps2_Top/ps2_data_in 0 @ 4640, 1 @ 5140

#code of a(1B) 0 1101 1000 1 1
force /ps2_Top/ps2_data_in 0 @ 6040, 1 @ 6140, 0 @ 6340, 1 @ 6440, 0 @ 6640, 1 @ 6940

#code of F0 0 0000 1111 1 1
force /ps2_Top/ps2_data_in 0 @ 8740, 1 @ 9240

#code of a(1c) 0 0011 1000 0 1
force /ps2_Top/ps2_data_in 0 @ 10040, 1 @ 10340, 0 @ 10640, 1 @ 11040

force /ps2_Top/ps2_data_in 0 @ 12000

run 12000
