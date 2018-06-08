vsim work.SNES_Top

add wave *

# 0~10000 ps2, 10000~20000 buttons, 20000~30000 IR
force -deposit /SNES_Top/sel 0 @ 0, 1 @ 13000, 2 @ 15000


#ps2 clock every 100 ns
force /SNES_Top/ps2_clk 1 0, 0 {50 ns} -repeat 100

#reset at begin
force /SNES_Top/reset 1 @ 100, 0 @ 200

#keep sending 1 at begin
force /SNES_Top/ps2_keypress 1 @ 340

#code of s(1C) 0 0011 1000 0 1
force /SNES_Top/ps2_keypress 0 @ 740, 1 @ 1040, 0 @ 1340, 1 @ 1740

#code of a(1B) 0 1101 1000 1 1
force /SNES_Top/ps2_keypress 0 @ 3040, 1 @ 3140, 0 @ 3340, 1 @ 3440, 0 @ 3640, 1 @ 3940

#code of F0 0 0000 1111 1 1
force /SNES_Top/ps2_keypress 0 @ 4540, 1 @ 5040

#code of a(1B) 0 1101 1000 1 1
force /SNES_Top/ps2_keypress 0 @ 5740, 1 @ 5840, 0 @ 6040, 1 @ 6140, 0 @ 6340, 1 @ 6640

#code of F0 0 0000 1111 1 1
force /SNES_Top/ps2_keypress 0 @ 8740, 1 @ 9240

#code of a(1c) 0 0011 1000 0 1
force /SNES_Top/ps2_keypress 0 @ 10040, 1 @ 10340, 0 @ 10640, 1 @ 11040

force /SNES_Top/ps2_keypress 0 @ 12000


#buttons
force /SNES_Top/buttons 8'b11111111 @ 13000, 8'b11111110 @ 13200, 8'b11111101 @ 13300, 8'b11111011 @ 13400, 8'b11110111 @ 13500, 8'b11101111 @ 13600, 8'b11011111 @ 13700, 8'b10111111 @ 13800, 8'b01111111 @ 13900, 8'b01111110 @ 14000


force /SNES_Top/reset 1 @ 15010ns, 0 @ 15020ns

force /SNES_Top/ir_input_data 1 @ 0, 0 @ 0.00151sec, 1 @ 0.00502sec, 0 @ 0.00596sec, 1 @ 0.00728sec, 0 @ 0.00784sec, 1 @ 0.00843sec, 0 @ 0.00946sec, 1 @ 0.0107sec, 0 @ 0.0112sec, 1 @ 0.0118sec, 0 @ 0.0128sec, 1 @ 0.0141sec, 0 @ 0.0147sec, 1 @ 0.0152sec, 0 @ 0.0158sec, 1 @ 0.0164sec, 0 @ 0.017sec, 1 @ 0.0176sec, 0 @ 0.0181sec, 1 @ 0.0187sec, 0 @ 0.0197sec, 1 @ 0.021sec, 0 @ 0.0215sec, 1 @ 0.0221sec, 0 @ 0.0231sec, 1 @ 0.0244sec, 0 @ 0.0249sec, 1 @ 0.0255sec, 0 @ 0.0265sec, 1 @ 0.0278sec, 0 @ 0.0287sec, 1 @ 0.03sec, 0 @ 0.0309sec, 1 @ 0.0323sec, 0 @ 0.0332sec, 1 @ 0.0346sec, 0 @ 0.0355sec, 1 @ 0.0368sec, 0 @ 0.0374sec, 1 @ 0.038sec, 0 @ 0.0389sec, 1 @ 0.0402sec, 0 @ 0.0408sec, 1 @ 0.0414sec, 0 @ 0.0419sec, 1 @ 0.0425sec, 0 @ 0.0431sec, 1 @ 0.0437sec, 0 @ 0.0443sec, 1 @ 0.0448sec, 0 @ 0.0454sec, 1 @ 0.046sec, 0 @ 0.0465sec, 1 @ 0.0471sec, 0 @ 0.048sec, 1 @ 0.0494sec, 0 @ 0.05sec, 1 @ 0.0505sec, 0 @ 0.0514sec, 1 @ 0.0528sec, 0 @ 0.0536sec, 1 @ 0.0551sec, 0 @ 0.0559sec, 1 @ 0.0573sec, 0 @ 0.0582sec, 1 @ 0.0596sec, 0 @ 0.0604sec, 1 @ 0.111sec, 0 @ 0.112sec, 1 @ 0.114sec, 0 @ 0.114sec



run 30000