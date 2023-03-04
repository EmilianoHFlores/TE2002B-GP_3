transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/joemi/Documents/Quartus_GP3/TE2002B-GP_3/Acitividad4-1_Equipo3/uart_tx_3.vhd}
vcom -93 -work work {C:/Users/joemi/Documents/Quartus_GP3/TE2002B-GP_3/Acitividad4-1_Equipo3/baudrate_gen.vhd}

vcom -93 -work work {C:/Users/joemi/Documents/Quartus_GP3/TE2002B-GP_3/Acitividad4-1_Equipo3/tb_UART_TX_3.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  tb_UART_TX_3

add wave *
view structure
view signals
run -all
