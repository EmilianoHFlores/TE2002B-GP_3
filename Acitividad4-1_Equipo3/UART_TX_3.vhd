library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.numeric_std.all;

entity UART_TX_3 is

	port(in_sw : in std_logic_vector(7 downto 0);
		  tx_start,clk,rst: in std_logic;
		  s_tx, tx_done_tick: out std_logic;
		  tx_state : out std_logic_vector(1 downto 0)
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
	
	component counter is
		Port ( rst,clk : in std_logic;
           o: out std_logic_vector(0 to 2));
	end component counter;
	
	component eightBitsRegister is
    port (
        valueOut : out std_logic_vector (7 downto 0);
        valueIn : in std_logic_vector (7 downto 0);
        reset, clock : in std_logic
    );
	 end component;
	
	type state_type is (s_idle,s_start,s_data,s_stop);
	signal present_state, next_state : state_type;
	signal data : std_logic_vector(7 downto 0);
	signal tick : std_logic := '0';
	signal reset_count : std_logic := '0';
	signal counter_to_7 : std_logic_vector(2 downto 0);
	
	BEGIN
	
	UART_BAUD : baudrate_gen generic map(434, 9) port map(clk, rst, tick);
	
	count_up : counter port map (reset_count, tick, counter_to_7);
	
	register_8bits : eightBitsRegister port map (data, in_sw, rst, clk);
	
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
	C1: process(tick, tx_start) begin 
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
	
	-- State Actions
	process(present_state, counter_to_7)
	begin
		case present_state is
			when s_idle =>
				tx_done_tick <= '0';
				s_tx <= '1';
				tx_state <= "00";
			when s_start =>
				s_tx <= '0';
				reset_count <= '1';
				tx_state <= "01";
			when s_data =>
				reset_count <= '0';
				s_tx <= data(to_integer(unsigned(counter_to_7)));
				tx_state <= "10";
				--data <= '0' & data(7 downto 1);
			when s_stop =>
				s_tx <= '1';
				tx_done_tick <= '1';
				tx_state <= "11";
		end case;
	end process;
	
end architecture;
				