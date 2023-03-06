LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
ENTITY MEALY_3 is
	port (clk_3: in STD_LOGIC;
			clr_3: in STD_LOGIC;
			onebit_3: in STD_LOGIC;
			y_3: out STD_LOGIC;
			state_view_3: out STD_LOGIC_VECTOR(1 DOWNTO 0)
			);
end MEALY_3;

architecture sequence of MEALY_3 is

type state_type is (s0_3, s1_3, s2_3, s3_3);
signal present_state_3, next_state_3: state_type;

	begin

		sreg: process(clk_3, clr_3)
		begin
			if clr_3 = '1' then
				present_state_3 <= s0_3;
				
			elsif rising_edge(clk_3) then
				present_state_3 <= next_state_3;
			
			end if;
		end process sreg;

		C1: process(present_state_3, onebit_3)
		begin
			case present_state_3 is
				
				when s0_3 =>
					if onebit_3 = '1' then
						next_state_3 <= s1_3;
					else
						next_state_3 <= s0_3;
					end if;
				
				when s1_3 =>
					if onebit_3 = '0' then
						next_state_3 <= s2_3;
					else
						next_state_3 <= s1_3;
					end if;
				
				when s2_3 =>
					if onebit_3 = '1' then
						next_state_3 <= s3_3;
					else
						next_state_3 <= s0_3;
					end if;
				
				when s3_3 =>
					if onebit_3 = '1' then
						next_state_3 <= s1_3;
					else
						next_state_3 <= s2_3;
					end if;
				
				when others =>
					next_state_3 <= s0_3;
					
			end case;
		end process C1;

		C2: PROCESS(clk_3, clr_3) begin
			if clr_3 = '1' then
				y_3 <= '0';
			elsif rising_edge(clk_3) then
				if present_state_3 = s3_3 and onebit_3 = '1' then
					y_3 <= '1';
				else
					y_3 <= '0';
				end if;
			end if;
		end process;
		
		state: process(present_state_3) begin
			case present_state_3 is
					when s0_3 =>
						state_view_3 <= "00";
							
					when s1_3 =>
						state_view_3 <= "01";
					
					when s2_3 =>
						state_view_3 <= "10";
					
					when s3_3 =>
						state_view_3 <= "11";
					
			end case;
		end process;
		
END sequence;