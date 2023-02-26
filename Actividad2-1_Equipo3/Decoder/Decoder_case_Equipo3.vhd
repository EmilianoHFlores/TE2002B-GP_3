LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity Decoder_case_Equipo3 is
	port(input : IN std_logic_vector(3 downto 0);
		  y: OUT std_logic_vector(7 downto 0));
END Decoder_case_Equipo3;

Architecture behavior of Decoder_case_Equipo3 is

SIGNAL y_sub : std_logic_vector(7 DOWNTO 0);

BEGIN

PROCESS (input)
VARIABLE y_sub : std_logic_vector (7 DOWNTO 0);
BEGIN
	CASE input IS
		WHEN "0000" => y_sub := "00111111";
		WHEN "0001" => y_sub := "00000110";
		WHEN "0010" => y_sub := "01011011";
		WHEN "0011" => y_sub := "01001111";
		WHEN "0100" => y_sub := "01100110";
		WHEN "0101" => y_sub := "01101101";
		WHEN "0110" => y_sub := "01111101";
		WHEN "0111" => y_sub := "00000111";
		WHEN "1000" => y_sub := "01111111";
		WHEN "1001" => y_sub := "01101111";
		WHEN "1010" => y_sub := "01110111";
		WHEN "1011" => y_sub := "01111100";
		WHEN "1100" => y_sub := "00111001";
		WHEN "1101" => y_sub := "01011110";
		WHEN "1110" => y_sub := "01111001";
		WHEN "1111" => y_sub := "01110001";
		WHEN OTHERS => y_sub := "00000000";
	END CASE;
	
	y <= not y_sub;

END PROCESS;


END behavior;