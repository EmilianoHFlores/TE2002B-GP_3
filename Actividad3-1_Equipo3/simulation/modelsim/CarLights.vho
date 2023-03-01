-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "02/28/2023 19:04:05"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CarLights IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	left : IN std_logic;
	right : IN std_logic;
	interm : IN std_logic;
	lLights : OUT std_logic_vector(2 DOWNTO 0);
	rLights : OUT std_logic_vector(2 DOWNTO 0)
	);
END CarLights;

-- Design Ports Information
-- rst	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lLights[0]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lLights[1]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lLights[2]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rLights[0]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rLights[1]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rLights[2]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- left	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- interm	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- right	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CarLights IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_left : std_logic;
SIGNAL ww_right : std_logic;
SIGNAL ww_interm : std_logic;
SIGNAL ww_lLights : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rLights : std_logic_vector(2 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \delay_done~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \next_state.s3_0~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \next_state.s3_1~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \lLights[0]~output_o\ : std_logic;
SIGNAL \lLights[1]~output_o\ : std_logic;
SIGNAL \lLights[2]~output_o\ : std_logic;
SIGNAL \rLights[0]~output_o\ : std_logic;
SIGNAL \rLights[1]~output_o\ : std_logic;
SIGNAL \rLights[2]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \right~input_o\ : std_logic;
SIGNAL \left~input_o\ : std_logic;
SIGNAL \interm~input_o\ : std_logic;
SIGNAL \counter[0]~26_combout\ : std_logic;
SIGNAL \counter[0]~27\ : std_logic;
SIGNAL \counter[1]~28_combout\ : std_logic;
SIGNAL \counter[1]~29\ : std_logic;
SIGNAL \counter[2]~30_combout\ : std_logic;
SIGNAL \counter[2]~31\ : std_logic;
SIGNAL \counter[3]~32_combout\ : std_logic;
SIGNAL \counter[3]~33\ : std_logic;
SIGNAL \counter[4]~34_combout\ : std_logic;
SIGNAL \counter[4]~35\ : std_logic;
SIGNAL \counter[5]~36_combout\ : std_logic;
SIGNAL \counter[5]~37\ : std_logic;
SIGNAL \counter[6]~38_combout\ : std_logic;
SIGNAL \counter[6]~39\ : std_logic;
SIGNAL \counter[7]~40_combout\ : std_logic;
SIGNAL \counter[7]~41\ : std_logic;
SIGNAL \counter[8]~42_combout\ : std_logic;
SIGNAL \counter[8]~43\ : std_logic;
SIGNAL \counter[9]~44_combout\ : std_logic;
SIGNAL \counter[9]~45\ : std_logic;
SIGNAL \counter[10]~46_combout\ : std_logic;
SIGNAL \counter[10]~47\ : std_logic;
SIGNAL \counter[11]~48_combout\ : std_logic;
SIGNAL \counter[11]~49\ : std_logic;
SIGNAL \counter[12]~50_combout\ : std_logic;
SIGNAL \counter[12]~51\ : std_logic;
SIGNAL \counter[13]~52_combout\ : std_logic;
SIGNAL \counter[13]~53\ : std_logic;
SIGNAL \counter[14]~54_combout\ : std_logic;
SIGNAL \counter[14]~55\ : std_logic;
SIGNAL \counter[15]~56_combout\ : std_logic;
SIGNAL \counter[15]~57\ : std_logic;
SIGNAL \counter[16]~58_combout\ : std_logic;
SIGNAL \delay~4_combout\ : std_logic;
SIGNAL \counter[16]~59\ : std_logic;
SIGNAL \counter[17]~60_combout\ : std_logic;
SIGNAL \counter[17]~61\ : std_logic;
SIGNAL \counter[18]~62_combout\ : std_logic;
SIGNAL \counter[18]~63\ : std_logic;
SIGNAL \counter[19]~64_combout\ : std_logic;
SIGNAL \counter[19]~65\ : std_logic;
SIGNAL \counter[20]~66_combout\ : std_logic;
SIGNAL \delay~5_combout\ : std_logic;
SIGNAL \delay~0_combout\ : std_logic;
SIGNAL \delay~1_combout\ : std_logic;
SIGNAL \delay~2_combout\ : std_logic;
SIGNAL \delay~3_combout\ : std_logic;
SIGNAL \counter[20]~67\ : std_logic;
SIGNAL \counter[21]~68_combout\ : std_logic;
SIGNAL \counter[21]~69\ : std_logic;
SIGNAL \counter[22]~70_combout\ : std_logic;
SIGNAL \counter[22]~71\ : std_logic;
SIGNAL \counter[23]~72_combout\ : std_logic;
SIGNAL \counter[23]~73\ : std_logic;
SIGNAL \counter[24]~74_combout\ : std_logic;
SIGNAL \counter[24]~75\ : std_logic;
SIGNAL \counter[25]~76_combout\ : std_logic;
SIGNAL \delay~6_combout\ : std_logic;
SIGNAL \delay~7_combout\ : std_logic;
SIGNAL \delay~8_combout\ : std_logic;
SIGNAL \delay_done~0_combout\ : std_logic;
SIGNAL \delay_done~q\ : std_logic;
SIGNAL \next_state.s3_1~1_combout\ : std_logic;
SIGNAL \next_state.s3_1~1clkctrl_outclk\ : std_logic;
SIGNAL \next_state.s3_1~2_combout\ : std_logic;
SIGNAL \next_state.s3_1_368~combout\ : std_logic;
SIGNAL \present_state.s3_1~q\ : std_logic;
SIGNAL \next_state.s3_0~1_combout\ : std_logic;
SIGNAL \next_state.s3_0_378~combout\ : std_logic;
SIGNAL \present_state.s3_0~q\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \comb~1_combout\ : std_logic;
SIGNAL \skip_delay~combout\ : std_logic;
SIGNAL \next_state.s3_0~0_combout\ : std_logic;
SIGNAL \next_state.s3_0~0clkctrl_outclk\ : std_logic;
SIGNAL \next_state.s2_1~0_combout\ : std_logic;
SIGNAL \next_state.s2_1_412~combout\ : std_logic;
SIGNAL \present_state.s2_1~q\ : std_logic;
SIGNAL \next_state.s2_2~0_combout\ : std_logic;
SIGNAL \next_state.s2_2_398~combout\ : std_logic;
SIGNAL \present_state.s2_2~q\ : std_logic;
SIGNAL \next_state.s2_3~0_combout\ : std_logic;
SIGNAL \next_state.s2_3_388~combout\ : std_logic;
SIGNAL \present_state.s2_3~q\ : std_logic;
SIGNAL \next_state.s2_0~0_combout\ : std_logic;
SIGNAL \next_state.s2_0_422~combout\ : std_logic;
SIGNAL \present_state.s2_0~q\ : std_logic;
SIGNAL \next_state.s1_3~0_combout\ : std_logic;
SIGNAL \next_state.s1_3_432~combout\ : std_logic;
SIGNAL \present_state.s1_3~q\ : std_logic;
SIGNAL \next_state.s1_0~0_combout\ : std_logic;
SIGNAL \next_state.s1_0_466~combout\ : std_logic;
SIGNAL \present_state.s1_0~q\ : std_logic;
SIGNAL \next_state.s3_1~0_combout\ : std_logic;
SIGNAL \next_state.s0~0_combout\ : std_logic;
SIGNAL \next_state.s0_480~combout\ : std_logic;
SIGNAL \present_state.s0~0_combout\ : std_logic;
SIGNAL \present_state.s0~q\ : std_logic;
SIGNAL \next_state.s1_1~0_combout\ : std_logic;
SIGNAL \next_state.s1_1_456~combout\ : std_logic;
SIGNAL \present_state.s1_1~q\ : std_logic;
SIGNAL \next_state.s1_2~0_combout\ : std_logic;
SIGNAL \next_state.s1_2_442~combout\ : std_logic;
SIGNAL \present_state.s1_2~q\ : std_logic;
SIGNAL \WideOr3~combout\ : std_logic;
SIGNAL \delay_done~clkctrl_outclk\ : std_logic;
SIGNAL \lLights[0]$latch~combout\ : std_logic;
SIGNAL \WideOr2~0_combout\ : std_logic;
SIGNAL \lLights[1]$latch~combout\ : std_logic;
SIGNAL \lLights~1_combout\ : std_logic;
SIGNAL \lLights[2]$latch~combout\ : std_logic;
SIGNAL \WideOr1~combout\ : std_logic;
SIGNAL \rLights[0]$latch~combout\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL \rLights[1]$latch~combout\ : std_logic;
SIGNAL \rLights~2_combout\ : std_logic;
SIGNAL \rLights[2]$latch~combout\ : std_logic;
SIGNAL counter : std_logic_vector(25 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_left <= left;
ww_right <= right;
ww_interm <= interm;
lLights <= ww_lLights;
rLights <= ww_rLights;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\delay_done~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \delay_done~q\);

\next_state.s3_0~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \next_state.s3_0~0_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\next_state.s3_1~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \next_state.s3_1~1_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y42_N12
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X20_Y39_N9
\lLights[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lLights[0]$latch~combout\,
	devoe => ww_devoe,
	o => \lLights[0]~output_o\);

-- Location: IOOBUF_X20_Y39_N2
\lLights[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lLights[1]$latch~combout\,
	devoe => ww_devoe,
	o => \lLights[1]~output_o\);

-- Location: IOOBUF_X20_Y39_N16
\lLights[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lLights[2]$latch~combout\,
	devoe => ww_devoe,
	o => \lLights[2]~output_o\);

-- Location: IOOBUF_X0_Y36_N2
\rLights[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rLights[0]$latch~combout\,
	devoe => ww_devoe,
	o => \rLights[0]~output_o\);

-- Location: IOOBUF_X0_Y37_N2
\rLights[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rLights[1]$latch~combout\,
	devoe => ww_devoe,
	o => \rLights[1]~output_o\);

-- Location: IOOBUF_X0_Y36_N9
\rLights[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rLights[2]$latch~combout\,
	devoe => ww_devoe,
	o => \rLights[2]~output_o\);

-- Location: IOIBUF_X0_Y18_N15
\clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G3
\clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y37_N15
\right~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_right,
	o => \right~input_o\);

-- Location: IOIBUF_X0_Y37_N8
\left~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_left,
	o => \left~input_o\);

-- Location: IOIBUF_X0_Y37_N22
\interm~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_interm,
	o => \interm~input_o\);

-- Location: LCCOMB_X8_Y38_N6
\counter[0]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[0]~26_combout\ = counter(0) $ (VCC)
-- \counter[0]~27\ = CARRY(counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datad => VCC,
	combout => \counter[0]~26_combout\,
	cout => \counter[0]~27\);

-- Location: FF_X8_Y38_N7
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[0]~26_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LCCOMB_X8_Y38_N8
\counter[1]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[1]~28_combout\ = (counter(1) & (!\counter[0]~27\)) # (!counter(1) & ((\counter[0]~27\) # (GND)))
-- \counter[1]~29\ = CARRY((!\counter[0]~27\) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datad => VCC,
	cin => \counter[0]~27\,
	combout => \counter[1]~28_combout\,
	cout => \counter[1]~29\);

-- Location: FF_X8_Y38_N9
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[1]~28_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X8_Y38_N10
\counter[2]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[2]~30_combout\ = (counter(2) & (\counter[1]~29\ $ (GND))) # (!counter(2) & (!\counter[1]~29\ & VCC))
-- \counter[2]~31\ = CARRY((counter(2) & !\counter[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	datad => VCC,
	cin => \counter[1]~29\,
	combout => \counter[2]~30_combout\,
	cout => \counter[2]~31\);

-- Location: FF_X8_Y38_N11
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[2]~30_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: LCCOMB_X8_Y38_N12
\counter[3]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[3]~32_combout\ = (counter(3) & (!\counter[2]~31\)) # (!counter(3) & ((\counter[2]~31\) # (GND)))
-- \counter[3]~33\ = CARRY((!\counter[2]~31\) # (!counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datad => VCC,
	cin => \counter[2]~31\,
	combout => \counter[3]~32_combout\,
	cout => \counter[3]~33\);

-- Location: FF_X8_Y38_N13
\counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[3]~32_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: LCCOMB_X8_Y38_N14
\counter[4]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[4]~34_combout\ = (counter(4) & (\counter[3]~33\ $ (GND))) # (!counter(4) & (!\counter[3]~33\ & VCC))
-- \counter[4]~35\ = CARRY((counter(4) & !\counter[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(4),
	datad => VCC,
	cin => \counter[3]~33\,
	combout => \counter[4]~34_combout\,
	cout => \counter[4]~35\);

-- Location: FF_X8_Y38_N15
\counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[4]~34_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(4));

-- Location: LCCOMB_X8_Y38_N16
\counter[5]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[5]~36_combout\ = (counter(5) & (!\counter[4]~35\)) # (!counter(5) & ((\counter[4]~35\) # (GND)))
-- \counter[5]~37\ = CARRY((!\counter[4]~35\) # (!counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(5),
	datad => VCC,
	cin => \counter[4]~35\,
	combout => \counter[5]~36_combout\,
	cout => \counter[5]~37\);

-- Location: FF_X8_Y38_N17
\counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[5]~36_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(5));

-- Location: LCCOMB_X8_Y38_N18
\counter[6]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[6]~38_combout\ = (counter(6) & (\counter[5]~37\ $ (GND))) # (!counter(6) & (!\counter[5]~37\ & VCC))
-- \counter[6]~39\ = CARRY((counter(6) & !\counter[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(6),
	datad => VCC,
	cin => \counter[5]~37\,
	combout => \counter[6]~38_combout\,
	cout => \counter[6]~39\);

-- Location: FF_X8_Y38_N19
\counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[6]~38_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(6));

-- Location: LCCOMB_X8_Y38_N20
\counter[7]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[7]~40_combout\ = (counter(7) & (!\counter[6]~39\)) # (!counter(7) & ((\counter[6]~39\) # (GND)))
-- \counter[7]~41\ = CARRY((!\counter[6]~39\) # (!counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(7),
	datad => VCC,
	cin => \counter[6]~39\,
	combout => \counter[7]~40_combout\,
	cout => \counter[7]~41\);

-- Location: FF_X8_Y38_N21
\counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[7]~40_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(7));

-- Location: LCCOMB_X8_Y38_N22
\counter[8]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[8]~42_combout\ = (counter(8) & (\counter[7]~41\ $ (GND))) # (!counter(8) & (!\counter[7]~41\ & VCC))
-- \counter[8]~43\ = CARRY((counter(8) & !\counter[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(8),
	datad => VCC,
	cin => \counter[7]~41\,
	combout => \counter[8]~42_combout\,
	cout => \counter[8]~43\);

-- Location: FF_X8_Y38_N23
\counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[8]~42_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(8));

-- Location: LCCOMB_X8_Y38_N24
\counter[9]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[9]~44_combout\ = (counter(9) & (!\counter[8]~43\)) # (!counter(9) & ((\counter[8]~43\) # (GND)))
-- \counter[9]~45\ = CARRY((!\counter[8]~43\) # (!counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(9),
	datad => VCC,
	cin => \counter[8]~43\,
	combout => \counter[9]~44_combout\,
	cout => \counter[9]~45\);

-- Location: FF_X8_Y38_N25
\counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[9]~44_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(9));

-- Location: LCCOMB_X8_Y38_N26
\counter[10]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[10]~46_combout\ = (counter(10) & (\counter[9]~45\ $ (GND))) # (!counter(10) & (!\counter[9]~45\ & VCC))
-- \counter[10]~47\ = CARRY((counter(10) & !\counter[9]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(10),
	datad => VCC,
	cin => \counter[9]~45\,
	combout => \counter[10]~46_combout\,
	cout => \counter[10]~47\);

-- Location: FF_X8_Y38_N27
\counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[10]~46_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(10));

-- Location: LCCOMB_X8_Y38_N28
\counter[11]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[11]~48_combout\ = (counter(11) & (!\counter[10]~47\)) # (!counter(11) & ((\counter[10]~47\) # (GND)))
-- \counter[11]~49\ = CARRY((!\counter[10]~47\) # (!counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(11),
	datad => VCC,
	cin => \counter[10]~47\,
	combout => \counter[11]~48_combout\,
	cout => \counter[11]~49\);

-- Location: FF_X8_Y38_N29
\counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[11]~48_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(11));

-- Location: LCCOMB_X8_Y38_N30
\counter[12]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[12]~50_combout\ = (counter(12) & (\counter[11]~49\ $ (GND))) # (!counter(12) & (!\counter[11]~49\ & VCC))
-- \counter[12]~51\ = CARRY((counter(12) & !\counter[11]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(12),
	datad => VCC,
	cin => \counter[11]~49\,
	combout => \counter[12]~50_combout\,
	cout => \counter[12]~51\);

-- Location: FF_X8_Y38_N31
\counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[12]~50_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(12));

-- Location: LCCOMB_X8_Y37_N0
\counter[13]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[13]~52_combout\ = (counter(13) & (!\counter[12]~51\)) # (!counter(13) & ((\counter[12]~51\) # (GND)))
-- \counter[13]~53\ = CARRY((!\counter[12]~51\) # (!counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(13),
	datad => VCC,
	cin => \counter[12]~51\,
	combout => \counter[13]~52_combout\,
	cout => \counter[13]~53\);

-- Location: FF_X8_Y37_N1
\counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[13]~52_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(13));

-- Location: LCCOMB_X8_Y37_N2
\counter[14]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[14]~54_combout\ = (counter(14) & (\counter[13]~53\ $ (GND))) # (!counter(14) & (!\counter[13]~53\ & VCC))
-- \counter[14]~55\ = CARRY((counter(14) & !\counter[13]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(14),
	datad => VCC,
	cin => \counter[13]~53\,
	combout => \counter[14]~54_combout\,
	cout => \counter[14]~55\);

-- Location: FF_X8_Y37_N3
\counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[14]~54_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(14));

-- Location: LCCOMB_X8_Y37_N4
\counter[15]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[15]~56_combout\ = (counter(15) & (!\counter[14]~55\)) # (!counter(15) & ((\counter[14]~55\) # (GND)))
-- \counter[15]~57\ = CARRY((!\counter[14]~55\) # (!counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(15),
	datad => VCC,
	cin => \counter[14]~55\,
	combout => \counter[15]~56_combout\,
	cout => \counter[15]~57\);

-- Location: FF_X8_Y37_N5
\counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[15]~56_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(15));

-- Location: LCCOMB_X8_Y37_N6
\counter[16]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[16]~58_combout\ = (counter(16) & (\counter[15]~57\ $ (GND))) # (!counter(16) & (!\counter[15]~57\ & VCC))
-- \counter[16]~59\ = CARRY((counter(16) & !\counter[15]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(16),
	datad => VCC,
	cin => \counter[15]~57\,
	combout => \counter[16]~58_combout\,
	cout => \counter[16]~59\);

-- Location: FF_X8_Y37_N7
\counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[16]~58_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(16));

-- Location: LCCOMB_X7_Y37_N8
\delay~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~4_combout\ = (counter(14)) # ((counter(13)) # ((counter(15)) # (counter(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(14),
	datab => counter(13),
	datac => counter(15),
	datad => counter(16),
	combout => \delay~4_combout\);

-- Location: LCCOMB_X8_Y37_N8
\counter[17]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[17]~60_combout\ = (counter(17) & (!\counter[16]~59\)) # (!counter(17) & ((\counter[16]~59\) # (GND)))
-- \counter[17]~61\ = CARRY((!\counter[16]~59\) # (!counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(17),
	datad => VCC,
	cin => \counter[16]~59\,
	combout => \counter[17]~60_combout\,
	cout => \counter[17]~61\);

-- Location: FF_X8_Y37_N9
\counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[17]~60_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(17));

-- Location: LCCOMB_X8_Y37_N10
\counter[18]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[18]~62_combout\ = (counter(18) & (\counter[17]~61\ $ (GND))) # (!counter(18) & (!\counter[17]~61\ & VCC))
-- \counter[18]~63\ = CARRY((counter(18) & !\counter[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(18),
	datad => VCC,
	cin => \counter[17]~61\,
	combout => \counter[18]~62_combout\,
	cout => \counter[18]~63\);

-- Location: FF_X8_Y37_N11
\counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[18]~62_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(18));

-- Location: LCCOMB_X8_Y37_N12
\counter[19]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[19]~64_combout\ = (counter(19) & (!\counter[18]~63\)) # (!counter(19) & ((\counter[18]~63\) # (GND)))
-- \counter[19]~65\ = CARRY((!\counter[18]~63\) # (!counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(19),
	datad => VCC,
	cin => \counter[18]~63\,
	combout => \counter[19]~64_combout\,
	cout => \counter[19]~65\);

-- Location: FF_X8_Y37_N13
\counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[19]~64_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(19));

-- Location: LCCOMB_X8_Y37_N14
\counter[20]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[20]~66_combout\ = (counter(20) & (\counter[19]~65\ $ (GND))) # (!counter(20) & (!\counter[19]~65\ & VCC))
-- \counter[20]~67\ = CARRY((counter(20) & !\counter[19]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(20),
	datad => VCC,
	cin => \counter[19]~65\,
	combout => \counter[20]~66_combout\,
	cout => \counter[20]~67\);

-- Location: FF_X8_Y37_N15
\counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[20]~66_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(20));

-- Location: LCCOMB_X8_Y37_N28
\delay~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~5_combout\ = (counter(19)) # ((counter(17)) # ((counter(20)) # (counter(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(19),
	datab => counter(17),
	datac => counter(20),
	datad => counter(18),
	combout => \delay~5_combout\);

-- Location: LCCOMB_X8_Y38_N0
\delay~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~0_combout\ = (\skip_delay~combout\) # ((counter(6)) # ((counter(8)) # (counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \skip_delay~combout\,
	datab => counter(6),
	datac => counter(8),
	datad => counter(7),
	combout => \delay~0_combout\);

-- Location: LCCOMB_X8_Y38_N2
\delay~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~1_combout\ = (counter(10)) # ((counter(11)) # ((counter(12)) # (counter(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(10),
	datab => counter(11),
	datac => counter(12),
	datad => counter(9),
	combout => \delay~1_combout\);

-- Location: LCCOMB_X8_Y38_N4
\delay~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~2_combout\ = (counter(4) & ((counter(2)) # ((counter(1)) # (counter(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datab => counter(1),
	datac => counter(4),
	datad => counter(3),
	combout => \delay~2_combout\);

-- Location: LCCOMB_X8_Y37_N30
\delay~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~3_combout\ = (\delay~0_combout\) # ((\delay~1_combout\) # ((counter(5) & \delay~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \delay~0_combout\,
	datab => counter(5),
	datac => \delay~1_combout\,
	datad => \delay~2_combout\,
	combout => \delay~3_combout\);

-- Location: LCCOMB_X8_Y37_N16
\counter[21]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[21]~68_combout\ = (counter(21) & (!\counter[20]~67\)) # (!counter(21) & ((\counter[20]~67\) # (GND)))
-- \counter[21]~69\ = CARRY((!\counter[20]~67\) # (!counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(21),
	datad => VCC,
	cin => \counter[20]~67\,
	combout => \counter[21]~68_combout\,
	cout => \counter[21]~69\);

-- Location: FF_X8_Y37_N17
\counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[21]~68_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(21));

-- Location: LCCOMB_X8_Y37_N18
\counter[22]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[22]~70_combout\ = (counter(22) & (\counter[21]~69\ $ (GND))) # (!counter(22) & (!\counter[21]~69\ & VCC))
-- \counter[22]~71\ = CARRY((counter(22) & !\counter[21]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(22),
	datad => VCC,
	cin => \counter[21]~69\,
	combout => \counter[22]~70_combout\,
	cout => \counter[22]~71\);

-- Location: FF_X8_Y37_N19
\counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[22]~70_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(22));

-- Location: LCCOMB_X8_Y37_N20
\counter[23]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[23]~72_combout\ = (counter(23) & (!\counter[22]~71\)) # (!counter(23) & ((\counter[22]~71\) # (GND)))
-- \counter[23]~73\ = CARRY((!\counter[22]~71\) # (!counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(23),
	datad => VCC,
	cin => \counter[22]~71\,
	combout => \counter[23]~72_combout\,
	cout => \counter[23]~73\);

-- Location: FF_X8_Y37_N21
\counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[23]~72_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(23));

-- Location: LCCOMB_X8_Y37_N22
\counter[24]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[24]~74_combout\ = (counter(24) & (\counter[23]~73\ $ (GND))) # (!counter(24) & (!\counter[23]~73\ & VCC))
-- \counter[24]~75\ = CARRY((counter(24) & !\counter[23]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(24),
	datad => VCC,
	cin => \counter[23]~73\,
	combout => \counter[24]~74_combout\,
	cout => \counter[24]~75\);

-- Location: FF_X8_Y37_N23
\counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[24]~74_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(24));

-- Location: LCCOMB_X8_Y37_N24
\counter[25]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \counter[25]~76_combout\ = \counter[24]~75\ $ (counter(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => counter(25),
	cin => \counter[24]~75\,
	combout => \counter[25]~76_combout\);

-- Location: FF_X8_Y37_N25
\counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter[25]~76_combout\,
	sclr => \delay~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(25));

-- Location: LCCOMB_X7_Y37_N18
\delay~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~6_combout\ = (counter(23)) # (counter(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => counter(23),
	datad => counter(24),
	combout => \delay~6_combout\);

-- Location: LCCOMB_X7_Y37_N12
\delay~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~7_combout\ = (counter(21)) # ((counter(25)) # ((counter(22)) # (\delay~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(21),
	datab => counter(25),
	datac => counter(22),
	datad => \delay~6_combout\,
	combout => \delay~7_combout\);

-- Location: LCCOMB_X8_Y37_N26
\delay~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay~8_combout\ = (\delay~4_combout\) # ((\delay~5_combout\) # ((\delay~3_combout\) # (\delay~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \delay~4_combout\,
	datab => \delay~5_combout\,
	datac => \delay~3_combout\,
	datad => \delay~7_combout\,
	combout => \delay~8_combout\);

-- Location: LCCOMB_X9_Y38_N6
\delay_done~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \delay_done~0_combout\ = !\delay~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \delay~8_combout\,
	combout => \delay_done~0_combout\);

-- Location: FF_X9_Y38_N7
delay_done : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \delay_done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \delay_done~q\);

-- Location: LCCOMB_X9_Y38_N0
\next_state.s3_1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s3_1~1_combout\ = ((!\skip_delay~combout\ & !\delay_done~q\)) # (!\present_state.s0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \skip_delay~combout\,
	datac => \present_state.s0~q\,
	datad => \delay_done~q\,
	combout => \next_state.s3_1~1_combout\);

-- Location: CLKCTRL_G4
\next_state.s3_1~1clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \next_state.s3_1~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \next_state.s3_1~1clkctrl_outclk\);

-- Location: LCCOMB_X11_Y37_N8
\next_state.s3_1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s3_1~2_combout\ = (\interm~input_o\ & \next_state.s3_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \interm~input_o\,
	datad => \next_state.s3_1~0_combout\,
	combout => \next_state.s3_1~2_combout\);

-- Location: LCCOMB_X11_Y37_N16
\next_state.s3_1_368\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s3_1_368~combout\ = (GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & ((\next_state.s3_1~2_combout\))) # (!GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & (\next_state.s3_1_368~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s3_1~1clkctrl_outclk\,
	datab => \next_state.s3_1_368~combout\,
	datad => \next_state.s3_1~2_combout\,
	combout => \next_state.s3_1_368~combout\);

-- Location: FF_X11_Y37_N25
\present_state.s3_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s3_1_368~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s3_1~q\);

-- Location: LCCOMB_X12_Y37_N8
\next_state.s3_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s3_0~1_combout\ = (\present_state.s3_1~q\ & (!\present_state.s1_0~q\ & (!\present_state.s2_0~q\ & !\present_state.s3_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s3_1~q\,
	datab => \present_state.s1_0~q\,
	datac => \present_state.s2_0~q\,
	datad => \present_state.s3_0~q\,
	combout => \next_state.s3_0~1_combout\);

-- Location: LCCOMB_X12_Y37_N22
\next_state.s3_0_378\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s3_0_378~combout\ = (\present_state.s0~q\ & ((GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & ((\next_state.s3_0~1_combout\))) # (!GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & (\next_state.s3_0_378~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s3_0_378~combout\,
	datab => \present_state.s0~q\,
	datac => \next_state.s3_0~1_combout\,
	datad => \next_state.s3_0~0clkctrl_outclk\,
	combout => \next_state.s3_0_378~combout\);

-- Location: FF_X12_Y37_N19
\present_state.s3_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s3_0_378~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s3_0~q\);

-- Location: LCCOMB_X9_Y37_N28
\comb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = (\present_state.s1_0~q\) # ((\present_state.s2_0~q\) # ((\present_state.s3_0~q\) # (!\delay_done~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s1_0~q\,
	datab => \present_state.s2_0~q\,
	datac => \present_state.s3_0~q\,
	datad => \delay_done~q\,
	combout => \comb~0_combout\);

-- Location: LCCOMB_X9_Y37_N14
\comb~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \comb~1_combout\ = (\present_state.s0~q\ & ((\skip_delay~combout\) # (\comb~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \skip_delay~combout\,
	datac => \present_state.s0~q\,
	datad => \comb~0_combout\,
	combout => \comb~1_combout\);

-- Location: LCCOMB_X10_Y37_N16
skip_delay : fiftyfivenm_lcell_comb
-- Equation(s):
-- \skip_delay~combout\ = (!\comb~1_combout\ & ((\skip_delay~combout\) # (!\present_state.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comb~1_combout\,
	datac => \present_state.s0~q\,
	datad => \skip_delay~combout\,
	combout => \skip_delay~combout\);

-- Location: LCCOMB_X9_Y38_N4
\next_state.s3_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s3_0~0_combout\ = (!\skip_delay~combout\ & !\delay_done~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \skip_delay~combout\,
	datad => \delay_done~q\,
	combout => \next_state.s3_0~0_combout\);

-- Location: CLKCTRL_G0
\next_state.s3_0~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \next_state.s3_0~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \next_state.s3_0~0clkctrl_outclk\);

-- Location: LCCOMB_X11_Y37_N10
\next_state.s2_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_1~0_combout\ = (\right~input_o\ & (!\left~input_o\ & (!\interm~input_o\ & \next_state.s3_1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \right~input_o\,
	datab => \left~input_o\,
	datac => \interm~input_o\,
	datad => \next_state.s3_1~0_combout\,
	combout => \next_state.s2_1~0_combout\);

-- Location: LCCOMB_X11_Y37_N24
\next_state.s2_1_412\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_1_412~combout\ = (GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & ((\next_state.s2_1~0_combout\))) # (!GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & (\next_state.s2_1_412~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s3_1~1clkctrl_outclk\,
	datab => \next_state.s2_1_412~combout\,
	datad => \next_state.s2_1~0_combout\,
	combout => \next_state.s2_1_412~combout\);

-- Location: FF_X11_Y37_N17
\present_state.s2_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s2_1_412~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s2_1~q\);

-- Location: LCCOMB_X11_Y37_N22
\next_state.s2_2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_2~0_combout\ = (!\present_state.s1_0~q\ & (\present_state.s2_1~q\ & (!\present_state.s2_0~q\ & !\present_state.s3_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s1_0~q\,
	datab => \present_state.s2_1~q\,
	datac => \present_state.s2_0~q\,
	datad => \present_state.s3_0~q\,
	combout => \next_state.s2_2~0_combout\);

-- Location: LCCOMB_X11_Y37_N28
\next_state.s2_2_398\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_2_398~combout\ = (\present_state.s0~q\ & ((GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & ((\next_state.s2_2~0_combout\))) # (!GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & (\next_state.s2_2_398~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s0~q\,
	datab => \next_state.s2_2_398~combout\,
	datac => \next_state.s3_0~0clkctrl_outclk\,
	datad => \next_state.s2_2~0_combout\,
	combout => \next_state.s2_2_398~combout\);

-- Location: FF_X11_Y37_N9
\present_state.s2_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s2_2_398~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s2_2~q\);

-- Location: LCCOMB_X11_Y37_N4
\next_state.s2_3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_3~0_combout\ = (\present_state.s2_2~q\ & (!\present_state.s2_0~q\ & (!\present_state.s1_0~q\ & !\present_state.s3_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s2_2~q\,
	datab => \present_state.s2_0~q\,
	datac => \present_state.s1_0~q\,
	datad => \present_state.s3_0~q\,
	combout => \next_state.s2_3~0_combout\);

-- Location: LCCOMB_X11_Y37_N12
\next_state.s2_3_388\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_3_388~combout\ = (\present_state.s0~q\ & ((GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & (\next_state.s2_3~0_combout\)) # (!GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & ((\next_state.s2_3_388~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s0~q\,
	datab => \next_state.s3_0~0clkctrl_outclk\,
	datac => \next_state.s2_3~0_combout\,
	datad => \next_state.s2_3_388~combout\,
	combout => \next_state.s2_3_388~combout\);

-- Location: FF_X11_Y37_N27
\present_state.s2_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s2_3_388~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s2_3~q\);

-- Location: LCCOMB_X12_Y37_N30
\next_state.s2_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_0~0_combout\ = (\present_state.s2_3~q\ & (!\present_state.s1_0~q\ & (!\present_state.s2_0~q\ & !\present_state.s3_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s2_3~q\,
	datab => \present_state.s1_0~q\,
	datac => \present_state.s2_0~q\,
	datad => \present_state.s3_0~q\,
	combout => \next_state.s2_0~0_combout\);

-- Location: LCCOMB_X11_Y37_N6
\next_state.s2_0_422\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s2_0_422~combout\ = (\present_state.s0~q\ & ((GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & ((\next_state.s2_0~0_combout\))) # (!GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & (\next_state.s2_0_422~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s0~q\,
	datab => \next_state.s2_0_422~combout\,
	datac => \next_state.s3_0~0clkctrl_outclk\,
	datad => \next_state.s2_0~0_combout\,
	combout => \next_state.s2_0_422~combout\);

-- Location: FF_X12_Y37_N5
\present_state.s2_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s2_0_422~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s2_0~q\);

-- Location: LCCOMB_X12_Y37_N18
\next_state.s1_3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_3~0_combout\ = (\present_state.s1_2~q\ & (!\present_state.s2_0~q\ & (!\present_state.s3_0~q\ & !\present_state.s1_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s1_2~q\,
	datab => \present_state.s2_0~q\,
	datac => \present_state.s3_0~q\,
	datad => \present_state.s1_0~q\,
	combout => \next_state.s1_3~0_combout\);

-- Location: LCCOMB_X12_Y37_N10
\next_state.s1_3_432\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_3_432~combout\ = (\present_state.s0~q\ & ((GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & ((\next_state.s1_3~0_combout\))) # (!GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & (\next_state.s1_3_432~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s1_3_432~combout\,
	datab => \present_state.s0~q\,
	datac => \next_state.s1_3~0_combout\,
	datad => \next_state.s3_0~0clkctrl_outclk\,
	combout => \next_state.s1_3_432~combout\);

-- Location: FF_X12_Y37_N1
\present_state.s1_3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s1_3_432~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s1_3~q\);

-- Location: LCCOMB_X12_Y37_N2
\next_state.s1_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_0~0_combout\ = (!\present_state.s2_0~q\ & (!\present_state.s3_0~q\ & (!\present_state.s1_0~q\ & \present_state.s1_3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s2_0~q\,
	datab => \present_state.s3_0~q\,
	datac => \present_state.s1_0~q\,
	datad => \present_state.s1_3~q\,
	combout => \next_state.s1_0~0_combout\);

-- Location: LCCOMB_X12_Y37_N20
\next_state.s1_0_466\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_0_466~combout\ = (\present_state.s0~q\ & ((GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & ((\next_state.s1_0~0_combout\))) # (!GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & (\next_state.s1_0_466~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s1_0_466~combout\,
	datab => \present_state.s0~q\,
	datac => \next_state.s1_0~0_combout\,
	datad => \next_state.s3_0~0clkctrl_outclk\,
	combout => \next_state.s1_0_466~combout\);

-- Location: FF_X12_Y37_N3
\present_state.s1_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s1_0_466~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s1_0~q\);

-- Location: LCCOMB_X12_Y37_N16
\next_state.s3_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s3_1~0_combout\ = ((\present_state.s1_0~q\) # ((\present_state.s2_0~q\) # (\present_state.s3_0~q\))) # (!\present_state.s0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s0~q\,
	datab => \present_state.s1_0~q\,
	datac => \present_state.s2_0~q\,
	datad => \present_state.s3_0~q\,
	combout => \next_state.s3_1~0_combout\);

-- Location: LCCOMB_X11_Y37_N30
\next_state.s0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s0~0_combout\ = (\right~input_o\) # ((\left~input_o\) # ((\interm~input_o\) # (!\next_state.s3_1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \right~input_o\,
	datab => \left~input_o\,
	datac => \interm~input_o\,
	datad => \next_state.s3_1~0_combout\,
	combout => \next_state.s0~0_combout\);

-- Location: LCCOMB_X11_Y37_N18
\next_state.s0_480\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s0_480~combout\ = (GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & ((!\next_state.s0~0_combout\))) # (!GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & (\next_state.s0_480~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \next_state.s0_480~combout\,
	datac => \next_state.s0~0_combout\,
	datad => \next_state.s3_1~1clkctrl_outclk\,
	combout => \next_state.s0_480~combout\);

-- Location: LCCOMB_X11_Y37_N0
\present_state.s0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \present_state.s0~0_combout\ = !\next_state.s0_480~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.s0_480~combout\,
	combout => \present_state.s0~0_combout\);

-- Location: FF_X11_Y37_N1
\present_state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \present_state.s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s0~q\);

-- Location: LCCOMB_X13_Y37_N4
\next_state.s1_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_1~0_combout\ = (\left~input_o\ & (!\interm~input_o\ & \next_state.s3_1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \left~input_o\,
	datab => \interm~input_o\,
	datac => \next_state.s3_1~0_combout\,
	combout => \next_state.s1_1~0_combout\);

-- Location: LCCOMB_X13_Y37_N30
\next_state.s1_1_456\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_1_456~combout\ = (GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & ((\next_state.s1_1~0_combout\))) # (!GLOBAL(\next_state.s3_1~1clkctrl_outclk\) & (\next_state.s1_1_456~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s1_1_456~combout\,
	datac => \next_state.s1_1~0_combout\,
	datad => \next_state.s3_1~1clkctrl_outclk\,
	combout => \next_state.s1_1_456~combout\);

-- Location: FF_X12_Y37_N13
\present_state.s1_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s1_1_456~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s1_1~q\);

-- Location: LCCOMB_X12_Y37_N4
\next_state.s1_2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_2~0_combout\ = (\present_state.s1_1~q\ & (!\present_state.s1_0~q\ & (!\present_state.s2_0~q\ & !\present_state.s3_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s1_1~q\,
	datab => \present_state.s1_0~q\,
	datac => \present_state.s2_0~q\,
	datad => \present_state.s3_0~q\,
	combout => \next_state.s1_2~0_combout\);

-- Location: LCCOMB_X12_Y37_N24
\next_state.s1_2_442\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s1_2_442~combout\ = (\present_state.s0~q\ & ((GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & ((\next_state.s1_2~0_combout\))) # (!GLOBAL(\next_state.s3_0~0clkctrl_outclk\) & (\next_state.s1_2_442~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s1_2_442~combout\,
	datab => \present_state.s0~q\,
	datac => \next_state.s1_2~0_combout\,
	datad => \next_state.s3_0~0clkctrl_outclk\,
	combout => \next_state.s1_2_442~combout\);

-- Location: FF_X12_Y37_N7
\present_state.s1_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s1_2_442~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s1_2~q\);

-- Location: LCCOMB_X12_Y37_N12
WideOr3 : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideOr3~combout\ = (\present_state.s1_2~q\) # ((\present_state.s1_3~q\) # ((\present_state.s1_1~q\) # (\present_state.s3_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s1_2~q\,
	datab => \present_state.s1_3~q\,
	datac => \present_state.s1_1~q\,
	datad => \present_state.s3_1~q\,
	combout => \WideOr3~combout\);

-- Location: CLKCTRL_G1
\delay_done~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \delay_done~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \delay_done~clkctrl_outclk\);

-- Location: LCCOMB_X12_Y37_N14
\lLights[0]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lLights[0]$latch~combout\ = (GLOBAL(\delay_done~clkctrl_outclk\) & ((\lLights[0]$latch~combout\))) # (!GLOBAL(\delay_done~clkctrl_outclk\) & (\WideOr3~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr3~combout\,
	datac => \lLights[0]$latch~combout\,
	datad => \delay_done~clkctrl_outclk\,
	combout => \lLights[0]$latch~combout\);

-- Location: LCCOMB_X12_Y37_N26
\WideOr2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideOr2~0_combout\ = (!\present_state.s1_2~q\ & (!\present_state.s1_3~q\ & !\present_state.s3_1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s1_2~q\,
	datab => \present_state.s1_3~q\,
	datad => \present_state.s3_1~q\,
	combout => \WideOr2~0_combout\);

-- Location: LCCOMB_X12_Y37_N0
\lLights[1]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lLights[1]$latch~combout\ = (GLOBAL(\delay_done~clkctrl_outclk\) & ((\lLights[1]$latch~combout\))) # (!GLOBAL(\delay_done~clkctrl_outclk\) & (!\WideOr2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr2~0_combout\,
	datab => \lLights[1]$latch~combout\,
	datad => \delay_done~clkctrl_outclk\,
	combout => \lLights[1]$latch~combout\);

-- Location: LCCOMB_X12_Y37_N28
\lLights~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lLights~1_combout\ = (!\present_state.s1_3~q\ & !\present_state.s3_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \present_state.s1_3~q\,
	datad => \present_state.s3_1~q\,
	combout => \lLights~1_combout\);

-- Location: LCCOMB_X12_Y37_N6
\lLights[2]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lLights[2]$latch~combout\ = (GLOBAL(\delay_done~clkctrl_outclk\) & (\lLights[2]$latch~combout\)) # (!GLOBAL(\delay_done~clkctrl_outclk\) & ((!\lLights~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lLights[2]$latch~combout\,
	datab => \lLights~1_combout\,
	datad => \delay_done~clkctrl_outclk\,
	combout => \lLights[2]$latch~combout\);

-- Location: LCCOMB_X11_Y37_N14
WideOr1 : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideOr1~combout\ = (\present_state.s2_2~q\) # ((\present_state.s2_1~q\) # ((\present_state.s2_3~q\) # (\present_state.s3_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s2_2~q\,
	datab => \present_state.s2_1~q\,
	datac => \present_state.s2_3~q\,
	datad => \present_state.s3_1~q\,
	combout => \WideOr1~combout\);

-- Location: LCCOMB_X10_Y37_N4
\rLights[0]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rLights[0]$latch~combout\ = (GLOBAL(\delay_done~clkctrl_outclk\) & (\rLights[0]$latch~combout\)) # (!GLOBAL(\delay_done~clkctrl_outclk\) & ((\WideOr1~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rLights[0]$latch~combout\,
	datac => \WideOr1~combout\,
	datad => \delay_done~clkctrl_outclk\,
	combout => \rLights[0]$latch~combout\);

-- Location: LCCOMB_X11_Y37_N2
\WideOr0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = (!\present_state.s3_1~q\ & (!\present_state.s2_3~q\ & !\present_state.s2_2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \present_state.s3_1~q\,
	datac => \present_state.s2_3~q\,
	datad => \present_state.s2_2~q\,
	combout => \WideOr0~0_combout\);

-- Location: LCCOMB_X11_Y37_N26
\rLights[1]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rLights[1]$latch~combout\ = (GLOBAL(\delay_done~clkctrl_outclk\) & (\rLights[1]$latch~combout\)) # (!GLOBAL(\delay_done~clkctrl_outclk\) & ((!\WideOr0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rLights[1]$latch~combout\,
	datab => \WideOr0~0_combout\,
	datad => \delay_done~clkctrl_outclk\,
	combout => \rLights[1]$latch~combout\);

-- Location: LCCOMB_X11_Y37_N20
\rLights~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rLights~2_combout\ = (!\present_state.s3_1~q\ & !\present_state.s2_3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \present_state.s3_1~q\,
	datac => \present_state.s2_3~q\,
	combout => \rLights~2_combout\);

-- Location: LCCOMB_X10_Y37_N14
\rLights[2]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rLights[2]$latch~combout\ = (GLOBAL(\delay_done~clkctrl_outclk\) & ((\rLights[2]$latch~combout\))) # (!GLOBAL(\delay_done~clkctrl_outclk\) & (!\rLights~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rLights~2_combout\,
	datac => \rLights[2]$latch~combout\,
	datad => \delay_done~clkctrl_outclk\,
	combout => \rLights[2]$latch~combout\);

-- Location: IOIBUF_X31_Y39_N22
\rst~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_lLights(0) <= \lLights[0]~output_o\;

ww_lLights(1) <= \lLights[1]~output_o\;

ww_lLights(2) <= \lLights[2]~output_o\;

ww_rLights(0) <= \rLights[0]~output_o\;

ww_rLights(1) <= \rLights[1]~output_o\;

ww_rLights(2) <= \rLights[2]~output_o\;
END structure;


