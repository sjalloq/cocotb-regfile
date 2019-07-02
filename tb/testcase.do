quietly virtual function -install /tb/u_regfile/u_regfile_pio/pio_decode -env /tb { sim:/tb/u_regfile/u_regfile_pio/pio_decode/d2h_dec_pio_read_data  !=  sim:/tb/u_regfile/u_regfile_pio/pio_decode/dec_pio_read_data} fault
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk
add wave -noupdate /tb/reset_n
add wave -noupdate -expand -group FAULTY /tb/u_regfile/u_regfile_pio/pio_decode/fault
add wave -noupdate -expand -group FAULTY /tb/u_regfile/u_regfile_pio/pio_decode/d2h_dec_pio_read_data
add wave -noupdate -expand -group {READ DATA} /tb/u_regfile/u_regfile_pio/pio_decode/dec_pio_read_data
add wave -noupdate -expand -group {READ DATA} /tb/u_regfile/u_regfile_pio/pio_decode/dec_pio_read_data_d1
add wave -noupdate -expand -group {READ DATA} /tb/u_regfile/u_regfile_pio/pio_decode/dec_pio_read_data_next
run 341ns
