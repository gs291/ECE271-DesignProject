vsim work.FSM
add wave *

force -deposit /clk 1 0, 0 {50 ns} -repeat 100
force reset 1 @ 10, 0 @ 20
force ps2_keypress 0 @ 40, 1 @ 80, 0 @ 160, 1 @ 240, 0 @ 290, 1 @ 305, 0 @ 370, 1 @ 460, 0 @ 530, 1 @ 590, 0 @ 670, 1 @ 690, 0 @ 740, 1 @ 790, 0 @ 860, 1 @ 910, 0 @ 1010, 1 @ 1105, 0 @ 1210, 1 @ 1340, 0 @ 1410, 1 @ 1530, 0 @ 1670, 1 @ 1720, 0 @ 1860

run 1900



vsim work.FSM

add wave *

force -deposit /FSM/clk 1 0, 0 {50 ns} -repeat 100

force /FSM/reset 1 @ 10, 0 @ 20

force /FSM/ps2_keypress 1 @ 340

force /FSM/ps2_keypress 0 @ 640, 1 @ 1040, 0 @ 1340, 1 @ 1740

force /FSM/ps2_keypress 0 @ 3040, 1 @ 3240, 0 @ 3440, 1 @ 3540, 0 @ 3740, 1 @ 4040

force /FSM/ps2_keypress 0 @ 4640, 1 @ 5140

force /FSM/ps2_keypress 0 @ 6040, 1 @ 6240, 0 @ 6440, 1 @ 6540, 0 @ 6740, 1 @ 7040

force /FSM/ps2_keypress 0 @ 8640, 1 @ 9140

force /FSM/ps2_keypress 0 @ 10040, 1 @ 10340, 0 @ 10640, 1 @ 11040

force /FSM/ps2_keypress 0 @ 12000

run 12000