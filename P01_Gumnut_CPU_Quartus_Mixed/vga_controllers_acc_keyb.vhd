LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY vga_controllers_acc_keyb IS
	PORT (
		CLOCK_50: IN STD_LOGIC; --50MHz in our board
		SW : in STD_LOGIC_VECTOR (9 downto 0); --SWITCHES
		LEDR : OUT STD_LOGIC_VECTOR (9 downto 0); --borrar
		
		--Screen inputs
		pixel_clk: BUFFER STD_LOGIC;
		Hsync, Vsync: BUFFER STD_LOGIC;
		R, G, B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		nblanck, nsync : OUT STD_LOGIC;
		
		--Accelerometer inputs
		GSENSOR_INT			: IN		std_logic_vector(1 DOWNTO 0);
		GSENSOR_SDI			: INOUT	std_logic;
		GSENSOR_SDO			: INOUT	std_logic;
		GSENSOR_CS_N		: OUT		std_logic;
		GSENSOR_SCLK		: OUT		std_logic;
		
		--Matricial inputs
		col   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0); --PUERTO CONECTADO A LAS COLUMNAS DEL TECLADO
		filas		  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --PUERTO CONECTADO A LA FILAS DEL TECLADO
		
		
		--Buttons
		
		
		KEY		: 	IN 		std_logic_vector( 1 DOWNTO 0 )
        );
	END vga_controllers_acc_keyb;

ARCHITECTURE vga_controllers_acc_keyb OF vga_controllers_acc_keyb IS

	COMPONENT acelerometro IS
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
            SW : in STD_LOGIC_VECTOR (9 downto 0); --SWITCHES
            pixel_clk: BUFFER STD_LOGIC;
            Hsync, Vsync: BUFFER STD_LOGIC;
            R, G, B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            nblanck, nsync : OUT STD_LOGIC;
            KEY		: 	IN 		std_logic_vector( 1 DOWNTO 0 );
            input_red : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            input_blue : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
            );
	END COMPONENT;

    SIGNAL acel_input : std_logic_vector (7 downto 0);
	--01 is down, 10 is up del teclado
	 
	 COMPONENT LIB_TECLADO_MATRICIAL_4x4_INTESC_RevA is
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
	 
	 
	 SIGNAL IND_teclado : STD_LOGIC;
	 SIGNAL col_teclado : STD_LOGIC_VECTOR (2 downto 0);
	 SIGNAL BOTON_PRES : STD_LOGIC_VECTOR(3 downto 0);
	 
	-----------------------------------------------------------
    SIGNAL output_red : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL output_blue : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	
	acc_component : acelerometro port map (CLOCK_50, KEY, GSENSOR_INT, GSENSOR_SDI, GSENSOR_SDO, GSENSOR_CS_N, GSENSOR_SCLK, acel_input);
	teclado_pong : LIB_TECLADO_MATRICIAL_4x4_INTESC_RevA generic map (50000000) port map(CLOCK_50, col, filas, BOTON_PRES, IND_teclado);
    process(acel_input)
    begin
        IF (acel_input(7) = '1' or acel_input(6) = '1') THEN
            output_red <= "01";
        ELSIF (acel_input(0) = '1' or acel_input(1) = '1') THEN
            output_red <= "10";
        ELSE
            output_red <= "00";
        END IF;
    end process;

--    process(SW)
--    begin
--        IF (SW(0) = '1') THEN
--            output_blue <= "01";
--        ELSIF (SW(1) = '1') THEN
--            output_blue <= "10";
--        ELSE
--            output_blue <= "00";
--        END IF;
--    end process;

    process(CLOCK_50, Boton_pres, IND_teclado)
    begin
	 if(rising_edge(CLOCK_50)) THEN
        LEDR(0) <='0';
			LEDR(1) <='0';
         output_blue <= "00";
		  IF ( IND_teclado = '1' and boton_pres=x"2") THEN
            output_blue <= "01";
				LEDR(0) <= '1';
        ELSIF (IND_teclado = '1' and boton_pres=x"8") THEN
				output_blue <= "10";
				LEDR(1) <= '1';
        END IF;
	 END IF;
    end process;

    vga_component : vga_pong port map (
        CLOCK_50,
        SW,
        pixel_clk, 
        Hsync, 
        Vsync, 
        R, 
        G, 
        B, 
        nblanck, 
        nsync,
        KEY, 
        output_red, 
        output_blue);

END vga_controllers_acc_keyb;