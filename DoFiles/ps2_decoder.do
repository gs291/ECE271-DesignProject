vsim -gui work.Ps2_decoder

add wave *

#PS2 data of 8'h1d

force /Ps2_decoder/key_byte 2#0001_1101 @ 50

#PS2 data of 8'h24
force /Ps2_decoder/key_byte 2#0010_0100 @ 100

#PS2 data of 8'h1b
force /Ps2_decoder/key_byte 2#0001_1011 @ 150

#PS2 data of 8'h1f0
force /Ps2_decoder/key_byte 2#1111_0000 @ 200

#PS2 data of 8'h1b
force /Ps2_decoder/key_byte 2#0001_1011 @ 250

run 300
