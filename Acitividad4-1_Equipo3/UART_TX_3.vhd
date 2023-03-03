library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.numeric_std.all;

entity UART_TX_3 is
	port(in_sw : in std_logic_vector(7 downto 0);
		  tx_start,clk,reset, tick : in std_logic;
		  s_tx,tx_done_tick : out std_logic);
end UART_TX_3;

ARCHITECTURE behavior of UART_TX_3 is
	component baudrate_gen is
		generic(
			--M = clk_freq / baudrate, without oversampling
			M: integer 	:= 5208;	--M = 50 MHz / 9600
			N: integer	:= 13;		--size of M
		);
		port(
			clk, reset:	in 	std_logic;
			tick: 		out 	std_logic
		);
	end component baudrate_gen;
	
	type state_type is (s_idle,s_start,s_tx,s_stop);
	
	signal present_state,next_state : state_stype;
	
	variable count : unsigned(2 downto 0) := "000";
	
	begin
	
	UART_BAUD : baudrate_gen
	
	generic map(434,9);
	
	port map(clk,rst,tick);
	
	process(clk,rst)
	begin
		if (rst = '1') then
			present_state <= s_idle;
		elsif (rising_edge(clk)) then
			present_state <= next_state;
		end if;
	end process;
	C1: process(present_state,tick,tx_start)
	begin 
	case present_state is
		when s_idle <= 
			if (tx_start = '0') then 
				next_state <= s_idle; 
			else
				next_state <= s_start;
			end if;
		when s_start <=
			if(tick = '1') then next_state <= s_tx;
			else
				next_state <= s_start;
			end if;
		when s_tx <= if((tick = '1') and count < 7)
			then
				next_state <= s_tx;
			elsif ((tick = '1') and count = 7)
			then 
				next_state <= s_stop;
			end if;
		when s_stop <= 
			if(tick = '1') then 	
				next_state <= s_idle;
			else 	
				next_state <= s_stop;
			end if;
	end process;
	process(present_state)
		begin
		case present_state is
			when s_idle =>
				s_tx <= '1';
			when s_start =>
				s_tx <= '0';
			when s_tx =>
				for(------