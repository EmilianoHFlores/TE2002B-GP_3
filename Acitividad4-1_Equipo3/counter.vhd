library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter is
    Port ( rst,clk : in std_logic;
           o: out std_logic_vector(0 to 2));
end counter;

architecture count_arch of counter is
   signal count : std_logic_vector(0 to 2);
begin
     
	process(rst, clk) begin
		 if rst = '1' then
			count <= "000";
		elsif (rising_edge(clk)) then
			count <= count + 1;
		end if;
	end process;
		
    o <= count;
end architecture count_arch;