LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY switch_to_Hex_Equipo3 IS
	PORT(
		SW :		IN			STD_LOGIC_VECTOR(9 DOWNTO 0);
		LEDR :	OUT		STD_LOGIC_VECTOR(9 DOWNTO 0);
		y : 	OUT 		STD_LOGIC_VECTOR(7 DOWNTO 0));
END switch_to_Hex_Equipo3;
	
ARCHITECTURE behavior OF switch_to_Hex_Equipo3 IS

COMPONENT Decoder_when_Equipo3 IS
	PORT(
		input : IN std_logic_vector(3 downto 0);
		y: OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

BEGIN

	LEDR(9 DOWNTO 1) <= (OTHERS => '0');
	
	decoder: Decoder_when_Equipo3 PORT MAP(
							SW(3 DOWNTO 0), y(7 DOWNTO 0));

END behavior;