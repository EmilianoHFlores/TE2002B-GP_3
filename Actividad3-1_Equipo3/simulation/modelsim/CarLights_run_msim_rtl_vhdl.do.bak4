transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/joemi/Documents/Quartus_GP3/TE2002B-GP_3/Actividad3-1_Equipo3/CarLights.vhd}

vcom -93 -work work {C:/Users/joemi/Documents/Quartus_GP3/TE2002B-GP_3/Actividad3-1_Equipo3/tb_CarLights.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  tb_CarLights

add wave *
view structure
view signals
run -all
