Library IEEE;
use ieee.std_logic_1164.all;

Entity Test is
PORT (
        clk: in std_logic;
        x: in std_logic_vector (7 downto 0);
        sel: in integer range 0 to 7;
		  y: out std_logic
        );
End Test;

architecture behavior of Test is
begin
process (clk) 
variable temp : std_logic_vector(7 downto 0);
begin
	if rising_edge(clk) then
		y <= x(sel);
	end if;
end process;
end architecture;