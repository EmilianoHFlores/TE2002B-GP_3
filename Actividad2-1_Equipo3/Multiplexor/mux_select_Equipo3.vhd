LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity Mux_select_Equipo3 is
	port(a, b, c, d: IN std_logic;
		  sel: IN std_logic_vector(1 downto 0);
		  y: OUT std_logic);
END Mux_select_Equipo3;

Architecture behavior of Mux_select_Equipo3 is

BEGIN

WITH sel SELECT
	y <= a WHEN "00",
		  b WHEN "01",
		  c WHEN "10",
		  d WHEN "11",
		  '0' when others;

END behavior;
