onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate -color Plum -label {Test Number} -subitemconfig {{/tb_moore/tb_test_num[31]} {-color Plum} {/tb_moore/tb_test_num[30]} {-color Plum} {/tb_moore/tb_test_num[29]} {-color Plum} {/tb_moore/tb_test_num[28]} {-color Plum} {/tb_moore/tb_test_num[27]} {-color Plum} {/tb_moore/tb_test_num[26]} {-color Plum} {/tb_moore/tb_test_num[25]} {-color Plum} {/tb_moore/tb_test_num[24]} {-color Plum} {/tb_moore/tb_test_num[23]} {-color Plum} {/tb_moore/tb_test_num[22]} {-color Plum} {/tb_moore/tb_test_num[21]} {-color Plum} {/tb_moore/tb_test_num[20]} {-color Plum} {/tb_moore/tb_test_num[19]} {-color Plum} {/tb_moore/tb_test_num[18]} {-color Plum} {/tb_moore/tb_test_num[17]} {-color Plum} {/tb_moore/tb_test_num[16]} {-color Plum} {/tb_moore/tb_test_num[15]} {-color Plum} {/tb_moore/tb_test_num[14]} {-color Plum} {/tb_moore/tb_test_num[13]} {-color Plum} {/tb_moore/tb_test_num[12]} {-color Plum} {/tb_moore/tb_test_num[11]} {-color Plum} {/tb_moore/tb_test_num[10]} {-color Plum} {/tb_moore/tb_test_num[9]} {-color Plum} {/tb_moore/tb_test_num[8]} {-color Plum} {/tb_moore/tb_test_num[7]} {-color Plum} {/tb_moore/tb_test_num[6]} {-color Plum} {/tb_moore/tb_test_num[5]} {-color Plum} {/tb_moore/tb_test_num[4]} {-color Plum} {/tb_moore/tb_test_num[3]} {-color Plum} {/tb_moore/tb_test_num[2]} {-color Plum} {/tb_moore/tb_test_num[1]} {-color Plum} {/tb_moore/tb_test_num[0]} {-color Plum}} /tb_moore/tb_test_num
add wave -noupdate -color Magenta -label {Bit Number} /tb_moore/tb_bit_num
add wave -noupdate -divider Inputs
add wave -noupdate -color {Orange Red} -label Reset /tb_moore/tb_n_rst
add wave -noupdate -color Pink -label Clock /tb_moore/tb_clk
add wave -noupdate -color {Green Yellow} -label Input /tb_moore/tb_i
add wave -noupdate -divider Outputs
add wave -noupdate -color Orange -label {Actual Out} /tb_moore/tb_o
add wave -noupdate -color Yellow -label {Expected Out} /tb_moore/tb_expected_ouput
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {116843 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {115422 ps} {173999 ps}
