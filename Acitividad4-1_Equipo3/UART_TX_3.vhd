library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.numeric_std.all;

entity UART_TX_3 is

	port(in_sw : in std_logic_vector(7 downto 0);
		  tx_start,clk,rst: in std_logic;
		  s_tx, tx_done_tick: out std_logic;
		  state_out : out std_logic_vector(1 DOWNTO 0)
		  );
		  
end UART_TX_3;

ARCHITECTURE behavior of UART_TX_3 is
	component baudrate_gen is
		generic(
			--M = clk_freq / baudrate, without oversampling
			M: integer 	:= 5208;	--M = 50 MHz / 9600
			N: integer	:= 13		--size of M
		);
		port(
			clk, reset:	in 	std_logic;
			tick: 		out 	std_logic
		);
	END COMPONENT baudrate_gen;
	
	type state_type is (s_idle,s_start,s_data,s_stop);
	signal present_state, next_state : state_type;
	signal count : integer := 0;
	signal data : std_logic_vector(7 downto 0);
	signal tick : std_logic := '0';
	
	BEGIN
	
	UART_BAUD : baudrate_gen 
	generic map(434, 9) 
	port map(clk, rst, tick);
	
	-- Process assignment
	process(clk, rst)
	begin
		if (rst = '1') then
			present_state <= s_idle;
		elsif (rising_edge(clk)) then
			present_state <= next_state;
		end if;
	end process;
	
	-- State machine
	C1: process(tick) begin 
		case present_state is
			when s_idle => 
				if (tx_start = '0') then 
					next_state <= s_idle; 
				else
					next_state <= s_start;
				end if;
			when s_start =>
				if(tick = '1') then 
					next_state <= s_data;
					-- se transmitirá el dato recibido al momento del start
					data <= in_sw;
				else
					next_state <= s_start;
				end if;
			when s_data => 
				if(tick = '1' and count < 7) then
					next_state <= s_data;
					count <= count + 1;
				elsif (tick = '1' and count = 7) then 
					next_state <= s_stop;
				end if;
			when s_stop => 
				count <= 0;
				if(tick = '1') then 	
					next_state <= s_idle;
				else 	
					next_state <= s_stop;
				end if;
		end case;
	end process;
	
	-- State Actions
	process(present_state, count)
	variable data_index : integer := count;
	begin
		case present_state is
			when s_idle =>
				tx_done_tick <= '0';
				s_tx <= '1';
				state_out <= "00";
			when s_start =>
				s_tx <= '0';
				state_out <= "01";
			when s_data =>
				s_tx <= data(count);
				state_out <= "10";
				--data <= '0' & data(7 downto 1);
			when s_stop =>
				s_tx <= '1';
				tx_done_tick <= '1';
				state_out <= "11";
		end case;
	end process;
	
end architecture;
				