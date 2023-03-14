LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY vga_pong IS
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
		clk: IN STD_LOGIC; --50MHz in our board
		red_switch, green_switch, blue_switch: IN STD_LOGIC;
		SW : in STD_LOGIC_VECTOR (9 downto 0); --sWITCHES
		rst, start: in STD_LOGIC;
		pixel_clk: BUFFER STD_LOGIC;
		Hsync, Vsync: BUFFER STD_LOGIC;
		R, G, B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		nblanck, nsync : OUT STD_LOGIC
        );
	END vga_pong;

ARCHITECTURE vga_pong OF vga_pong IS
	--Accelerometer instance--
	COMPONENT accelerometer IS
		PORT(	CLOCK_50				: IN		std_logic;
			KEY					: IN		std_logic_vector(1 DOWNTO 0);
			GSENSOR_INT			: IN		std_logic_vector(1 DOWNTO 0);
			GSENSOR_SDI			: INOUT	std_logic;
			GSENSOR_SDO			: INOUT	std_logic;
			GSENSOR_CS_N		: OUT		std_logic;
			GSENSOR_SCLK		: OUT		std_logic;
			LEDR					: OUT		std_logic_vector(9 DOWNTO 0)
	);
	END COMPONENT accelerometer;
    COMPONENT random_integer IS 
        GENERIC (
            min : INTEGER := 0;
            max : INTEGER := 100;
				seed: INTEGER := 1
        );
        PORT (clk : IN STD_LOGIC;
            rand : OUT INTEGER := 0
        );
    END COMPONENT random_integer;

-- Define constants
	constant CLK_FREQ: integer := 50000000;  -- 50 MHz clock frequency
	constant FPS : INTEGER := 60;
	constant DELAY: integer := CLK_FREQ/FPS;  -- 1 second delay at 100 MHz

    --Screen size
    constant screen_height : integer := 480;
    constant screen_width : integer := 640;
	
	--For bar width and positions
	CONSTANT bar_width : integer := 10;
	CONSTANT left_bar_col_inf : INTEGER := 10;
	CONSTANT left_bar_col_sup : INTEGER := left_bar_col_inf + bar_width;
	CONSTANT right_bar_col_inf : INTEGER := 610;
	CONSTANT right_bar_col_sup : INTEGER := right_bar_col_inf + bar_width;

	--For bar length and predetermined length
	CONSTANT bar_length : integer := 80;
	CONSTANT bar_line_orig : integer := 340;
	
	
	SIGNAL left_line_counter_sup : INTEGER := bar_line_orig + (bar_length/2);
	SIGNAL left_line_counter_inf : INTEGER := bar_line_orig - (bar_length/2);
	SIGNAL right_line_counter_sup : INTEGER := bar_line_orig + (bar_length/2);
	SIGNAL right_line_counter_inf : INTEGER := bar_line_orig - (bar_length/2);

	--For ball
	CONSTANT ball_size : integer := 10;
	CONSTANT ball_line_orig : integer := 240;
	CONSTANT ball_col_orig : integer := 320;
	Signal ball_line_sup : integer := ball_line_orig + (ball_size/2);
	Signal ball_line_inf : integer := ball_line_orig - (ball_size/2);
	Signal ball_col_sup : integer := ball_col_orig + (ball_size/2);
	Signal ball_col_inf : integer := ball_col_orig - (ball_size/2);
	
	--For random spawns
	SIGNAL left_line_random : INTEGER;
	SIGNAL right_line_random : INTEGER;
	SIGNAL ball_line_random : INTEGER;
	SIGNAL ball_state_random : INTEGER;
	
	-- Define signals for the VGA controller
	SIGNAL counter: integer range 0 to 50000001 := 0;
	SIGNAL delay_done : STD_LOGIC := '0';
	SIGNAL Hactive, Vactive, dena: STD_LOGIC;
	SIGNAL button_pressed: STD_LOGIC := '0';
	
	-- Ball states : idle, red, blue
	type state_type is (idle, red, blue);
	signal ball_state : state_type := idle;


	--SPEED CONTROLLER
	SIGNAL Jump_line : integer := 1;


BEGIN

   random_left: random_integer generic map (20, 460, 5) port map(clk, left_line_random);
   random_right: random_integer generic map (20, 460, 1) port map(clk, right_line_random);
	random_ball: random_integer generic map (10, 470, 2) port map(clk, ball_line_random);
	random_state: random_integer generic map (0, 2, 1) port map(clk, ball_state_random);

-------------------------------------------------------
--Part 1: CONTROL GENERATOR
-------------------------------------------------------
	--Static signals for DACs:
	nblanck <= '1'; --no direct blanking
	nsync <= '0'; --no sync on green
	--Create pixel clock (50MHz->25MHz):
	PROCESS (clk)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN pixel_clk <= NOT pixel_clk;
		END IF;
	END PROCESS;
	--Horizontal signals generation:
	PROCESS (pixel_clk)
	VARIABLE Hcount: INTEGER RANGE 0 TO Hd;
	BEGIN
		IF (pixel_clk'EVENT AND pixel_clk='1') THEN Hcount := Hcount + 1;
			IF (Hcount=Ha) THEN Hsync <= '1';
			ELSIF (Hcount=Hb) THEN Hactive <= '1';
			ELSIF (Hcount=Hc) THEN Hactive <= '0';
			ELSIF (Hcount=Hd) THEN Hsync <= '0'; Hcount := 0;
			END IF;
		END IF;
	END PROCESS;
	--Vertical signals generation:
	PROCESS (Hsync)
	VARIABLE Vcount: INTEGER RANGE 0 TO Vd;
	BEGIN
		IF (Hsync'EVENT AND Hsync='0') THEN Vcount := Vcount + 1;
			IF (Vcount=Va) THEN Vsync <= '1';
			ELSIF (Vcount=Vb) THEN Vactive <= '1';
			ELSIF (Vcount=Vc) THEN Vactive <= '0';
			ELSIF (Vcount=Vd) THEN Vsync <= '0'; Vcount := 0;
			END IF;
		END IF;
	END PROCESS;
	---Display enable generation:
	dena <= Hactive AND Vactive;
	-------------------------------------------------------
	--Part 2: IMAGE GENERATOR
	-------------------------------------------------------
	IMAGE: PROCESS (Hsync, Vsync, Vactive, dena, red_switch, green_switch, blue_switch)
	
		VARIABLE line_counter: INTEGER RANGE 0 TO Vc;
		VARIABLE column_counter: INTEGER RANGE 0 TO HC;

	BEGIN
		IF (Vsync='0') THEN
			line_counter := 0;
		ELSIF (Hsync'EVENT AND Hsync='1') THEN
			IF (Vactive='1') THEN
				line_counter := line_counter + 1;
			END IF;
		END IF;
		
		IF (HSync = '0') THEN 
			column_counter :=  0;
		ELSIF(pixel_clk'EVENT and pixel_clk = '1') THEN
			IF(hactiVe = '1') THEN 
				column_counter := column_counter + 1;
			END IF;
		END IF;
		
		IF (dena='1') THEN
            --lEFT BAR
			IF ((line_counter<=left_line_counter_sup and line_counter>= left_line_counter_inf) and (column_counter>=left_bar_col_inf and column_counter<=left_bar_col_sup)) THEN
				R <= (OTHERS => '1');
				G <= (OTHERS => '0');
				B <= (OTHERS => '0');
			--RIGHT BAR
			ELSIF((line_counter<=right_line_counter_sup and line_counter>= right_line_counter_inf) and (column_counter>=right_bar_col_inf and column_counter<=right_bar_col_sup)) THEN
				 R <= (OTHERS => '0');
				 G <= (OTHERS => '0');
				 B <= (OTHERS => '1');
			--BALL
			ELSIF((line_counter<=ball_line_sup and line_counter>= ball_line_inf) and (column_counter>=ball_col_sup and column_counter<=ball_col_inf)) THEN
				IF (ball_state = red) THEN
					R <= (OTHERS => '1');
					G <= (OTHERS => '0');
					B <= (OTHERS => '0');
				ELSIF (ball_state = blue) THEN
					R <= (OTHERS => '0');
					G <= (OTHERS => '0');
					B <= (OTHERS => '1');
				ELSE
					R <= (OTHERS => '0');
					G <= (OTHERS => '1');
					B <= (OTHERS => '0');
				END IF;
			ELSE
				R <= (OTHERS => '1');
				G <= (OTHERS => '1');
				B <= (OTHERS => '1'); 	
			END IF;
			ElSE
			R <= (OTHERS => '0');
			G <= (OTHERS => '0');
			B <= (OTHERS => '0');
			
		
		END IF;
	
	END PROCESS;
	
		-----------Botones---------------
	PROCESS(SW, rst)
		begin
			
			IF(rising_edge(delay_done)) THEN				
				-- Button presses
				IF (button_pressed = '0') THEN
					--Reset
					IF (start = '0') THEN
						button_pressed <= '1';
						left_line_counter_sup <= bar_line_orig + (bar_length/2);
						left_line_counter_inf <= bar_line_orig - (bar_length/2);
						right_line_counter_sup <= bar_line_orig + (bar_length/2);
						right_line_counter_inf <= bar_line_orig - (bar_length/2);
						ball_line_sup <= ball_line_orig + (ball_size/2);
						ball_line_inf <= ball_line_orig - (ball_size/2);
						ball_col_sup <= ball_col_orig + (ball_size/2);
						ball_col_inf <= ball_col_orig - (ball_size/2);
						IF (ball_state_random = 1) THEN
							ball_state <= red;
						ELSE
							ball_state <= blue;
						END IF;
					--Game Start
					ELSIF (rst = '0') THEN 
					
						button_pressed <= '1';
						left_line_counter_sup <= left_line_random + (bar_length/2);
						left_line_counter_inf <= left_line_random - (bar_length/2);
						right_line_counter_sup <= right_line_random + (bar_length/2);
						right_line_counter_inf <= right_line_random - (bar_length/2);
						ball_line_sup <= ball_line_random + (ball_size/2);
						ball_line_inf <= ball_line_random - (ball_size/2);
						ball_col_sup <= ball_col_orig + (ball_size/2);
						ball_col_inf <= ball_col_orig - (ball_size/2);
						IF (ball_state_random = 1) THEN
							ball_state <= red;
						ELSE
							ball_state <= blue;
						END IF;
					else
							-- Left bar movements
						IF(SW(0) = '1' and left_line_counter_inf >= 0) THEN
							left_line_counter_sup <= left_line_counter_sup - Jump_line;
							left_line_counter_inf <= left_line_counter_inf - Jump_line;
						ELSIF(SW(1) = '1' and left_line_counter_sup <= 480) THEN
							left_line_counter_sup <= left_line_counter_sup + Jump_line;
							left_line_counter_inf <= left_line_counter_inf + Jump_line;
						END IF;

						-- Right bar movements
						IF(SW(2) = '1' and right_line_counter_inf >= 0) THEN
							right_line_counter_sup <= right_line_counter_sup - Jump_line;
							right_line_counter_inf <= right_line_counter_inf - Jump_line;
						ELSIF(SW(3) = '1' and right_line_counter_sup <= 480) THEN
							right_line_counter_sup <= right_line_counter_sup + Jump_line;
							right_line_counter_inf <= right_line_counter_inf + Jump_line;
						END IF;
					END IF;
					
				ELSE
					IF (rst = '1' and start = '1') THEN
						button_pressed <= '0';
					END IF;
				END IF;
				
			END IF;
		END PROCESS;
		
		delay_S: process (clk)
		begin
			if (rising_edge(clk)) then
				if (counter>=DELAY) then
					counter <= 0;
					delay_done <= '1';
				else
					counter <= counter + 1;
					delay_done <= '0';
				end if;
			end if;
	end process;

	speed_control: PROCESS (clk, SW) is
		VARIABLE switches : std_logic_vector(3 downto 0);
		begin
			if (rising_edge(clk)) then
				switches := SW(9 downto 6);
				Jump_line <= to_integer(unsigned(switches)) + 1;
			end if;
	end process;

END vga_pong;