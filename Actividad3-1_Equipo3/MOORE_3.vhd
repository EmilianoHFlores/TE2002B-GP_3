library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MOORE_3 is
   port (clk_3, rst_3 : in std_logic;
         left_3, right_3, interm_3 : in std_logic;
         lLights_3, rLights_3 : out std_logic_vector(2 downto 0));
end MOORE_3;

architecture Behavior of MOORE_3 is

-- State types: s0: both off | s1_x: left directional | s2_x: right directional | s3_x: intermittent
type state_type is (s0, s1_0, s1_1, s1_2, s1_3, s2_0, s2_1, s2_2, s2_3, s3_0, s3_1);
signal present_state_3, next_state_3 : state_type;

-- Define constants
    constant clk_3_FREQ: integer := 50000000;  -- 50 MHz clock frequency
    constant DELAY_100ns_3: integer := 5;  -- A delay of 100ns for intermittents (5 cycles of 20ns)
	constant DELAY_20ns_3: integer := 1;  -- A delay of 20ns for directional lights (the 4 state cycle lasts 80ns)

    -- Define signals
    signal counter_3: integer range 0 to 50000001 := 0;
    signal delay_done_3: std_logic := '1';
	signal skip_delay_3: std_logic := '0';
	signal delay_sel_3: std_logic := '0'; -- 0: delay of 100ns | 1: delay of 20ns

begin

   process(clk_3, rst_3)
   begin
      if (rising_edge(clk_3)) then
			-- State transitions
			present_state_3 <= next_state_3;
		end if;
	end process;
	
	-- Delay for each sequence to take some time
	delay: process (clk_3)
	begin
		if (rising_edge(clk_3)) then
			-- Checks if delay is skipped, or if delay is done (either 100ns or 20ns according to delay_sel_3)
			if ((counter_3>=DELAY_100ns_3 and delay_sel_3 = '0') or (counter_3>=DELAY_20ns_3 and delay_sel_3 = '1') or skip_delay_3='1') then
				counter_3 <= 0;
				delay_done_3 <= '1';
			else
				counter_3 <= counter_3 + 1;
				delay_done_3 <= '0';
			end if;
		end if;
	end process;
	
    -- Selecting next state
	C1: process(delay_done_3, clk_3, present_state_3, left_3, right_3, interm_3)
	
		begin
		
		-- most actions will not require to skip delay
		skip_delay_3 <= '0';
		
		case present_state_3 is
			
			--Only activated when lights are off (sequence of lights has completed its cycle)
			--Allows for skipping delay if lights are off, in state s0 (to activate a sequence instantly)
			when s0 =>
				if (interm_3 = '1') then
					next_state_3 <= s3_1;
					delay_sel_3 <= '0';
					skip_delay_3 <= '1';
				elsif (right_3 = '1') then
					next_state_3 <= s2_1;
					delay_sel_3 <= '1';
					skip_delay_3 <= '1';
				elsif (left_3 = '1') then
					next_state_3 <= s1_1;
					delay_sel_3 <= '1';
					skip_delay_3 <= '1';
				else
					next_state_3 <= s0;
					delay_sel_3 <= '0';
				end if;
				
			when s1_1 =>
				if (delay_done_3 = '1') then
					next_state_3 <= s1_2;
					delay_sel_3 <= '1';
				end if;
				
			when s1_2 =>
				if (delay_done_3 = '1') then
					next_state_3 <= s1_3;
					delay_sel_3 <= '1';
				end if;
			when s1_3 =>
				if (delay_done_3 = '1') then
					next_state_3 <= s1_0;
					delay_sel_3 <= '1';
				end if;
			
			-- Only s1_0, s2_0, s3_0 and s0 allow to change lights behavior, as the cycle has ended.
			when s1_0 =>
				if (delay_done_3 = '1') then
					if (interm_3 = '1') then
						next_state_3 <= s3_1;
						delay_sel_3 <= '0';
					elsif (right_3 = '1') then
						next_state_3 <= s2_1;
						delay_sel_3 <= '1';
					elsif (left_3 = '1') then
						next_state_3 <= s1_1;
						delay_sel_3 <= '1';
					else
						next_state_3 <= s0;
						delay_sel_3 <= '0';
					end if;
				end if;
			
			when s2_1 =>
				if (delay_done_3 = '1') then
					next_state_3 <= s2_2;
					delay_sel_3 <= '1';
				end if;
				
			when s2_2 =>
				if (delay_done_3 = '1') then
					next_state_3 <= s2_3;
					delay_sel_3 <= '1';
				end if;
			when s2_3 =>
				if (delay_done_3 = '1') then
					next_state_3 <= s2_0;
					delay_sel_3 <= '1';
				end if;
			
			when s2_0 =>
				if (delay_done_3 = '1') then
					if (interm_3 = '1') then
						next_state_3 <= s3_1;
						delay_sel_3 <= '0';
					elsif (right_3 = '1') then
						next_state_3 <= s2_1;
						delay_sel_3 <= '1';
					elsif (left_3 = '1') then
						next_state_3 <= s1_1;
						delay_sel_3 <= '1';
					else
						next_state_3 <= s0;
						delay_sel_3 <= '0';
					end if;
				end if;

			when s3_1 =>
				if (delay_done_3 = '1') then
					next_state_3 <= s3_0;
					delay_sel_3 <= '0';
				end if;
			
			when s3_0 =>
				if (delay_done_3 = '1') then
					if (interm_3 = '1') then
						next_state_3 <= s3_1;
						delay_sel_3 <= '0';
					elsif (right_3 = '1') then
						next_state_3 <= s2_1;
						delay_sel_3 <= '1';
					elsif (left_3 = '1') then
						next_state_3 <= s1_1;
						delay_sel_3 <= '1';
					else
						next_state_3 <= s0;
						delay_sel_3 <= '0';
					end if;
				end if;
		end case;
	end process;
	
	-- State actions
	C2 : process(present_state_3)
	begin
		case present_state_3 is
			when s0 =>
				rLights_3 <= "000";
				lLights_3 <= "000";
					
			when s1_1 =>
				rLights_3 <= "000";
				lLights_3 <= "001";
			
			when s1_2 =>
				rLights_3 <= "000";
				lLights_3 <= "011";
			
			when s1_3 =>
				rLights_3 <= "000";
				lLights_3 <= "111";
			
			when s1_0 =>
				rLights_3 <= "000";
				lLights_3 <= "000";
						
			when s2_1 =>
				lLights_3 <= "000";
				rLights_3 <= "001";
			
			when s2_2 =>
				lLights_3 <= "000";
				rLights_3 <= "011";
			
			when s2_3 =>
				lLights_3 <= "000";
				rLights_3 <= "111";
			
			when s2_0 =>
				lLights_3 <= "000";
				rLights_3 <= "000";
					
			when s3_1 =>
				lLights_3 <= "111";
				rLights_3 <= "111";
			
			when s3_0 =>
				lLights_3 <= "000";
				rLights_3 <= "000";
					
			when others =>
				rLights_3 <= "000";
				lLights_3 <= "000";
		
		end case;
	end process;
	
	

end Behavior;