LIBRARY ieee;
USE	ieee.std_logic_1164.ALL;
USE	ieee.std_logic_signed.ALL;
USE	ieee.std_logic_textio.ALL;
USE	std.textio.ALL;

--Entity: no port list!
ENTITY  tb_MOORE_3 IS
END	tb_MOORE_3;

--Architecture
ARCHITECTURE test_architecture OF tb_MOORE_3 IS
	COMPONENT MOORE_3
		PORT (clk_3, rst_3 : in std_logic;
			left_3, right_3, interm_3 : in std_logic;
			lLights_3, rLights_3 : out std_logic_vector(2 downto 0)
			);
	END COMPONENT;
	
SIGNAL	clk_3_tb : STD_LOGIC := '0';
SIGNAL rst_3_tb, left_3_tb, right_3_tb, interm_3_tb	:	STD_LOGIC := '0';			--INPUT
SIGNAL	lLights_3_tb, rLights_3_tb				:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "000";	--INPUT
SIGNAL expectL_3, expectR_3 : STD_LOGIC_VECTOR (2 DOWNTO 0);

constant clk_3_period : time := 20 ns; --clock period of fpga de10

BEGIN
	--DUT Instantiation
	DUT		:	MOORE_3 PORT MAP( clk_3_tb, rst_3_tb, left_3_tb, right_3_tb, interm_3_tb, lLights_3_tb, rLights_3_tb);
	
	-- Process for generating the clock
   clock_process: PROCESS 
	BEGIN
		clk_3_tb <= '0';
		wait for clk_3_period/2;
		clk_3_tb <= '1';
		wait for clk_3_period/2;
	END PROCESS;
   

	--Stimulus by hand drawn waves, poor coverage
	stim_proc	:	PROCESS
			  		BEGIN
					WAIT FOR 0 ns;
						rst_3_tb <= '0'; left_3_tb <= '0'; right_3_tb <= '0'; interm_3_tb <= '0'; expectL_3 <= "000"; expectR_3 <= "000";
					WAIT FOR clk_3_period * 20;
						rst_3_tb <= '0'; left_3_tb <= '1'; right_3_tb <= '0'; interm_3_tb <= '0'; expectL_3 <= "000"; expectR_3 <= "000";
					WAIT FOR  clk_3_period * 20;
						rst_3_tb <= '0'; left_3_tb <= '0'; right_3_tb <= '0'; interm_3_tb <= '1'; expectL_3 <= "000"; expectR_3 <= "000";
					WAIT FOR  clk_3_period * 20;
						rst_3_tb <= '0'; left_3_tb <= '0'; right_3_tb <= '1'; interm_3_tb <= '0'; expectL_3 <= "000"; expectR_3 <= "000";
					WAIT FOR  clk_3_period * 20;
						rst_3_tb <= '0'; left_3_tb <= '0'; right_3_tb <= '0'; interm_3_tb <= '0'; expectL_3 <= "000"; expectR_3 <= "000";
					WAIT;
				END PROCESS;
						
	--Monitor
	txt_out		:	PROCESS( expectL_3, expectR_3 )
				VARIABLE str_o	:	LINE;
			  		BEGIN
					WRITE( str_o, STRING'( " expectL_3= " 		));	WRITE( str_o, expectL_3 	);
					WRITE( str_o, STRING'( " expectR_3= " 		));	WRITE( str_o, expectR_3 	);
					WRITE( str_o, STRING'( " lLights_3_tb= " 		));	WRITE( str_o, lLights_3_tb 	);
					WRITE( str_o, STRING'( " rLights_3_tb= " 		));	WRITE( str_o, rLights_3_tb 	);
					ASSERT false REPORT TIME'IMAGE( NOW ) & str_o.ALL
						SEVERITY note;
					DEALLOCATE( str_o );
				END PROCESS;		

END ARCHITECTURE;