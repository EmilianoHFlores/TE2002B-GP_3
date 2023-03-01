LIBRARY ieee;
USE	ieee.std_logic_1164.ALL;
USE	ieee.std_logic_signed.ALL;
USE	ieee.std_logic_textio.ALL;
USE	std.textio.ALL;

--Entity: no port list!
ENTITY  tb_CarLights IS
END	tb_CarLights;

--Architecture
ARCHITECTURE test_architecture OF tb_CarLights IS
	COMPONENT CarLights
		PORT (clk, rst : in std_logic;
			left, right, interm : in std_logic;
			lLights, rLights : out std_logic_vector(2 downto 0)
			);
	END COMPONENT;
	
SIGNAL	clk_tb : STD_LOGIC := '0';
SIGNAL rst_tb, left_tb, right_tb, interm_tb	:	STD_LOGIC := '0';			--INPUT
SIGNAL	lLights_tb, rLights_tb				:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "000";	--INPUT
SIGNAL expectL, expectR : STD_LOGIC_VECTOR (2 DOWNTO 0);

constant clk_period : time := 20 ns; --clock period of fpga de10

BEGIN
	--DUT Instantiation
	DUT		:	CarLights PORT MAP( clk_tb, rst_tb, left_tb, right_tb, interm_tb, lLights_tb, rLights_tb);
	
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
					WAIT FOR 0 ns;
						rst_tb <= '0'; left_tb <= '0'; right_tb <= '0'; interm_tb <= '0'; expectL <= "000"; expectR <= "000";
					WAIT FOR clk_period * 600;
						rst_tb <= '0'; left_tb <= '1'; right_tb <= '0'; interm_tb <= '0'; expectL <= "000"; expectR <= "000";
					WAIT FOR  clk_period * 600;
						rst_tb <= '0'; left_tb <= '0'; right_tb <= '0'; interm_tb <= '1'; expectL <= "000"; expectR <= "000";
					WAIT FOR  clk_period * 600;
						rst_tb <= '0'; left_tb <= '0'; right_tb <= '1'; interm_tb <= '0'; expectL <= "000"; expectR <= "000";
					WAIT FOR  clk_period * 600;
						rst_tb <= '0'; left_tb <= '0'; right_tb <= '0'; interm_tb <= '0'; expectL <= "000"; expectR <= "000";
					WAIT;
				END PROCESS;
						
	--Monitor
	txt_out		:	PROCESS( expectL, expectR )
				VARIABLE str_o	:	LINE;
			  		BEGIN
					WRITE( str_o, STRING'( " expectL= " 		));	WRITE( str_o, expectL 	);
					WRITE( str_o, STRING'( " expectR= " 		));	WRITE( str_o, expectR 	);
					WRITE( str_o, STRING'( " lLights_tb= " 		));	WRITE( str_o, lLights_tb 	);
					WRITE( str_o, STRING'( " rLights_tb= " 		));	WRITE( str_o, rLights_tb 	);
					ASSERT false REPORT TIME'IMAGE( NOW ) & str_o.ALL
						SEVERITY note;
					DEALLOCATE( str_o );
				END PROCESS;		

END ARCHITECTURE;