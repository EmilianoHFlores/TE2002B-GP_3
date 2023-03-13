set_location_assignment PIN_C14 -to Segmentos[0]
set_location_assignment PIN_E15 -to Segmentos[1]
set_location_assignment PIN_C15 -to Segmentos[2]
set_location_assignment PIN_C16 -to Segmentos[3]
set_location_assignment PIN_E16 -to Segmentos[4]
set_location_assignment PIN_D17 -to Segmentos[5]
set_location_assignment PIN_C17 -to Segmentos[6]

set_instance_assignment -name IO_STANDARD "3.3 V" -to Segmentos[0]
set_instance_assignment -name IO_STANDARD "3.3 V" -to Segmentos[1]
set_instance_assignment -name IO_STANDARD "3.3 V" -to Segmentos[2]
set_instance_assignment -name IO_STANDARD "3.3 V" -to Segmentos[3]
set_instance_assignment -name IO_STANDARD "3.3 V" -to Segmentos[4]
set_instance_assignment -name IO_STANDARD "3.3 V" -to Segmentos[5]
set_instance_assignment -name IO_STANDARD "3.3 V" -to Segmentos[6]

set_location_assignment PIN_AA6 -to filas[3]
set_location_assignment PIN_AA5 -to filas[2]
set_location_assignment PIN_AB3 -to filas[1]
set_location_assignment PIN_AB2 -to filas[0]

set_instance_assignment -name IO_STANDARD "3.3 V" -to filas[0]
set_instance_assignment -name IO_STANDARD "3.3 V" -to filas[1]
set_instance_assignment -name IO_STANDARD "3.3 V" -to filas[2]
set_instance_assignment -name IO_STANDARD "3.3 V" -to filas[3]

set_location_assignment PIN_AA8 -to col[0]
set_location_assignment PIN_AA9 -to col[1]
set_location_assignment PIN_AB10 -to col[2]

set_instance_assignment -name IO_STANDARD "3.3 V" -to col[0]
set_instance_assignment -name IO_STANDARD "3.3 V" -to col[1]
set_instance_assignment -name IO_STANDARD "3.3 V" -to col[2]


--Segmentos is OUTPUT for HEX0 7 segment displaSegmentos
--SW is INPUT for on-board switches