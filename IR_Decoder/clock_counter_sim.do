vsim work.clock_counter

add wave *

force -deposit /clk_in 1 0, 0 {.2404us} -r .4808us
force reset 1 @ 10ns, 0 @ 20ns

run 100us