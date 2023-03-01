LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

ENTITY ejercicio1 is
	port (clk, clr: in STD_LOGIC;
			a,b: in STD_LOGIC;
			z: out STD_LOGIC
			);
END ejercicio1;

ARCHITECTURE behavior of ejercicio1 is
	type state_type is (s0, s1, s2, s3, s4);
	signal present_state, next_state: state_type;
	begin	
	
		sreg: process(clk)
		
		begin
		if rising_edge(clk) then
			if clr = '1' then
				present_state <= s0;
			else
				present_state <= next_state;
			end if;
		end if;
		end process;
		
		
		C1: process(present_state, a, b)
		begin
			case present_state is
				when s0 =>
					if (a and b) = '1' then
						next_state <= s1;
					else
						next_state <= s0;
					end if;
				when s1 =>
					if (not a and b) = '1' then
						next_state <= s2;
					elsif (a and not b) = '1' then
						next_state <= s0;
					end if;
				when s2 =>
					if (a or b) = '1' then
						next_state <= s3;
					end if;
				when s3 =>
					next_state <= s4;
				when s4=>
				if (a and b) = '1' then
						next_state <= s0;
				end if;
				when others =>
					next_state <= s0;					
			end case;
		end process C1;

		C2: PROCESS(clk, present_state) begin
			case present_state is
				when s2 =>
					z <= '1';
				when others =>
					z <= '0';
			END CASE;
		end process;
		
	end behavior;