library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.numeric_std.all;

entity baudrate_gen is
	port(
		clk, reset:	in 	std_logic;
		tick: 		out 	std_logic
	);
end baudrate_gen;

architecture Behavior of baudrate_gen is


signal clk16_reg, clk16_next:		unsigned(8 downto 0) := (others => '0');

begin
	process(clk, reset)
	begin
		if (reset = '1') then
			clk16_reg <= (others => '0');
		elsif (clk'event and clk='1') then
			clk16_reg <= clk16_next;
		end if;
	end process;

	-- next state logic
	clk16_next	<= (others => '0')	when clk16_reg=(433)	else clk16_reg + 1;
	
	-- output logic
	tick	 	<= '1'			when clk16_reg=0 	else '0';

end Behavior;