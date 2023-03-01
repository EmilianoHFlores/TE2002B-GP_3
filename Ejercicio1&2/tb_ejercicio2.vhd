LIBRARY ieee;
USE	ieee.std_logic_1164.ALL;
USE	ieee.std_logic_signed.ALL;
USE	ieee.std_logic_textio.ALL;
USE	std.textio.ALL;

--Entity: no port list!
ENTITY  tb_ejercicio2 IS
END	tb_ejercicio2;

--Architecture
ARCHITECTURE test_architecture OF tb_ejercicio2 IS
	COMPONENT ejercicio2
   port (clk, rst: in std_logic;
         cnt: in std_logic;
         C: out std_logic_vector(2 downto 0);
         tc: out std_logic);
	end COMPONENT;
	
SIGNAL clk_tb : STD_LOGIC := '0';
SIGNAL rst_tb, cnt_tb : STD_LOGIC := '0';
SIGNAL C_tb : std_logic_vector(2 downto 0);
signal tc_tb : std_logic;

constant clk_period : time := 100 ns; --clock period of fpga de10

BEGIN
	--DUT Instantiation
	DUT		:	ejercicio2 PORT MAP( clk_tb, rst_tb, cnt_tb, C_tb, tc_tb);
	
	-- Process for generating the clock
   clock_process: PROCESS 
	BEGIN
		clk_tb <= '0';
		wait for clk_period/2;
		clk_tb <= '1';
		wait for clk_period/2;
	END PROCESS;
   

	--Stimulus by hand drawn waves, poor coverage
	stim_proc	:	PROCESS
			  		BEGIN
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					WAIT FOR clk_period;
						rst_tb <= '0'; cnt_tb <= '1';
					Wait for 10 ns;
					WAIT;
				END PROCESS;
						
	--Monitor
	txt_out		:	PROCESS( tc_tb, C_tb )
				VARIABLE str_o	:	LINE;
			  		BEGIN
					WRITE( str_o, STRING'( " tc_tb = " 		));	WRITE( str_o, tc_tb	);
					WRITE( str_o, STRING'( " C_tb =" 		));	WRITE( str_o, C_tb 	);
					ASSERT false REPORT TIME'IMAGE( NOW ) & str_o.ALL
						SEVERITY note;
					DEALLOCATE( str_o );
				END PROCESS;		

END ARCHITECTURE;