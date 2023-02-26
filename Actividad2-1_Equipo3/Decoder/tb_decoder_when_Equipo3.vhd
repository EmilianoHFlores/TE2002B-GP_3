LIBRARY ieee;
USE	ieee.std_logic_1164.ALL;
USE	ieee.std_logic_signed.ALL;
USE	ieee.std_logic_textio.ALL;
USE	std.textio.ALL;

--Entity: no port list!
ENTITY  tb_decoder_when_Equipo3 IS
END	tb_decoder_when_Equipo3;

--Architecture
ARCHITECTURE test_arch OF tb_decoder_when_Equipo3 IS
	COMPONENT Decoder_when_Equipo3
		port(
		input : IN std_logic_vector(3 downto 0);
		 y: OUT std_logic_vector(7 downto 0)
		 );
	END COMPONENT;
	
SIGNAL	input_tb	:	STD_LOGIC_VECTOR(3 DOWNTO 0);			--INPUT
SIGNAL	y_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);			--OUTPUT
SIGNAL	expect				:	STD_LOGIC_VECTOR(7 DOWNTO 0);			--expected


BEGIN

	--DUT Instantiation
	DUT		:	Decoder_when_Equipo3 PORT MAP( input_tb, y_tb );
	
	--Stimulus by hand drawn waves, poor coverage
	stim_proc	:	PROCESS
			  		BEGIN
					WAIT FOR 0 ns;
						input_tb <= "0000"; expect <= (not "00111111");
					WAIT FOR 10 ns;
						input_tb <= "0001"; expect <= (not "00000110");
					WAIT FOR 10 ns;
						input_tb <= "0010"; expect <= (not "01011011");
					WAIT FOR 10 ns;
						input_tb <= "0011"; expect <= (not "01001111");
					WAIT FOR 10 ns;
						input_tb <= "0100"; expect <= (not "01100110");
					WAIT FOR 10 ns;
						input_tb <= "0101"; expect <= (not "01101101");
					WAIT FOR 10 ns;
						input_tb <= "0110"; expect <= (not "01111101");
					WAIT FOR 10 ns;
						input_tb <= "0111"; expect <= (not "00000111");
					WAIT FOR 10 ns;
						input_tb <= "1000"; expect <= (not "01111111");
					WAIT FOR 10 ns;
						input_tb <= "1001"; expect <= (not "01101111");
					WAIT FOR 10 ns;
						input_tb <= "1010"; expect <= (not "01110111");
					WAIT FOR 10 ns;
						input_tb <= "1011"; expect <= (not "01111100");
					WAIT FOR 10 ns;
						input_tb <= "1100"; expect <= (not "00111001");
					WAIT FOR 10 ns;
						input_tb <= "1101"; expect <= (not "01011110");
					WAIT FOR 10 ns;
						input_tb <= "1110"; expect <= (not "01111001");
					WAIT FOR 10 ns;
						input_tb <= "1111"; expect <= (not "01110001");
					WAIT FOR 10 ns;
					WAIT;
				END PROCESS;
						
	--Monitor
	txt_out		:	PROCESS( y_tb )
				VARIABLE str_o	:	LINE;
			  		BEGIN
					WRITE( str_o, STRING'( " input= " 	));	WRITE( str_o, input_tb  	);
					WRITE( str_o, STRING'( " y= " 		));	WRITE( str_o, y_tb 	);
					WRITE( str_o, STRING'( " expect= "  	));	WRITE( str_o, expect	);
					ASSERT false REPORT TIME'IMAGE( NOW ) & str_o.ALL
						SEVERITY note;
					DEALLOCATE( str_o );
				END PROCESS;		

END ARCHITECTURE;