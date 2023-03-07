library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.numeric_std.all;

entity UART_TX_3 is

	port(SW : in std_logic_vector(7 downto 0);
		  tx_start,clk,rst: in std_logic;
		  s_tx: out std_logic;
		  tx_led: out std_logic;
		  tx_state : out std_logic_vector(1 downto 0)
		  );
		  
end UART_TX_3;

ARCHITECTURE behavior of UART_TX_3 is
	component baudrate_gen is
		port(
			clk, reset:	in 	std_logic;
			tick: 		out 	std_logic
		);
	END COMPONENT baudrate_gen;
	
	component counter is
		Port ( rst,clk : in std_logic;
           o: out std_logic_vector(0 to 2));
	end component counter;
	
	type state_type is (s_idle,s_start,s_data,s_stop);
	signal present_state, next_state : state_type;
	signal data : std_logic_vector(7 downto 0);
	signal tick : std_logic := '0';
	signal reset_count : std_logic := '0';
	signal counter_to_7 : std_logic_vector(2 downto 0);
	signal reset_tick : std_logic := '0';
	
	
	signal tx_done_tick : std_logic;
	signal last_button : std_logic := '0';
	
	BEGIN
	
	UART_BAUD : baudrate_gen port map(clk, reset_tick, tick);
	
	count_up : counter port map (reset_count, tick, counter_to_7);

	
	-- Process assignment
	process(clk)
	begin
		if (rst = '0') then
			present_state <= s_idle;
		elsif (rising_edge(clk)) then
			present_state <= next_state;
			
		end if;
	end process;
	
	-- Dudas sobre si esta correcto la secuencia
    C1: process(tick, tx_start) begin 
		case present_state is
		
			when s_idle => 
				if (tx_start = '0') then 
					next_state <= s_start; 
				else
					next_state <= s_idle;
				end if;
				
			when s_start =>
				if(tick = '1') then 
					next_state <= s_data;
				else
					next_state <= s_start;
				end if;
				
			when s_data => 
			
				if(tick = '1' and counter_to_7 = "111") then
					next_state <= s_stop;
				else
					next_state <= s_data;
				end if;
				
			when s_stop => 
			
				if(tick = '1') then 	
					next_state <= s_idle;
				else 	
					next_state <= s_stop;
				end if;
				
		end case;
	end process;
	
	-- Probar tx_start boton
	process(tx_start)
	begin
		if (tx_start = '0') then
			tx_led <= '1';
		else
			tx_led <= '0';
		end if;
	end process;
	
	-- State Actions
	process(present_state, counter_to_7)
	begin
		case present_state is
		
			when s_idle =>
				s_tx <= '1';
				reset_tick <= '1';
				tx_state <= "00";

			when s_start =>
				reset_tick <= '0';
				reset_count <= '1';
				s_tx <= '0';
				tx_state <= "01";
				
			when s_data =>
				reset_count <= '0';
				s_tx <= data(to_integer(unsigned(counter_to_7)));
				tx_state <= "10";
				
			when s_stop =>
				s_tx <= '1';
				tx_state <= "11";
				
		end case;
	end process;
	
end architecture;