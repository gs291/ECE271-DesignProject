vsim -gui work.Ps2_decoder

add wave *

force /Ps2_decoder/key_byte 2#0000_0000 @ 10

#PS2 data of 8'h1d
force /Ps2_decoder/key_byte 2#1011_1000 @ 50

#PS2 data of 8'h24
force /Ps2_decoder/key_byte 2#0010_0100 @ 100

#PS2 data of 8'h1b
force /Ps2_decoder/key_byte 2#1101_1000 @ 150

#PS2 data of 8'h1f0
force /Ps2_decoder/key_byte 2#0000_1111 @ 200

force /Ps2_decoder/key_byte 2#1111_1111 @ 250

#PS2 data of 8'h1b
force /Ps2_decoder/key_byte 2#1101_1000 @ 300

#PS2 data of 8'hff
force /Ps2_decoder/key_byte 2#1111_1111 @ 350

run 400