library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEQTests is
   port (clk, rst : in std_logic;
         b : in std_logic;
         y : out std_logic);
end SEQTests;

architecture Behavior of SEQTests is

type state_type is (s0, s1, s2, s3, s4);
signal present_state, next_state : state_type;  

begin

   process(clk, rst)
   begin
      if (rising_edge(clk)) then
         if (rst = '1') then
            -- Initial state
            present_state <= s0;
         else 
            -- State transitions
				present_state <= next_state;
			end if;
		end if;
	end process;
	
	C1: process(present_state, b)
	begin
		case present_state is
			when s0 =>
				if (b = '1') then
					next_state <= s1;
				else
					next_state <= s0;
				end if;
				
			when s1 =>
				if (b = '1') then
					next_state <= s2;
				else
					next_state <= s0;
				end if;

			when s2 =>
				if (b = '0') then
					next_state <= s3;
				else
					next_state <= s0;
				end if;
			
			when others =>
				if (b = '1') then
					next_state <= s4;
				else
					next_state <= s0;
				end if;
				
		end case;
   end process;
	
	C2 : process(present_state)
	begin
	-- State actions
		case present_state is
			when s0 =>
				y <= '0';
					
			when s1 =>
				y <= '0';

			when s2 =>
				y <= '0';

			when others =>
				y <= '1';
		
		end case;
	end process;

end Behavior;