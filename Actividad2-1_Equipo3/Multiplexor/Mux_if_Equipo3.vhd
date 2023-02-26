LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity Mux_if_Equipo3 is
	port(a, b, c, d: IN std_logic;
		  sel: IN std_logic_vector(1 downto 0);
		  y: OUT std_logic);
END Mux_if_Equipo3;

Architecture behavior of Mux_if_Equipo3 is

BEGIN

PROCESS(sel, a, b, c, d)
VARIABLE var: std_logic_vector(1 downto 0);
BEGIN
	IF sel = "00" THEN
		y <= a;
	ELSIF sel = "01" THEN
		y <= b;
	ELSIF sel = "10" THEN
		y <= c;
	ELSIF sel = "11" THEN
		y <= d;
	ELSE
		y <= '0';
	END IF;
END PROCESS;

END behavior;