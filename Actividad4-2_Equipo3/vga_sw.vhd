LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY vga_sw IS
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
		pixel_clk: BUFFER STD_LOGIC;
		Hsync, Vsync: BUFFER STD_LOGIC;
		R, G, B: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		nblanck, nsync : OUT STD_LOGIC);
	END vga_sw;

ARCHITECTURE vga_sw OF vga_sw IS

-- Define constants
    constant CLK_FREQ: integer := 50000000;  -- 50 MHz clock frequency
	 constant FPS : INTEGER := 60;
	constant DELAY: integer := CLK_FREQ/FPS;  -- 1 second delay at 100 MHz
	 constant Jump_line : integer := 1;
	 
    -- Define signals
    signal counter: integer range 0 to 50000001 := 0;
SIGNAL delay_done : STD_LOGIC := '0';
SIGNAL Hactive, Vactive, dena: STD_LOGIC;
SIGNAL line_counter_sup : INTEGER := 340;
SIGNAL line_counter_inf : INTEGER := 140;
SIGNAL column_counter_sup : INTEGER := 420;
SIGNAL column_counter_inf : INTEGER := 220;


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
	PROCESS (Hsync, Vsync, Vactive, dena, red_switch, green_switch, blue_switch)
	VARIABLE line_counter: INTEGER RANGE 0 TO Vc;
	VARIABLE column_counter: INTEGER RANGE 0 TO HC;
	VARIABLE line_counter_cent : INTEGER RANGE 0 TO Vc; ----PENDIENTE
	VARIABLE column_counter_cent : INTEGER RANGE 0 TO Hc;
	
	
	
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
			IF ((line_counter<=line_counter_sup and line_counter>= line_counter_inf) and (column_counter>=column_counter_inf and column_counter<=column_counter_sup)) THEN
				R <= (OTHERS => '1');
				G <= (OTHERS => '0');
				B <= (OTHERS => '0');
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
		PROCESS(SW)
		begin
		IF(rising_edge(delay_done)) THEN
			if(SW(0) = '1' and line_counter_inf >= 0) THEN
				line_counter_sup <= line_counter_sup - Jump_line;
				line_counter_inf <= line_counter_inf - Jump_line;
			END IF;
			if(SW(1) = '1' and line_counter_sup <= 480) THEN
				line_counter_sup <= line_counter_sup + Jump_line;
				line_counter_inf <= line_counter_inf + Jump_line;
			END IF;
			if(SW(2) = '1' and column_counter_inf >= 0) THEN
				column_counter_sup <= column_counter_sup - Jump_line;
				column_counter_inf <= column_counter_inf - Jump_line;
			END IF;
			if(SW(3) = '1' and column_counter_sup <= 640) THEN
				column_counter_sup <= column_counter_sup + Jump_line;
				column_counter_inf <= column_counter_inf + Jump_line;
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

		
END vga_sw;