LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
ENTITY MEALY_3 is
	port (clk: in STD_LOGIC;
			clr: in STD_LOGIC;
			onebit: in STD_LOGIC;
			y: out STD_LOGIC);
end MEALY_3;

architecture sequence of MEALY_3 is

type state_type is (s0, s1, s2, s3);
signal present_state, next_state: state_type;

	begin

		sreg: process(clk, clr)
		begin
			if clr = '1' then
				present_state <= s0;
				
			elsif rising_edge(clk) then
				present_state <= next_state;
			
			end if;
		end process sreg;

		C1: process(present_state, onebit)
		begin
			case present_state is
				
				when s0 =>
					if onebit = '1' then
						next_state <= s1;
					else
						next_state <= s0;
					end if;
				
				when s1 =>
					if onebit = '0' then
						next_state <= s2;
					else
						next_state <= s1;
					end if;
				
				when s2 =>
					if onebit = '1' then
						next_state <= s3;
					else
						next_state <= s0;
					end if;
				
				when s3 =>
					if onebit = '1' then
						next_state <= s1;
					else
						next_state <= s2;
					end if;
				
				when others =>
					next_state <= s0;
					
			end case;
		end process C1;

		C2: PROCESS(clk, clr) begin
			if clr = '1' then
				y <= '0';
			elsif rising_edge(clk) then
				if present_state = s3 and onebit = '1' then
					y <= '1';
				else
					y <= '0';
				end if;
			end if;
		end process;
		
END sequence;