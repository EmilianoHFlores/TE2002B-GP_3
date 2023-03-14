LIBRARY 	ieee;
USE		ieee.std_logic_1164.all, ieee.numeric_std.all;

ENTITY de10lite IS
	PORT(	
		CLOCK_50	: 	IN			std_logic;
		KEY		: 	IN 		std_logic_vector( 1 DOWNTO 0 );
		SW			: 	IN 		std_logic_vector( 9 DOWNTO 0 );
		LEDR		: 	OUT		std_logic_vector( 9 DOWNTO 0 );
		GSENSOR_INT			: IN		std_logic_vector(1 DOWNTO 0);
		GSENSOR_SDI			: INOUT	std_logic;
		GSENSOR_SDO			: INOUT	std_logic;
		GSENSOR_CS_N		: OUT		std_logic;
		GSENSOR_SCLK		: OUT		std_logic;
		Segmentos		:	OUT		std_logic_vector( 7 DOWNTO 0 );
		Segmentos2		:	OUT		std_logic_vector( 7 DOWNTO 0 )
	);
END de10lite;

ARCHITECTURE Structural OF de10lite IS	
	
	component gumnut_with_mem IS
		generic ( 
			IMem_file_name : string := "gasm_text.dat";
			DMem_file_name : string := "gasm_data.dat";
         debug : boolean := false );
		port ( clk_i : in std_logic;
         rst_i : in std_logic;
         -- I/O port bus
         port_cyc_o : out std_logic;
         port_stb_o : out std_logic;
         port_we_o : out std_logic;
         port_ack_i : in std_logic;
         port_adr_o : out unsigned(7 downto 0);
         port_dat_o : out std_logic_vector(7 downto 0);
         port_dat_i : in std_logic_vector(7 downto 0);
         -- Interrupts
         int_req : in std_logic;
         int_ack : out std_logic );
	end component gumnut_with_mem;
	
	component Decoder_0to9 IS 
		port(input : IN std_logic_vector(3 downto 0);
		  y: OUT std_logic_vector(7 downto 0));
	END component Decoder_0to9;
	
	component acelerometro IS
	PORT(	CLOCK_50				: IN		std_logic;
			KEY					: IN		std_logic_vector(1 DOWNTO 0);
			GSENSOR_INT			: IN		std_logic_vector(1 DOWNTO 0);
			GSENSOR_SDI			: INOUT	std_logic;
			GSENSOR_SDO			: INOUT	std_logic;
			GSENSOR_CS_N		: OUT		std_logic;
			GSENSOR_SCLK		: OUT		std_logic;
			output					: OUT		std_logic_vector(7 DOWNTO 0)
	);
	end component;
	
	SIGNAL clk_i, rst_i: std_logic; 
	SIGNAL port_cyc_o, port_stb_o, port_we_o, port_ack_i:	std_logic;
	SIGNAL port_adr_o:	unsigned(7 downto 0);
	SIGNAL port_dat_o, port_dat_i:	std_logic_vector(7 downto 0);
	SIGNAL int_req, int_ack: std_logic;
	SIGNAL input_decoder1 : std_logic_vector(3 downto 0);
	SIGNAL input_decoder2 : std_logic_vector(3 downto 0);
	SIGNAL sw_input : std_logic_vector(7 downto 0);
	SIGNAL btn_input : std_logic_vector(7 downto 0);
	SIGNAL acel_input : std_logic_vector (7 downto 0);
	SIGNAL temp_acel_input : std_logic_vector(7 downto 0);
	SIGNAL temp_switch_input : std_logic_vector(7 downto 0);
	
BEGIN
	
	clk_i 		<= CLOCK_50;
	rst_i 		<= not KEY( 0 );
	port_ack_i	<= '1';	
	
	decoder1 : Decoder_0to9 port map (input_decoder1, Segmentos);
	decoder2 : Decoder_0to9 port map (input_decoder2, Segmentos2);
	
	ace_componente : acelerometro port map (CLOCK_50, KEY, GSENSOR_INT, GSENSOR_SDI, GSENSOR_SDO, GSENSOR_CS_N, GSENSOR_SCLK, acel_input);
	
	gumnut : 		COMPONENT gumnut_with_mem 
							PORT MAP(
								clk_i,
								rst_i,
								port_cyc_o,
								port_stb_o,
								port_we_o,
								port_ack_i,
								port_adr_o( 7 DOWNTO 0 ),
								port_dat_o( 7 DOWNTO 0 ),
								port_dat_i( 7 DOWNTO 0 ),
								int_req,
								int_ack
								);																	

	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(2) = '0' and port_adr_o(1) = '0' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					input_decoder1 <= port_dat_o( 3 DOWNTO 0 );
				END IF;
			END IF;
	END PROCESS;
	
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(2) = '0' and port_adr_o(1) = '0' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					input_decoder2 <= port_dat_o( 3 DOWNTO 0 );
				END IF;
			END IF;	
	END PROCESS;
	
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(2) = '0' and port_adr_o(1) = '1' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					LEDR( 7 DOWNTO 0 ) <= port_dat_o( 7 DOWNTO 0 );
				END IF;
			END IF;
	END PROCESS;
	
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(2) = '0' and port_adr_o(1) = '1' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					btn_input <= "0000000" & KEY(1);
				END IF;
			END IF;
	END PROCESS;
	
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(2) = '1' and port_adr_o(1) = '0' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					SW_input <= "0000000" & SW(0);
				END IF;
			END IF;
	END PROCESS;
	
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(2) = '1' and port_adr_o(1) = '0' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					temp_acel_input <= acel_input;
				END IF;
			END IF;
	END PROCESS;
	
	With port_adr_o(2 DOWNTO 0) select
					port_dat_i <= btn_input when "011",
						 SW_input when "100",
						 temp_acel_input when "101",
						"00000000" when others;	

	LEDR(9 DOWNTO 8) 	<= ( OTHERS => '0' );
		
END Structural;