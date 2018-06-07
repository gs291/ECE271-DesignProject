vsim work.ir_decoder

add wave *


force ir_data_in 16'h0000 @ 10ns, 16'h572f @ 1000ns, 16'h577f @ 2000ns, 16'h57bf @ 3000ns, 16'h5737 @ 4000ns, 16'h57df @ 5000ns, 16'h575f @ 6000ns, 16'h579f @ 7000ns, 16'h571f @ 8000ns, 16'h57ef @ 9000ns, 16'h576f @ 10000ns, 16'h0000 @ 11000ns

run 13000ns