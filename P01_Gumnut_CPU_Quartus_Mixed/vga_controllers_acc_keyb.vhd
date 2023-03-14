LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY vga_controllers_acc_keyb IS
	PORT (
		CLOCK_50: IN STD_LOGIC; --50MHz in our board
		SW : in STD_LOGIC_VECTOR (9 downto 0); --SWITCHES
		
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

    SIGNAL output_red : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL output_blue : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	
	acc_component : acelerometro port map (CLOCK_50, KEY, GSENSOR_INT, GSENSOR_SDI, GSENSOR_SDO, GSENSOR_CS_N, GSENSOR_SCLK, acel_input);

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

    process(SW)
    begin
        IF (SW(0) = '1') THEN
            output_blue <= "01";
        ELSIF (SW(1) = '1') THEN
            output_blue <= "10";
        ELSE
            output_blue <= "00";
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