library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CarLights is
   port (clk, rst : in std_logic;
         left, right, interm : in std_logic;
         lLights, rLights : out std_logic_vector(2 downto 0));
end CarLights;

architecture Behavior of CarLights is

-- State types: s0: both off | s1: left directional | s2: right directional | s3: intermittent
type state_type is (s0, s1_0, s1_1, s1_2, s1_3, s2_0, s2_1, s2_2, s2_3, s3_0, s3_1);
signal present_state, next_state : state_type;

-- Define constants
    constant CLK_FREQ: integer := 50000000;  -- 50 MHz clock frequency
    constant DELAY_1SEC: integer := 50;  -- 1 second delay at 100 MHz

    -- Define signals
    signal counter: integer range 0 to 50000001 := 0;
    signal delay_done: std_logic := '1';
	 signal skip_delay: std_logic := '0';

begin

   process(clk, rst)
   begin
      if (rising_edge(clk)) then
			-- State transitions
			present_state <= next_state;
		end if;
	end process;
	
	-- Delay for each sequence to take some time
	delay: process (clk)
	begin
		if (rising_edge(clk)) then
			if (counter>=DELAY_1SEC or skip_delay='1') then
				counter <= 0;
				delay_done <= '1';
			else
				counter <= counter + 1;
				delay_done <= '0';
			end if;
		end if;
	end process;
	
    -- Selecting next state
	C1: process(delay_done, clk, present_state, left, right, interm)
	
		begin
		
		--Only activated when lights are off (sequence of lights has completed its cycle)
		--Allows for skipping delay if on lights off (to activate a sequence instantly)
		
		if (present_state = s0) then
			-- interm priority
				if (interm = '1') then
					 next_state <= s3_1;
				elsif (left = '1') then
					 next_state <= s1_1;
				elsif (right = '1') then
					 next_state <= s2_1;
				else 
					next_state <= s0;
				end if;
				skip_delay <= '1';
		
		-- Do not rerun the process if delay has been skipped (would result in jumping from first step in sequence to second)
		elsif (skip_delay = '1') then
			skip_delay <= '0';
			
		else
			if (present_state = s1_0 or present_state = s2_0 or present_state = s3_0) then
				-- Change of sequence requires previous one to finish
				skip_delay <= '0';
				
				if (delay_done = '1') then 
					-- interm priority
					if (interm = '1') then
						 next_state <= s3_1;
					elsif (left = '1') then
						 next_state <= s1_1;
					elsif (right = '1') then
						 next_state <= s2_1;
					else 
						next_state <= s0;
					end if;
				end if;
			
			elsif (delay_done = '1') then
				skip_delay <= '0';
				
				case present_state is
					when s0 =>
						next_state <= s0;
							
					when s1_1 =>
						next_state <= s1_2;
					
					when s1_2 =>
						next_state <= s1_3;
					
					when s1_3 =>
						next_state <= s1_0;
					
					when s1_0 =>
						next_state <= s1_1;
							 
					when s2_1 =>
						next_state <= s2_2;
					
					when s2_2 =>
						next_state <= s2_3;
					
					when s2_3 =>
						next_state <= s2_0;
					
					when s2_0 =>
						next_state <= s2_1;
						 
					when s3_1 =>
						next_state <= s3_0;
					
					when s3_0 =>
						next_state <= s3_1;
						 
					when others =>
						next_state <= s0;
				
				end case;
			end if;
		end if;
		
	end process;
	
	C2 : process(clk, delay_done)
	begin
		
		if (delay_done='1') then
			if (delay_done = '1') then
				-- State actions
				case present_state is
					when s0 =>
						rLights <= "000";
						lLights <= "000";
							
					when s1_1 =>
						rLights <= "000";
						lLights <= "001";
					
					when s1_2 =>
						rLights <= "000";
						lLights <= "011";
					
					when s1_3 =>
						rLights <= "000";
						lLights <= "111";
					
					when s1_0 =>
						rLights <= "000";
						lLights <= "000";
							 
					when s2_1 =>
						lLights <= "000";
						rLights <= "001";
					
					when s2_2 =>
						lLights <= "000";
						rLights <= "011";
					
					when s2_3 =>
						lLights <= "000";
						rLights <= "111";
					
					when s2_0 =>
						lLights <= "000";
						rLights <= "000";
						 
					when s3_1 =>
						lLights <= "111";
						rLights <= "111";
					
					when s3_0 =>
						lLights <= "000";
						rLights <= "000";
						 
					when others =>
						rLights <= "000";
						lLights <= "000";
				
				end case;
				
			end if;
		end if;
	end process;
	
	

end Behavior;