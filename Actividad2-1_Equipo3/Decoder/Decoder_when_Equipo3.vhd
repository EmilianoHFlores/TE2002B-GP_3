LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity Decoder_when_Equipo3 is
	port(input : IN std_logic_vector(3 downto 0);
		  y: OUT std_logic_vector(7 downto 0));
END Decoder_when_Equipo3;

Architecture behavior of Decoder_when_Equipo3 is

BEGIN

y <= (not "00111111") when input = "0000" else
	  (not "00000110") when input = "0001" else
	  (not "01011011") when input = "0010" else
	  (not "01001111") when input = "0011" else
	  (not "01100110") when input = "0100" else
	  (not "01101101") when input = "0101" else
	  (not "01111101") when input = "0110" else
	  (not "00000111") when input = "0111" else
	  (not "01111111") when input = "1000" else
	  (not "01101111") when input = "1001" else
	  (not "01110111") when input = "1010" else
	  (not "01111100") when input = "1011" else
	  (not "00111001") when input = "1100" else
	  (not "01011110") when input = "1101" else
	  (not "01111001") when input = "1110" else
	  (not "01110001") when input = "1111" else
	  "11111111";

END behavior;