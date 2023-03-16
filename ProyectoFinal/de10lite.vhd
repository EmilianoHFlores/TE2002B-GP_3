LIBRARY 	ieee;
USE		ieee.std_logic_1164.all, ieee.numeric_std.all;

ENTITY de10lite IS
	PORT(	
		CLOCK_50	: 	IN			std_logic;
		
		--Buttons
		KEY		: 	IN 		std_logic_vector( 1 DOWNTO 0 );
		
		--Switches
		SW			: 	IN 		std_logic_vector( 9 DOWNTO 0 );
		LEDR		: 	OUT		std_logic_vector( 9 DOWNTO 0 );
		
		--Accelerometer inputs
		GSENSOR_INT			: IN		std_logic_vector(1 DOWNTO 0);
		GSENSOR_SDI			: INOUT	std_logic;
		GSENSOR_SDO			: INOUT	std_logic;
		GSENSOR_CS_N		: OUT		std_logic;
		GSENSOR_SCLK		: OUT		std_logic;
		
		-- 7 segments displays
		Segmentos		:	OUT		std_logic_vector( 7 DOWNTO 0 );
		Segmentos2		:	OUT		std_logic_vector( 7 DOWNTO 0 );
		
		--Matricial input and output
		col: in std_logic_vector (2 downto 0);
      filas: out std_logic_vector (3 downto 0);
		
		--Screen inputs
		pixel_clk: BUFFER STD_LOGIC;
		Hsync, Vsync: BUFFER STD_LOGIC;
		R, G, B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		nblanck, nsync : OUT STD_LOGIC;
		
		-- buzzer
		buzz : OUT STD_LOGIC
	);
END de10lite;

ARCHITECTURE Structural OF de10lite IS	
	
	-- GUMNUT processor
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
	
	--Decoder that transforms a 4-bit signal to 8-bit signal compatible to 7 segment display
	component Decoder_0to9 IS 
		port(input : IN std_logic_vector(3 downto 0);
		  y: OUT std_logic_vector(7 downto 0));
	END component Decoder_0to9;
	
	--Accelerometer 
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
	
	
	-- Matrix keyboard
	component LIB_TECLADO_MATRICIAL_4x4_INTESC_RevA is
		GENERIC(
			FREQ_CLK : INTEGER := 50_000_000         --FRECUENCIA DE LA TARJETA
		);
		PORT(
			CLK 		  : IN  STD_LOGIC; 						  --RELOJ FPGA
			COLUMNAS   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0); --PUERTO CONECTADO A LAS COLUMNAS DEL TECLADO
			FILAS 	  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --PUERTO CONECTADO A LA FILAS DEL TECLADO
			BOTON_PRES : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --PUERTO QUE INDICA LA TECLA QUE SE PRESION�
			IND		  : OUT STD_LOGIC							  --BANDERA QUE INDICA CUANDO SE PRESION� UNA TECLA (S�LO DURA UN CICLO DE RELOJ)
		);
	end component LIB_TECLADO_MATRICIAL_4x4_INTESC_RevA;
	
	-- Videogame
	COMPONENT vga_pong IS
        GENERIC (
            Ha: INTEGER := 96; --Hpulse
            Hb: INTEGER := 144; --Hpulse+HBP
            Hc: INTEGER := 784; --Hpulse+HBP+Hactive
            Hd: INTEGER := 800; --Hpulse+HBP+Hactive+HFP
            Va: INTEGER := 2; --Vpulse
            Vb: INTEGER := 35; --Vpulse+VBP
            Vc: INTEGER := 515; --Vpulse+VBP+Vactive
            Vd: INTEGER := 525 --Vpulse+VBP+Vactive+VFP
            ); 
        PORT (
            CLOCK_50: IN STD_LOGIC; --50MHz in our board
            --SW : in STD_LOGIC_VECTOR (9 downto 0); --SWITCHES
            pixel_clk: BUFFER STD_LOGIC;
            Hsync, Vsync: BUFFER STD_LOGIC;
            R, G, B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            nblanck, nsync : OUT STD_LOGIC;
            KEY		: 	IN 		std_logic_vector( 1 DOWNTO 0 );
            input_red : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            input_blue : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			-- score is a pulse, team_score is who scored, 0 is red, 1 is blue
			-- score, team_score : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			score, team_score : OUT STD_LOGIC;
			-- Game speed, from slow to fast
			speed : in STD_LOGIC_VECTOR (7 downto 0)
            );
	END COMPONENT;
	
	-- GUMNUT signals
	SIGNAL clk_i, rst_i: std_logic; 
	SIGNAL port_cyc_o, port_stb_o, port_we_o, port_ack_i:	std_logic;
	SIGNAL port_adr_o:	unsigned(7 downto 0);
	SIGNAL port_dat_o, port_dat_i:	std_logic_vector(7 downto 0);
	SIGNAL int_req, int_ack: std_logic;
	
	-- Decoders inputs
	SIGNAL input_decoder1 : std_logic_vector(3 downto 0);
	SIGNAL input_decoder2 : std_logic_vector(3 downto 0);
	
	-- Score and player who scored signals for input data
	SIGNAL playflag_input : std_logic_vector(7 downto 0);
	SIGNAL score_input : std_logic_vector(7 downto 0);
	
	-- Score and player who scored signals sent by Pong
	SIGNAL score :		std_logic;
	SIGNAL team_score : std_logic;
	
	-- Accelerometer signals for GUMNUT
	SIGNAL acel_input : std_logic_vector (7 downto 0);
	SIGNAL temp_acel_input : std_logic_vector(7 downto 0);
	
	-- Switches for input data
	SIGNAL sw_input : std_logic_vector(7 downto 0);
	
	-- Matrix keyboard for input data
	SIGNAL temp_tec_input : std_logic_vector(7 downto 0);
	SIGNAL tec_input		:	std_logic_vector(3 downto 0);
	
	-- Matrix keyboard signal which was not used
	SIGNAL ind_input		: std_logic;
	
	-- Flag that a score was registered
	SIGNAL score_registered : std_logic := '0';
	SIGNAL temp_score_regis : std_logic_vector(7 downto 0); -- Input to GUMNUT
	
	-- Signals sent to Pong, to control red bar and blue bar by drivers
	SIGNAL outputred : std_logic_vector(1 downto 0);
	SIGNAL outputblue : std_logic_vector(1 downto 0);
	
	-- Signal sent to Pong, to control speed
	SIGNAL outputspeed: std_logic_vector(7 downto 0);
	
	
	
	
BEGIN
	
	clk_i 		<= CLOCK_50;
	rst_i 		<= not KEY( 0 );
	port_ack_i	<= '1';	
	
	decoder1 : Decoder_0to9 port map (input_decoder1, Segmentos);
	decoder2 : Decoder_0to9 port map (input_decoder2, Segmentos2);
	
	ace_componente : acelerometro port map (CLOCK_50, KEY, GSENSOR_INT, GSENSOR_SDI, GSENSOR_SDO, GSENSOR_CS_N, GSENSOR_SCLK, acel_input);
	
	tecladomat : LIB_TECLADO_MATRICIAL_4x4_INTESC_RevA generic map (50000000) port map (CLOCK_50, col, filas, tec_input, ind_input);
	
	 vga_component : vga_pong port map (
        CLOCK_50,
        --SW,
        pixel_clk, 
        Hsync, 
        Vsync, 
        R, 
        G, 
        B, 
        nblanck, 
        nsync,
        KEY, 
        outputred, 
        outputblue,
		score,
		team_score,
		outputspeed);
	
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
								
	-- Input Decoder for blue bar 
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '0' and port_adr_o(2) = '0' and port_adr_o(1) = '0' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					input_decoder1 <= port_dat_o( 3 DOWNTO 0 );
				END IF;
			END IF;
	END PROCESS;
	
	-- Input Decoder for red bar 
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '0' and port_adr_o(2) = '0' and port_adr_o(1) = '0' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					input_decoder2 <= port_dat_o( 3 DOWNTO 0 );
				END IF;
			END IF;	
	END PROCESS;
	
	-- Movement of red bar
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '0' and port_adr_o(2) = '0' and port_adr_o(1) = '1' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					outputred <= port_dat_o( 1 DOWNTO 0 );
				END IF;
			END IF;
	END PROCESS;
	
	-- Input of score flag, and implementation of score_registered flag
	PROCESS( clk_i)
		BEGIN
			IF rising_edge( clk_i ) THEN 		
				if(score_registered = '0') then
					IF port_adr_o(3) = '0' and port_adr_o(2) = '0' and port_adr_o(1) = '1' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' and port_we_o = '0' THEN
						-- Input there is a score
						score_registered <= '1';
						score_input <= "0000000" & score;
					END IF;
				else
					if(score = '0') then
						score_registered <= '0';
					end if;
				end if;		
			END IF;
	END PROCESS;
	
	-- Player flag input
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '0' and port_adr_o(2) = '1' and port_adr_o(1) = '0' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					playflag_input <= "0000000" & team_score;
				END IF;
			END IF;
	END PROCESS;
	
	-- Accelerometer input
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '0' and port_adr_o(2) = '1' and port_adr_o(1) = '0' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					-- Input Acelerometro
					temp_acel_input <= acel_input;
				END IF;
			END IF;
	END PROCESS;
	
	-- Matrix keyboard input
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '0' and port_adr_o(2) = '1' and port_adr_o(1) = '1' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					-- Input botones
					temp_tec_input <= "0000" & tec_input;
				END IF;
			END IF;
	END PROCESS;
	
	-- Movement of blue bar
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '0' and port_adr_o(2) = '1' and port_adr_o(1) = '1' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					-- output bluebar
					outputblue <= port_dat_o( 1 DOWNTO 0 );
				END IF;
			END IF;
	END PROCESS;
	
	-- Switches input
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '1' and port_adr_o(2) = '0' and port_adr_o(1) = '0' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					-- Input switches
					sw_input <= SW(9 DOWNTO 2);
				END IF;
			END IF;
	END PROCESS;
	
	-- Speed output to Pong
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '1' and port_adr_o(2) = '0' and port_adr_o(1) = '0' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					-- output bluebar
					outputspeed <= port_dat_o( 7 DOWNTO 0 );
				END IF;
			END IF;
	END PROCESS;
	
	-- Score registered flag input
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '1' and port_adr_o(2) = '0' and port_adr_o(1) = '1' and port_adr_o(0) = '0' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '0' THEN
					-- Input flag score
					temp_score_regis <= "0000000" & score_registered;
				END IF;
			END IF;
	END PROCESS;
	
	-- BUZZ output
	PROCESS( clk_i )
		BEGIN
			IF rising_edge( clk_i ) THEN 
				IF port_adr_o(3) = '1' and port_adr_o(2) = '0' and port_adr_o(1) = '1' and port_adr_o(0) = '1' and port_cyc_o = '1' 	and port_stb_o = '1' 		and port_we_o = '1' THEN
					-- output BUZZ
					buzz <= port_dat_o(0);
				END IF;
			END IF;
	END PROCESS;
	
	-- Mux to decide which temporal input use depending on port address
	With port_adr_o(3 DOWNTO 0) select
					port_dat_i <= score_input when "0011",
						 playflag_input when "0100",
						 temp_acel_input when "0101",
						 temp_tec_input when "0110",
						 sw_input when "1000",
						 temp_score_regis when "1010",
						"00000000" when others;	

	LEDR(9 DOWNTO 4) 	<= ( OTHERS => '0' );
		
END Structural;