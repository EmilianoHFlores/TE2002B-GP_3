library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.numeric_std.all;

entity UART_TX_3 is

	port(data : in std_logic_vector(7 downto 0);
		  tx_start,clk,rst: in std_logic;
		  s_tx: out std_logic
		  );
		  
end UART_TX_3;

ARCHITECTURE behavior of UART_TX_3 is
	component baudrate_gen is
	generic(
    		--M = clk_freq / baudrate, without oversampling
		M: integer 	:= 434;	--M = 50 MHz / 9600
		N: integer	:= 9		--size of M
	);
	port(
		clk, reset:	in 	std_logic;
		tick: 		out 	std_logic
	);
	END COMPONENT baudrate_gen;
	
	type state_type is (s_idle,s_start,s_data,s_stop);
	signal present_state : state_type;
	signal counter_to_7 : unsigned(2 downto 0) := "000";
	signal tx_done_tick : std_logic := '0';
	signal tick : std_logic := '0';
	signal reset_tick : std_logic := '0';
	

	
	BEGIN
	
	UART_BAUD : baudrate_gen generic map (434, 9) port map(clk, not rst, tick);
	
	-- Process assignment
	process(clk)
	variable counter_button : integer := 0;
	variable delay_done : std_logic := '0';
	begin
		if (rst = '0') then
			present_state <= s_idle;
			
		elsif (rising_edge(clk)) then
		
		
		if(tick = '1') then
			if(tx_start = '0' and counter_button /= 1 ) then
				delay_done := '0';
				counter_button := counter_button + 1;
			elsif(tx_start ='0' and counter_button = 1) then
				counter_button := counter_button + 1;
				delay_done := '1';
			elsif(tx_start = '1') then
				delay_done := '0';
				counter_button := 0;
			end if;
		end if;
		
			case present_state is
			
				when s_idle => 
					s_tx <= '1';
					counter_to_7 <= "000";
					if (delay_done = '1') then
						present_state <= s_start;
					else

						present_state <= s_idle;
					end if;
					
				when s_start =>
					s_tx <= '0';
					counter_to_7 <= "000";
					if(tick = '1') then 
						present_state <= s_data;
					else
						present_state <= s_start;
					end if;
					
				when s_data => 
					s_tx <= data(to_integer(counter_to_7));
					if(tick = '1' and counter_to_7 = "111") then
						counter_to_7 <= "000";
						present_state <= s_stop;
						
					elsif (tick = '1') then
						counter_to_7 <= counter_to_7 + 1;
						present_state <= s_data;
					else 
						present_state <= s_data;
					end if;
					
				when s_stop => 
					s_tx <= '1';
					counter_to_7 <= "000";
					if(tick = '1') then 	
						present_state <= s_idle;
					else 	
						present_state <= s_stop;
					end if;
					
				when others =>
					s_tx <= '1';
					present_state <= s_idle;
					counter_to_7 <= "000";
					
			end case;
			end if;
		end process;
	
end architecture;