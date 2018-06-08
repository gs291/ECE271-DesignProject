vsim work.FSM

add wave *

#clk every 100 ns
force -deposit /FSM/clk 1 0, 300 {50 ns} -repeat 100

#reset at begin
force /FSM/reset 1 @ 100, 0 @ 200

#code of d(23) 0 1100 0100 0 1
force /FSM/ps2_keypress 0 @ 340, 1 @ 440, 0 @ 640, 1 @ 940, 0 @ 1040, 1 @ 1340

run 1800