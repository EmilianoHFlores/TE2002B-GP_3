LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY MEALY_3_tb is
end MEALY_3_tb;


architecture behavior of MEALY_3_tb is
	component MEALY_3 is
		port(clk: in STD_LOGIC;
			  clr: in STD_LOGIC;
			  onebit: in STD_LOGIC;
			  state: out INTEGER RANGE 0 TO 4;
			  y : out STD_LOGIC);
	end component;
signal clk_tb,clr_tb,onebit_tb, y_tb : std_logic;
constant clk_period : time := 20 ns;
--signal state_0, state_1, state_2, state_3 : std_logic;
signal state_tb : INTEGER RANGE 0 TO 4;
signal expect : STD_LOGIC;
begin

	MEALY_3_tb : MEALY_3
	port map(clk_tb,clr_tb,onebit_tb,state_tb,y_tb);
	CLOCK_PROCESS: process
		begin 
			clk_tb <= '0';
			wait for 10 ns;
			clk_tb <= '1';
			wait for 10 ns;
		end process;
	PRUEBA : process
		begin
		--use of clear
			WAIT FOR 0 ns;
				clr_tb <= '1'; onebit_tb <= '1'; expect <= '0'; 
			--reset 
			--1011011
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '1'; expect <= '0'; 
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '0'; expect <= '0'; 
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '1'; expect <= '0'; 
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '1'; expect <= '1'; 
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '1'; expect <= '0'; 
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '0'; expect <= '0'; 
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '1'; expect <= '0'; 
			wait FOR 20 ns;
				clr_tb <= '0'; onebit_tb <= '1'; expect <= '1'; 
			--end
			WAIT FOR 20 ns;
			WAIT;
		end process;

end behavior;