vsim work.ir_FSM

add wave *

force reset 0 @ 10ns
force -deposit /slow_clk 1 0, 0 {31.25us} -r 62.5us
force ir_data 1 @ 0, 0 @ 0.00151sec, 1 @ 0.00502sec, 0 @ 0.00596sec, 1 @ 0.00728sec, 0 @ 0.00784sec, 1 @ 0.00843sec, 0 @ 0.00946sec, 1 @ 0.0107sec, 0 @ 0.0112sec, 1 @ 0.0118sec, 0 @ 0.0128sec, 1 @ 0.0141sec, 0 @ 0.0147sec, 1 @ 0.0152sec, 0 @ 0.0158sec, 1 @ 0.0164sec, 0 @ 0.017sec, 1 @ 0.0176sec, 0 @ 0.0181sec, 1 @ 0.0187sec, 0 @ 0.0197sec, 1 @ 0.021sec, 0 @ 0.0215sec, 1 @ 0.0221sec, 0 @ 0.0231sec, 1 @ 0.0244sec, 0 @ 0.0249sec, 1 @ 0.0255sec, 0 @ 0.0265sec, 1 @ 0.0278sec, 0 @ 0.0287sec, 1 @ 0.03sec, 0 @ 0.0309sec, 1 @ 0.0323sec, 0 @ 0.0332sec, 1 @ 0.0346sec, 0 @ 0.0355sec, 1 @ 0.0368sec, 0 @ 0.0374sec, 1 @ 0.038sec, 0 @ 0.0389sec, 1 @ 0.0402sec, 0 @ 0.0408sec, 1 @ 0.0414sec, 0 @ 0.0419sec, 1 @ 0.0425sec, 0 @ 0.0431sec, 1 @ 0.0437sec, 0 @ 0.0443sec, 1 @ 0.0448sec, 0 @ 0.0454sec, 1 @ 0.046sec, 0 @ 0.0465sec, 1 @ 0.0471sec, 0 @ 0.048sec, 1 @ 0.0494sec, 0 @ 0.05sec, 1 @ 0.0505sec, 0 @ 0.0514sec, 1 @ 0.0528sec, 0 @ 0.0536sec, 1 @ 0.0551sec, 0 @ 0.0559sec, 1 @ 0.0573sec, 0 @ 0.0582sec, 1 @ 0.0596sec, 0 @ 0.0604sec, 1 @ 0.111sec, 0 @ 0.112sec, 1 @ 0.114sec, 0 @ 0.114sec

run 0.114001sec