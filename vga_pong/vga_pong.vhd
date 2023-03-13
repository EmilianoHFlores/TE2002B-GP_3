LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY vga_pong IS
	GENERIC (
		Ha: INTEGER := 96; --Hpulse
		Hb: INTEGER := 144; --Hpulse+HBP
		Hc: INTEGER := 784; --Hpulse+HBP+Hactive
		Hd: INTEGER := 800; --Hpulse+HBP+Hactive+HFP
		Va: INTEGER := 2; --Vpulse
		Vb: INTEGER := 35; --Vpulse+VBP
		Vc: INTEGER := 515; --Vpulse+VBP+Vactive
		Vd: INTEGER := 525); --Vpulse+VBP+Vactive+VFP
	PORT (
		clk: IN STD_LOGIC; --50MHz in our board
		red_switch, green_switch, blue_switch: IN STD_LOGIC;
		SW : in STD_LOGIC_VECTOR (7 downto 0); --sWITCHES
		rst: in STD_LOGIC;
		pixel_clk: BUFFER STD_LOGIC;
		Hsync, Vsync: BUFFER STD_LOGIC;
		R, G, B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		nblanck, nsync : OUT STD_LOGIC);
	END vga_pong;

ARCHITECTURE vga_pong OF vga_pong IS

-- Define constants
	constant CLK_FREQ: integer := 50000000;  -- 50 MHz clock frequency
	constant FPS : INTEGER := 60;
	constant DELAY: integer := CLK_FREQ/FPS;  -- 1 second delay at 100 MHz
	constant Jump_line : integer := 1;
	
	--For bar width and positions
	CONSTANT bar_width : integer := 20;
	CONSTANT left_bar_col_inf : INTEGER := 10;
	CONSTANT left_bar_col_sup : INTEGER := left_bar_col_inf + bar_width;
	CONSTANT right_bar_col_inf : INTEGER := 610;
	CONSTANT right_bar_col_sup : INTEGER := right_bar_col_inf + bar_width;

	--For bar length and predetermined length
	CONSTANT bar_length : integer := 60;
	CONSTANT bar_line_orig : integer := 340 - (bar_length/2);
	
	
	SIGNAL left_line_counter_sup : INTEGER := bar_line_orig + bar_length;
	SIGNAL left_line_counter_inf : INTEGER := bar_line_orig;
	SIGNAL right_line_counter_sup : INTEGER := bar_line_orig + bar_length;
	SIGNAL right_line_counter_inf : INTEGER := bar_line_orig;
	
	-- Define signals
	SIGNAL counter: integer range 0 to 50000001 := 0;
	SIGNAL delay_done : STD_LOGIC := '0';
	SIGNAL Hactive, Vactive, dena: STD_LOGIC;


BEGIN
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
				--Reset
				IF (rst = '0') THEN
					left_line_counter_sup <= bar_line_orig + bar_length;
					left_line_counter_inf <= bar_line_orig;
					right_line_counter_sup <= bar_line_orig + bar_length;
					right_line_counter_inf <= bar_line_orig;
			
				--Bar movements
				ELSIF(SW(0) = '1' and left_line_counter_inf >= 0) THEN
					left_line_counter_sup <= left_line_counter_sup - Jump_line;
					left_line_counter_inf <= left_line_counter_inf - Jump_line;
				END IF;
				if(SW(1) = '1' and left_line_counter_sup <= 480) THEN
					left_line_counter_sup <= left_line_counter_sup + Jump_line;
					left_line_counter_inf <= left_line_counter_inf + Jump_line;
				END IF;
					if(SW(2) = '1' and right_line_counter_inf >= 0) THEN
					right_line_counter_sup <= right_line_counter_sup - Jump_line;
					right_line_counter_inf <= right_line_counter_inf - Jump_line;
				END IF;
				if(SW(3) = '1' and right_line_counter_sup <= 480) THEN
					right_line_counter_sup <= right_line_counter_sup + Jump_line;
					right_line_counter_inf <= right_line_counter_inf + Jump_line;
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

		
END vga_pong;