library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
entity UART_TX_3_tb is
end UART_TX_3_tb;
 
architecture Behave of UART_TX_3_tb is
   
	-- Test Bench uses a 50 MHz Clock
	constant c_CLK_PERIOD : time := 20 ns;
  
	-- Want to interface to 115200 baud UART
	-- 50000000 / 115200 = 434 Clocks Per Bit.
	constant c_CLKS_PER_BIT : integer := 434;
 
	constant c_BIT_PERIOD : time := 8680 ns;
   
	signal clk_tb     	: std_logic                 	:= '0';
	signal tx_start_tb     	: std_logic := '0';
	signal d_in_tb   	: std_logic_vector(7 downto 0);
--	signal tx_done_tick_tb	: std_logic	;
	signal tx_tb 		: std_logic	;
--	signal state_tb : std_logic_vector (1 downto 0);

	component UART_TX_3 is

	port(data : in std_logic_vector(7 downto 0);
		  tx_start,clk,rst: in std_logic;
		  s_tx : out std_logic
		  );
		  
	end component UART_TX_3;	
   
begin
 
	clk_tb <= not clk_tb after c_CLK_PERIOD/2;

   	-- Instantiate UART transmitter
	DUT:	UART_TX_3 port map(d_in_tb, tx_start_tb, clk_tb, '1',tx_tb);
   
	process is
	begin
		wait for 0 ns;
		tx_start_tb   <= '0'; d_in_tb <= "11001100";
		wait for 2000000 ns;
		tx_start_tb   <= '0'; d_in_tb <= "10101010";
		wait for 200000 ns;
		tx_start_tb   <= '1'; d_in_tb <= "11001100";
		wait for 200000 ns;
		tx_start_tb   <= '0'; d_in_tb <= "10101010";
		wait for 200000 ns;
		tx_start_tb   <= '1'; d_in_tb <= "10101010";
		wait for 200000 ns;
		tx_start_tb   <= '0'; d_in_tb <= "11001100";
		wait for 200000 ns;
		wait;
	end process;
end Behave;
