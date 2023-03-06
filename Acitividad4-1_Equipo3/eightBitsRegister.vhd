library IEEE;
use IEEE.std_logic_1164.all;

entity eightBitsRegister is
    port (
        valueOut : out std_logic_vector (7 downto 0);
        valueIn : in std_logic_vector (7 downto 0);
        reset, clock : in std_logic
    );
end entity;

architecture arch_eightBitsRegister of eightBitsRegister is
begin

	 identifier : process (clock)
    begin
        if (rising_edge(clock)) then
            if reset = '1' then
                valueOut <= "00000000"; 
            else
                valueOut <= valueIn;
            end if;
        end if;
    end process;

end architecture;