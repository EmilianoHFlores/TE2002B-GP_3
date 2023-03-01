library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Inc3 is
   port (a: in std_logic_vector(2 downto 0);
         s: out std_logic_vector(2 downto 0));
end Inc3;

architecture Behavior of Inc3 is
signal cout : unsigned (2 downto 0) := "000";

begin

process (a) 

begin
	cout <= unsigned(a) + 1;
	s <= std_logic_vector(cout);
end process;
	
end Behavior;