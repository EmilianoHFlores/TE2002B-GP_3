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

-- DATE "03/03/2023 18:23:31"

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

ENTITY 	UART_TX_3 IS
    PORT (
	in_sw : IN std_logic_vector(7 DOWNTO 0);
	tx_start : IN std_logic;
	clk : IN std_logic;
	rst : IN std_logic;
	s_tx : BUFFER std_logic;
	tx_done_tick : BUFFER std_logic;
	state_out : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END UART_TX_3;

-- Design Ports Information
-- s_tx	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_done_tick	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_out[0]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_out[1]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[5]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[6]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[4]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[7]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[2]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[1]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[0]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_sw[3]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_start	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UART_TX_3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_in_sw : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_tx_start : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_s_tx : std_logic;
SIGNAL ww_tx_done_tick : std_logic;
SIGNAL ww_state_out : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Selector41~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data[0]~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \s_tx~output_o\ : std_logic;
SIGNAL \tx_done_tick~output_o\ : std_logic;
SIGNAL \state_out[0]~output_o\ : std_logic;
SIGNAL \state_out[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \UART_BAUD|Add0~0_combout\ : std_logic;
SIGNAL \UART_BAUD|clk16_reg[0]~feeder_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \UART_BAUD|Add0~1\ : std_logic;
SIGNAL \UART_BAUD|Add0~2_combout\ : std_logic;
SIGNAL \UART_BAUD|Add0~3\ : std_logic;
SIGNAL \UART_BAUD|Add0~4_combout\ : std_logic;
SIGNAL \UART_BAUD|Add0~5\ : std_logic;
SIGNAL \UART_BAUD|Add0~6_combout\ : std_logic;
SIGNAL \UART_BAUD|Add0~7\ : std_logic;
SIGNAL \UART_BAUD|Add0~8_combout\ : std_logic;
SIGNAL \UART_BAUD|clk16_next[4]~4_combout\ : std_logic;
SIGNAL \UART_BAUD|Add0~9\ : std_logic;
SIGNAL \UART_BAUD|Add0~10_combout\ : std_logic;
SIGNAL \UART_BAUD|clk16_next[5]~3_combout\ : std_logic;
SIGNAL \UART_BAUD|Add0~11\ : std_logic;
SIGNAL \UART_BAUD|Add0~12_combout\ : std_logic;
SIGNAL \UART_BAUD|Add0~13\ : std_logic;
SIGNAL \UART_BAUD|Add0~14_combout\ : std_logic;
SIGNAL \UART_BAUD|clk16_next[7]~2_combout\ : std_logic;
SIGNAL \UART_BAUD|Add0~15\ : std_logic;
SIGNAL \UART_BAUD|Add0~16_combout\ : std_logic;
SIGNAL \UART_BAUD|clk16_next[8]~1_combout\ : std_logic;
SIGNAL \UART_BAUD|Equal0~1_combout\ : std_logic;
SIGNAL \UART_BAUD|clk16_next[1]~0_combout\ : std_logic;
SIGNAL \UART_BAUD|Equal0~0_combout\ : std_logic;
SIGNAL \UART_BAUD|Equal1~0_combout\ : std_logic;
SIGNAL \UART_BAUD|Equal1~1_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~9_combout\ : std_logic;
SIGNAL \Add0~68_combout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~11_combout\ : std_logic;
SIGNAL \Add0~69_combout\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \Add0~70_combout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \Add0~71_combout\ : std_logic;
SIGNAL \Add0~16\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \Add0~72_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \Add0~73_combout\ : std_logic;
SIGNAL \Add0~20\ : std_logic;
SIGNAL \Add0~21_combout\ : std_logic;
SIGNAL \Add0~74_combout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~23_combout\ : std_logic;
SIGNAL \Add0~75_combout\ : std_logic;
SIGNAL \Add0~24\ : std_logic;
SIGNAL \Add0~25_combout\ : std_logic;
SIGNAL \Add0~76_combout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~27_combout\ : std_logic;
SIGNAL \Add0~77_combout\ : std_logic;
SIGNAL \Add0~28\ : std_logic;
SIGNAL \Add0~29_combout\ : std_logic;
SIGNAL \Add0~78_combout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~31_combout\ : std_logic;
SIGNAL \Add0~79_combout\ : std_logic;
SIGNAL \Add0~32\ : std_logic;
SIGNAL \Add0~33_combout\ : std_logic;
SIGNAL \Add0~80_combout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~35_combout\ : std_logic;
SIGNAL \Add0~81_combout\ : std_logic;
SIGNAL \Add0~36\ : std_logic;
SIGNAL \Add0~37_combout\ : std_logic;
SIGNAL \Add0~82_combout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~39_combout\ : std_logic;
SIGNAL \Add0~83_combout\ : std_logic;
SIGNAL \Add0~40\ : std_logic;
SIGNAL \Add0~41_combout\ : std_logic;
SIGNAL \Add0~84_combout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~43_combout\ : std_logic;
SIGNAL \Add0~85_combout\ : std_logic;
SIGNAL \Add0~44\ : std_logic;
SIGNAL \Add0~45_combout\ : std_logic;
SIGNAL \Add0~86_combout\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~47_combout\ : std_logic;
SIGNAL \Add0~87_combout\ : std_logic;
SIGNAL \Add0~48\ : std_logic;
SIGNAL \Add0~49_combout\ : std_logic;
SIGNAL \Add0~88_combout\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~51_combout\ : std_logic;
SIGNAL \Add0~89_combout\ : std_logic;
SIGNAL \Add0~52\ : std_logic;
SIGNAL \Add0~53_combout\ : std_logic;
SIGNAL \Add0~90_combout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~55_combout\ : std_logic;
SIGNAL \Add0~91_combout\ : std_logic;
SIGNAL \Add0~56\ : std_logic;
SIGNAL \Add0~57_combout\ : std_logic;
SIGNAL \Add0~92_combout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~59_combout\ : std_logic;
SIGNAL \Add0~93_combout\ : std_logic;
SIGNAL \Add0~60\ : std_logic;
SIGNAL \Add0~61_combout\ : std_logic;
SIGNAL \Add0~94_combout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~63_combout\ : std_logic;
SIGNAL \Add0~95_combout\ : std_logic;
SIGNAL \Add0~64\ : std_logic;
SIGNAL \Add0~65_combout\ : std_logic;
SIGNAL \Add0~67_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \next_state.s_stop~0_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \LessThan0~9_combout\ : std_logic;
SIGNAL \next_state.s_stop~1_combout\ : std_logic;
SIGNAL \Selector41~0_combout\ : std_logic;
SIGNAL \Selector41~0clkctrl_outclk\ : std_logic;
SIGNAL \tx_start~input_o\ : std_logic;
SIGNAL \Selector42~0_combout\ : std_logic;
SIGNAL \next_state.s_idle_616~combout\ : std_logic;
SIGNAL \present_state.s_idle~0_combout\ : std_logic;
SIGNAL \present_state.s_idle~q\ : std_logic;
SIGNAL \Selector40~0_combout\ : std_logic;
SIGNAL \next_state.s_start_605~combout\ : std_logic;
SIGNAL \present_state.s_start~q\ : std_logic;
SIGNAL \Selector38~0_combout\ : std_logic;
SIGNAL \next_state.s_data_594~combout\ : std_logic;
SIGNAL \present_state.s_data~q\ : std_logic;
SIGNAL \Selector36~0_combout\ : std_logic;
SIGNAL \next_state.s_stop_583~combout\ : std_logic;
SIGNAL \present_state.s_stop~q\ : std_logic;
SIGNAL \in_sw[7]~input_o\ : std_logic;
SIGNAL \data[0]~0_combout\ : std_logic;
SIGNAL \data[0]~0clkctrl_outclk\ : std_logic;
SIGNAL \in_sw[4]~input_o\ : std_logic;
SIGNAL \in_sw[6]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \in_sw[5]~input_o\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \in_sw[2]~input_o\ : std_logic;
SIGNAL \in_sw[3]~input_o\ : std_logic;
SIGNAL \in_sw[0]~input_o\ : std_logic;
SIGNAL \in_sw[1]~input_o\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \tx_done_tick~2_combout\ : std_logic;
SIGNAL \tx_done_tick$latch~combout\ : std_logic;
SIGNAL \state_out~0_combout\ : std_logic;
SIGNAL \state_out~1_combout\ : std_logic;
SIGNAL \UART_BAUD|clk16_reg\ : std_logic_vector(8 DOWNTO 0);
SIGNAL count : std_logic_vector(31 DOWNTO 0);
SIGNAL data : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_state_out~1_combout\ : std_logic;
SIGNAL \ALT_INV_state_out~0_combout\ : std_logic;
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_in_sw <= in_sw;
ww_tx_start <= tx_start;
ww_clk <= clk;
ww_rst <= rst;
s_tx <= ww_s_tx;
tx_done_tick <= ww_tx_done_tick;
state_out <= ww_state_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\Selector41~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Selector41~0_combout\);

\data[0]~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \data[0]~0_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);
\ALT_INV_state_out~1_combout\ <= NOT \state_out~1_combout\;
\ALT_INV_state_out~0_combout\ <= NOT \state_out~0_combout\;
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y51_N24
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

-- Location: IOOBUF_X24_Y39_N2
\s_tx~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector6~1_combout\,
	devoe => ww_devoe,
	o => \s_tx~output_o\);

-- Location: IOOBUF_X22_Y39_N30
\tx_done_tick~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \tx_done_tick$latch~combout\,
	devoe => ww_devoe,
	o => \tx_done_tick~output_o\);

-- Location: IOOBUF_X20_Y39_N9
\state_out[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state_out~0_combout\,
	devoe => ww_devoe,
	o => \state_out[0]~output_o\);

-- Location: IOOBUF_X20_Y39_N16
\state_out[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state_out~1_combout\,
	devoe => ww_devoe,
	o => \state_out[1]~output_o\);

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

-- Location: LCCOMB_X22_Y34_N12
\UART_BAUD|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~0_combout\ = \UART_BAUD|clk16_reg\(0) $ (VCC)
-- \UART_BAUD|Add0~1\ = CARRY(\UART_BAUD|clk16_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART_BAUD|clk16_reg\(0),
	datad => VCC,
	combout => \UART_BAUD|Add0~0_combout\,
	cout => \UART_BAUD|Add0~1\);

-- Location: LCCOMB_X21_Y36_N16
\UART_BAUD|clk16_reg[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|clk16_reg[0]~feeder_combout\ = \UART_BAUD|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|Add0~0_combout\,
	combout => \UART_BAUD|clk16_reg[0]~feeder_combout\);

-- Location: IOIBUF_X0_Y18_N22
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

-- Location: CLKCTRL_G1
\rst~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: FF_X21_Y36_N17
\UART_BAUD|clk16_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \UART_BAUD|clk16_reg[0]~feeder_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(0));

-- Location: LCCOMB_X22_Y34_N14
\UART_BAUD|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~2_combout\ = (\UART_BAUD|clk16_reg\(1) & (!\UART_BAUD|Add0~1\)) # (!\UART_BAUD|clk16_reg\(1) & ((\UART_BAUD|Add0~1\) # (GND)))
-- \UART_BAUD|Add0~3\ = CARRY((!\UART_BAUD|Add0~1\) # (!\UART_BAUD|clk16_reg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|clk16_reg\(1),
	datad => VCC,
	cin => \UART_BAUD|Add0~1\,
	combout => \UART_BAUD|Add0~2_combout\,
	cout => \UART_BAUD|Add0~3\);

-- Location: LCCOMB_X22_Y34_N16
\UART_BAUD|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~4_combout\ = (\UART_BAUD|clk16_reg\(2) & (\UART_BAUD|Add0~3\ $ (GND))) # (!\UART_BAUD|clk16_reg\(2) & (!\UART_BAUD|Add0~3\ & VCC))
-- \UART_BAUD|Add0~5\ = CARRY((\UART_BAUD|clk16_reg\(2) & !\UART_BAUD|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART_BAUD|clk16_reg\(2),
	datad => VCC,
	cin => \UART_BAUD|Add0~3\,
	combout => \UART_BAUD|Add0~4_combout\,
	cout => \UART_BAUD|Add0~5\);

-- Location: FF_X22_Y34_N17
\UART_BAUD|clk16_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|Add0~4_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(2));

-- Location: LCCOMB_X22_Y34_N18
\UART_BAUD|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~6_combout\ = (\UART_BAUD|clk16_reg\(3) & (!\UART_BAUD|Add0~5\)) # (!\UART_BAUD|clk16_reg\(3) & ((\UART_BAUD|Add0~5\) # (GND)))
-- \UART_BAUD|Add0~7\ = CARRY((!\UART_BAUD|Add0~5\) # (!\UART_BAUD|clk16_reg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART_BAUD|clk16_reg\(3),
	datad => VCC,
	cin => \UART_BAUD|Add0~5\,
	combout => \UART_BAUD|Add0~6_combout\,
	cout => \UART_BAUD|Add0~7\);

-- Location: FF_X22_Y34_N19
\UART_BAUD|clk16_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|Add0~6_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(3));

-- Location: LCCOMB_X22_Y34_N20
\UART_BAUD|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~8_combout\ = (\UART_BAUD|clk16_reg\(4) & (\UART_BAUD|Add0~7\ $ (GND))) # (!\UART_BAUD|clk16_reg\(4) & (!\UART_BAUD|Add0~7\ & VCC))
-- \UART_BAUD|Add0~9\ = CARRY((\UART_BAUD|clk16_reg\(4) & !\UART_BAUD|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|clk16_reg\(4),
	datad => VCC,
	cin => \UART_BAUD|Add0~7\,
	combout => \UART_BAUD|Add0~8_combout\,
	cout => \UART_BAUD|Add0~9\);

-- Location: LCCOMB_X22_Y34_N10
\UART_BAUD|clk16_next[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|clk16_next[4]~4_combout\ = (\UART_BAUD|Add0~8_combout\ & (((!\UART_BAUD|Equal0~0_combout\) # (!\UART_BAUD|clk16_reg\(0))) # (!\UART_BAUD|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|Equal0~1_combout\,
	datab => \UART_BAUD|clk16_reg\(0),
	datac => \UART_BAUD|Equal0~0_combout\,
	datad => \UART_BAUD|Add0~8_combout\,
	combout => \UART_BAUD|clk16_next[4]~4_combout\);

-- Location: FF_X22_Y34_N11
\UART_BAUD|clk16_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|clk16_next[4]~4_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(4));

-- Location: LCCOMB_X22_Y34_N22
\UART_BAUD|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~10_combout\ = (\UART_BAUD|clk16_reg\(5) & (!\UART_BAUD|Add0~9\)) # (!\UART_BAUD|clk16_reg\(5) & ((\UART_BAUD|Add0~9\) # (GND)))
-- \UART_BAUD|Add0~11\ = CARRY((!\UART_BAUD|Add0~9\) # (!\UART_BAUD|clk16_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART_BAUD|clk16_reg\(5),
	datad => VCC,
	cin => \UART_BAUD|Add0~9\,
	combout => \UART_BAUD|Add0~10_combout\,
	cout => \UART_BAUD|Add0~11\);

-- Location: LCCOMB_X22_Y34_N4
\UART_BAUD|clk16_next[5]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|clk16_next[5]~3_combout\ = (\UART_BAUD|Add0~10_combout\ & (((!\UART_BAUD|Equal0~1_combout\) # (!\UART_BAUD|clk16_reg\(0))) # (!\UART_BAUD|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|Equal0~0_combout\,
	datab => \UART_BAUD|clk16_reg\(0),
	datac => \UART_BAUD|Add0~10_combout\,
	datad => \UART_BAUD|Equal0~1_combout\,
	combout => \UART_BAUD|clk16_next[5]~3_combout\);

-- Location: FF_X22_Y34_N5
\UART_BAUD|clk16_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|clk16_next[5]~3_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(5));

-- Location: LCCOMB_X22_Y34_N24
\UART_BAUD|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~12_combout\ = (\UART_BAUD|clk16_reg\(6) & (\UART_BAUD|Add0~11\ $ (GND))) # (!\UART_BAUD|clk16_reg\(6) & (!\UART_BAUD|Add0~11\ & VCC))
-- \UART_BAUD|Add0~13\ = CARRY((\UART_BAUD|clk16_reg\(6) & !\UART_BAUD|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART_BAUD|clk16_reg\(6),
	datad => VCC,
	cin => \UART_BAUD|Add0~11\,
	combout => \UART_BAUD|Add0~12_combout\,
	cout => \UART_BAUD|Add0~13\);

-- Location: FF_X22_Y34_N25
\UART_BAUD|clk16_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|Add0~12_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(6));

-- Location: LCCOMB_X22_Y34_N26
\UART_BAUD|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~14_combout\ = (\UART_BAUD|clk16_reg\(7) & (!\UART_BAUD|Add0~13\)) # (!\UART_BAUD|clk16_reg\(7) & ((\UART_BAUD|Add0~13\) # (GND)))
-- \UART_BAUD|Add0~15\ = CARRY((!\UART_BAUD|Add0~13\) # (!\UART_BAUD|clk16_reg\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \UART_BAUD|clk16_reg\(7),
	datad => VCC,
	cin => \UART_BAUD|Add0~13\,
	combout => \UART_BAUD|Add0~14_combout\,
	cout => \UART_BAUD|Add0~15\);

-- Location: LCCOMB_X22_Y34_N8
\UART_BAUD|clk16_next[7]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|clk16_next[7]~2_combout\ = (\UART_BAUD|Add0~14_combout\ & (((!\UART_BAUD|Equal0~1_combout\) # (!\UART_BAUD|clk16_reg\(0))) # (!\UART_BAUD|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|Equal0~0_combout\,
	datab => \UART_BAUD|clk16_reg\(0),
	datac => \UART_BAUD|Add0~14_combout\,
	datad => \UART_BAUD|Equal0~1_combout\,
	combout => \UART_BAUD|clk16_next[7]~2_combout\);

-- Location: FF_X22_Y34_N9
\UART_BAUD|clk16_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|clk16_next[7]~2_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(7));

-- Location: LCCOMB_X22_Y34_N28
\UART_BAUD|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Add0~16_combout\ = \UART_BAUD|Add0~15\ $ (!\UART_BAUD|clk16_reg\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \UART_BAUD|clk16_reg\(8),
	cin => \UART_BAUD|Add0~15\,
	combout => \UART_BAUD|Add0~16_combout\);

-- Location: LCCOMB_X22_Y34_N0
\UART_BAUD|clk16_next[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|clk16_next[8]~1_combout\ = (\UART_BAUD|Add0~16_combout\ & (((!\UART_BAUD|Equal0~0_combout\) # (!\UART_BAUD|clk16_reg\(0))) # (!\UART_BAUD|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|Equal0~1_combout\,
	datab => \UART_BAUD|clk16_reg\(0),
	datac => \UART_BAUD|Equal0~0_combout\,
	datad => \UART_BAUD|Add0~16_combout\,
	combout => \UART_BAUD|clk16_next[8]~1_combout\);

-- Location: FF_X22_Y34_N1
\UART_BAUD|clk16_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|clk16_next[8]~1_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(8));

-- Location: LCCOMB_X21_Y34_N14
\UART_BAUD|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Equal0~1_combout\ = (\UART_BAUD|clk16_reg\(5) & (\UART_BAUD|clk16_reg\(7) & (\UART_BAUD|clk16_reg\(4) & \UART_BAUD|clk16_reg\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|clk16_reg\(5),
	datab => \UART_BAUD|clk16_reg\(7),
	datac => \UART_BAUD|clk16_reg\(4),
	datad => \UART_BAUD|clk16_reg\(8),
	combout => \UART_BAUD|Equal0~1_combout\);

-- Location: LCCOMB_X22_Y34_N30
\UART_BAUD|clk16_next[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|clk16_next[1]~0_combout\ = (\UART_BAUD|Add0~2_combout\ & (((!\UART_BAUD|Equal0~1_combout\) # (!\UART_BAUD|clk16_reg\(0))) # (!\UART_BAUD|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|Equal0~0_combout\,
	datab => \UART_BAUD|clk16_reg\(0),
	datac => \UART_BAUD|Add0~2_combout\,
	datad => \UART_BAUD|Equal0~1_combout\,
	combout => \UART_BAUD|clk16_next[1]~0_combout\);

-- Location: FF_X22_Y34_N31
\UART_BAUD|clk16_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \UART_BAUD|clk16_next[1]~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UART_BAUD|clk16_reg\(1));

-- Location: LCCOMB_X22_Y34_N6
\UART_BAUD|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Equal0~0_combout\ = (!\UART_BAUD|clk16_reg\(1) & (!\UART_BAUD|clk16_reg\(2) & (!\UART_BAUD|clk16_reg\(3) & !\UART_BAUD|clk16_reg\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|clk16_reg\(1),
	datab => \UART_BAUD|clk16_reg\(2),
	datac => \UART_BAUD|clk16_reg\(3),
	datad => \UART_BAUD|clk16_reg\(6),
	combout => \UART_BAUD|Equal0~0_combout\);

-- Location: LCCOMB_X22_Y34_N2
\UART_BAUD|Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Equal1~0_combout\ = (!\UART_BAUD|clk16_reg\(4) & (!\UART_BAUD|clk16_reg\(5) & (!\UART_BAUD|clk16_reg\(7) & !\UART_BAUD|clk16_reg\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UART_BAUD|clk16_reg\(4),
	datab => \UART_BAUD|clk16_reg\(5),
	datac => \UART_BAUD|clk16_reg\(7),
	datad => \UART_BAUD|clk16_reg\(8),
	combout => \UART_BAUD|Equal1~0_combout\);

-- Location: LCCOMB_X21_Y36_N30
\UART_BAUD|Equal1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \UART_BAUD|Equal1~1_combout\ = (!\UART_BAUD|clk16_reg\(0) & (\UART_BAUD|Equal0~0_combout\ & \UART_BAUD|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UART_BAUD|clk16_reg\(0),
	datac => \UART_BAUD|Equal0~0_combout\,
	datad => \UART_BAUD|Equal1~0_combout\,
	combout => \UART_BAUD|Equal1~1_combout\);

-- Location: LCCOMB_X23_Y35_N0
\Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\present_state.s_stop~q\) # ((\LessThan0~9_combout\ & (\UART_BAUD|Equal1~1_combout\ & \present_state.s_data~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~9_combout\,
	datab => \UART_BAUD|Equal1~1_combout\,
	datac => \present_state.s_stop~q\,
	datad => \present_state.s_data~q\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X24_Y36_N0
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = count(0) $ (VCC)
-- \Add0~1\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X22_Y35_N28
\Add0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = (\Add0~0_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~0_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~7_combout\);

-- Location: LCCOMB_X22_Y35_N22
\count[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(0) = (\Selector2~0_combout\ & (\Add0~7_combout\)) # (!\Selector2~0_combout\ & ((count(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~7_combout\,
	datac => \Selector2~0_combout\,
	datad => count(0),
	combout => count(0));

-- Location: LCCOMB_X24_Y36_N2
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (count(1) & (!\Add0~1\)) # (!count(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X22_Y35_N8
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (\Add0~2_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~2_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~8_combout\);

-- Location: LCCOMB_X22_Y35_N0
\count[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(1) = (\Selector2~0_combout\ & ((\Add0~8_combout\))) # (!\Selector2~0_combout\ & (count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datac => \Add0~8_combout\,
	datad => \Selector2~0_combout\,
	combout => count(1));

-- Location: LCCOMB_X24_Y36_N4
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (count(2) & (\Add0~3\ $ (GND))) # (!count(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((count(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X23_Y35_N6
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\Add0~4_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datac => \present_state.s_stop~q\,
	combout => \Add0~6_combout\);

-- Location: LCCOMB_X23_Y35_N2
\count[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(2) = (\Selector2~0_combout\ & ((\Add0~6_combout\))) # (!\Selector2~0_combout\ & (count(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(2),
	datac => \Selector2~0_combout\,
	datad => \Add0~6_combout\,
	combout => count(2));

-- Location: LCCOMB_X24_Y36_N6
\Add0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~9_combout\ = (count(3) & (!\Add0~5\)) # (!count(3) & ((\Add0~5\) # (GND)))
-- \Add0~10\ = CARRY((!\Add0~5\) # (!count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~9_combout\,
	cout => \Add0~10\);

-- Location: LCCOMB_X23_Y36_N10
\Add0~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~68_combout\ = (\Add0~9_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~9_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~68_combout\);

-- Location: LCCOMB_X23_Y36_N6
\count[3]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(3) = (\Selector2~0_combout\ & ((\Add0~68_combout\))) # (!\Selector2~0_combout\ & (count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(3),
	datad => \Add0~68_combout\,
	combout => count(3));

-- Location: LCCOMB_X24_Y36_N8
\Add0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~11_combout\ = (count(4) & (\Add0~10\ $ (GND))) # (!count(4) & (!\Add0~10\ & VCC))
-- \Add0~12\ = CARRY((count(4) & !\Add0~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(4),
	datad => VCC,
	cin => \Add0~10\,
	combout => \Add0~11_combout\,
	cout => \Add0~12\);

-- Location: LCCOMB_X23_Y36_N18
\Add0~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~69_combout\ = (\Add0~11_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~11_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~69_combout\);

-- Location: LCCOMB_X23_Y36_N14
\count[4]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(4) = (\Selector2~0_combout\ & ((\Add0~69_combout\))) # (!\Selector2~0_combout\ & (count(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(4),
	datad => \Add0~69_combout\,
	combout => count(4));

-- Location: LCCOMB_X24_Y36_N10
\Add0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = (count(5) & (!\Add0~12\)) # (!count(5) & ((\Add0~12\) # (GND)))
-- \Add0~14\ = CARRY((!\Add0~12\) # (!count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(5),
	datad => VCC,
	cin => \Add0~12\,
	combout => \Add0~13_combout\,
	cout => \Add0~14\);

-- Location: LCCOMB_X25_Y36_N14
\Add0~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~70_combout\ = (\Add0~13_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~70_combout\);

-- Location: LCCOMB_X25_Y36_N12
\count[5]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(5) = (\Selector2~0_combout\ & ((\Add0~70_combout\))) # (!\Selector2~0_combout\ & (count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(5),
	datab => \Add0~70_combout\,
	datac => \Selector2~0_combout\,
	combout => count(5));

-- Location: LCCOMB_X24_Y36_N12
\Add0~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = (count(6) & (\Add0~14\ $ (GND))) # (!count(6) & (!\Add0~14\ & VCC))
-- \Add0~16\ = CARRY((count(6) & !\Add0~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(6),
	datad => VCC,
	cin => \Add0~14\,
	combout => \Add0~15_combout\,
	cout => \Add0~16\);

-- Location: LCCOMB_X21_Y36_N8
\Add0~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~71_combout\ = (\Add0~15_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~15_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~71_combout\);

-- Location: LCCOMB_X21_Y36_N14
\count[6]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(6) = (\Selector2~0_combout\ & ((\Add0~71_combout\))) # (!\Selector2~0_combout\ & (count(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(6),
	datac => \Add0~71_combout\,
	datad => \Selector2~0_combout\,
	combout => count(6));

-- Location: LCCOMB_X24_Y36_N14
\Add0~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = (count(7) & (!\Add0~16\)) # (!count(7) & ((\Add0~16\) # (GND)))
-- \Add0~18\ = CARRY((!\Add0~16\) # (!count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(7),
	datad => VCC,
	cin => \Add0~16\,
	combout => \Add0~17_combout\,
	cout => \Add0~18\);

-- Location: LCCOMB_X23_Y36_N28
\Add0~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~72_combout\ = (\Add0~17_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~17_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~72_combout\);

-- Location: LCCOMB_X23_Y36_N26
\count[7]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(7) = (\Selector2~0_combout\ & ((\Add0~72_combout\))) # (!\Selector2~0_combout\ & (count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(7),
	datad => \Add0~72_combout\,
	combout => count(7));

-- Location: LCCOMB_X24_Y36_N16
\Add0~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = (count(8) & (\Add0~18\ $ (GND))) # (!count(8) & (!\Add0~18\ & VCC))
-- \Add0~20\ = CARRY((count(8) & !\Add0~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(8),
	datad => VCC,
	cin => \Add0~18\,
	combout => \Add0~19_combout\,
	cout => \Add0~20\);

-- Location: LCCOMB_X25_Y36_N18
\Add0~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~73_combout\ = (\Add0~19_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~19_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~73_combout\);

-- Location: LCCOMB_X25_Y36_N0
\count[8]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(8) = (\Selector2~0_combout\ & ((\Add0~73_combout\))) # (!\Selector2~0_combout\ & (count(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(8),
	datac => \Selector2~0_combout\,
	datad => \Add0~73_combout\,
	combout => count(8));

-- Location: LCCOMB_X24_Y36_N18
\Add0~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~21_combout\ = (count(9) & (!\Add0~20\)) # (!count(9) & ((\Add0~20\) # (GND)))
-- \Add0~22\ = CARRY((!\Add0~20\) # (!count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(9),
	datad => VCC,
	cin => \Add0~20\,
	combout => \Add0~21_combout\,
	cout => \Add0~22\);

-- Location: LCCOMB_X25_Y36_N26
\Add0~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~74_combout\ = (\Add0~21_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~21_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~74_combout\);

-- Location: LCCOMB_X25_Y36_N30
\count[9]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(9) = (\Selector2~0_combout\ & ((\Add0~74_combout\))) # (!\Selector2~0_combout\ & (count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(9),
	datac => \Selector2~0_combout\,
	datad => \Add0~74_combout\,
	combout => count(9));

-- Location: LCCOMB_X24_Y36_N20
\Add0~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~23_combout\ = (count(10) & (\Add0~22\ $ (GND))) # (!count(10) & (!\Add0~22\ & VCC))
-- \Add0~24\ = CARRY((count(10) & !\Add0~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(10),
	datad => VCC,
	cin => \Add0~22\,
	combout => \Add0~23_combout\,
	cout => \Add0~24\);

-- Location: LCCOMB_X25_Y36_N10
\Add0~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~75_combout\ = (\Add0~23_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~23_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~75_combout\);

-- Location: LCCOMB_X25_Y36_N2
\count[10]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(10) = (\Selector2~0_combout\ & ((\Add0~75_combout\))) # (!\Selector2~0_combout\ & (count(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(10),
	datac => \Selector2~0_combout\,
	datad => \Add0~75_combout\,
	combout => count(10));

-- Location: LCCOMB_X24_Y36_N22
\Add0~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~25_combout\ = (count(11) & (!\Add0~24\)) # (!count(11) & ((\Add0~24\) # (GND)))
-- \Add0~26\ = CARRY((!\Add0~24\) # (!count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(11),
	datad => VCC,
	cin => \Add0~24\,
	combout => \Add0~25_combout\,
	cout => \Add0~26\);

-- Location: LCCOMB_X23_Y36_N12
\Add0~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~76_combout\ = (\Add0~25_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~25_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~76_combout\);

-- Location: LCCOMB_X23_Y36_N22
\count[11]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(11) = (\Selector2~0_combout\ & ((\Add0~76_combout\))) # (!\Selector2~0_combout\ & (count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(11),
	datad => \Add0~76_combout\,
	combout => count(11));

-- Location: LCCOMB_X24_Y36_N24
\Add0~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~27_combout\ = (count(12) & (\Add0~26\ $ (GND))) # (!count(12) & (!\Add0~26\ & VCC))
-- \Add0~28\ = CARRY((count(12) & !\Add0~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(12),
	datad => VCC,
	cin => \Add0~26\,
	combout => \Add0~27_combout\,
	cout => \Add0~28\);

-- Location: LCCOMB_X23_Y36_N2
\Add0~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~77_combout\ = (\Add0~27_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~27_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~77_combout\);

-- Location: LCCOMB_X23_Y36_N16
\count[12]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(12) = (\Selector2~0_combout\ & ((\Add0~77_combout\))) # (!\Selector2~0_combout\ & (count(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(12),
	datad => \Add0~77_combout\,
	combout => count(12));

-- Location: LCCOMB_X24_Y36_N26
\Add0~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~29_combout\ = (count(13) & (!\Add0~28\)) # (!count(13) & ((\Add0~28\) # (GND)))
-- \Add0~30\ = CARRY((!\Add0~28\) # (!count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(13),
	datad => VCC,
	cin => \Add0~28\,
	combout => \Add0~29_combout\,
	cout => \Add0~30\);

-- Location: LCCOMB_X23_Y36_N20
\Add0~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~78_combout\ = (\Add0~29_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~29_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~78_combout\);

-- Location: LCCOMB_X23_Y36_N24
\count[13]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(13) = (\Selector2~0_combout\ & ((\Add0~78_combout\))) # (!\Selector2~0_combout\ & (count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(13),
	datad => \Add0~78_combout\,
	combout => count(13));

-- Location: LCCOMB_X24_Y36_N28
\Add0~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~31_combout\ = (count(14) & (\Add0~30\ $ (GND))) # (!count(14) & (!\Add0~30\ & VCC))
-- \Add0~32\ = CARRY((count(14) & !\Add0~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(14),
	datad => VCC,
	cin => \Add0~30\,
	combout => \Add0~31_combout\,
	cout => \Add0~32\);

-- Location: LCCOMB_X22_Y35_N14
\Add0~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~79_combout\ = (\Add0~31_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~31_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~79_combout\);

-- Location: LCCOMB_X23_Y36_N4
\count[14]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(14) = (\Selector2~0_combout\ & ((\Add0~79_combout\))) # (!\Selector2~0_combout\ & (count(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(14),
	datad => \Add0~79_combout\,
	combout => count(14));

-- Location: LCCOMB_X24_Y36_N30
\Add0~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~33_combout\ = (count(15) & (!\Add0~32\)) # (!count(15) & ((\Add0~32\) # (GND)))
-- \Add0~34\ = CARRY((!\Add0~32\) # (!count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(15),
	datad => VCC,
	cin => \Add0~32\,
	combout => \Add0~33_combout\,
	cout => \Add0~34\);

-- Location: LCCOMB_X22_Y36_N10
\Add0~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~80_combout\ = (\Add0~33_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~33_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~80_combout\);

-- Location: LCCOMB_X22_Y36_N4
\count[15]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(15) = (\Selector2~0_combout\ & (\Add0~80_combout\)) # (!\Selector2~0_combout\ & ((count(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~80_combout\,
	datab => count(15),
	datad => \Selector2~0_combout\,
	combout => count(15));

-- Location: LCCOMB_X24_Y35_N0
\Add0~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~35_combout\ = (count(16) & (\Add0~34\ $ (GND))) # (!count(16) & (!\Add0~34\ & VCC))
-- \Add0~36\ = CARRY((count(16) & !\Add0~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(16),
	datad => VCC,
	cin => \Add0~34\,
	combout => \Add0~35_combout\,
	cout => \Add0~36\);

-- Location: LCCOMB_X25_Y36_N24
\Add0~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~81_combout\ = (\Add0~35_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~35_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~81_combout\);

-- Location: LCCOMB_X25_Y36_N28
\count[16]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(16) = (\Selector2~0_combout\ & ((\Add0~81_combout\))) # (!\Selector2~0_combout\ & (count(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(16),
	datac => \Selector2~0_combout\,
	datad => \Add0~81_combout\,
	combout => count(16));

-- Location: LCCOMB_X24_Y35_N2
\Add0~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~37_combout\ = (count(17) & (!\Add0~36\)) # (!count(17) & ((\Add0~36\) # (GND)))
-- \Add0~38\ = CARRY((!\Add0~36\) # (!count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(17),
	datad => VCC,
	cin => \Add0~36\,
	combout => \Add0~37_combout\,
	cout => \Add0~38\);

-- Location: LCCOMB_X22_Y35_N4
\Add0~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~82_combout\ = (\Add0~37_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~37_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~82_combout\);

-- Location: LCCOMB_X22_Y35_N16
\count[17]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(17) = (\Selector2~0_combout\ & ((\Add0~82_combout\))) # (!\Selector2~0_combout\ & (count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(17),
	datac => \Add0~82_combout\,
	datad => \Selector2~0_combout\,
	combout => count(17));

-- Location: LCCOMB_X24_Y35_N4
\Add0~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~39_combout\ = (count(18) & (\Add0~38\ $ (GND))) # (!count(18) & (!\Add0~38\ & VCC))
-- \Add0~40\ = CARRY((count(18) & !\Add0~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(18),
	datad => VCC,
	cin => \Add0~38\,
	combout => \Add0~39_combout\,
	cout => \Add0~40\);

-- Location: LCCOMB_X22_Y35_N24
\Add0~83\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~83_combout\ = (\Add0~39_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~39_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~83_combout\);

-- Location: LCCOMB_X22_Y35_N20
\count[18]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(18) = (\Selector2~0_combout\ & ((\Add0~83_combout\))) # (!\Selector2~0_combout\ & (count(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(18),
	datac => \Selector2~0_combout\,
	datad => \Add0~83_combout\,
	combout => count(18));

-- Location: LCCOMB_X24_Y35_N6
\Add0~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~41_combout\ = (count(19) & (!\Add0~40\)) # (!count(19) & ((\Add0~40\) # (GND)))
-- \Add0~42\ = CARRY((!\Add0~40\) # (!count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(19),
	datad => VCC,
	cin => \Add0~40\,
	combout => \Add0~41_combout\,
	cout => \Add0~42\);

-- Location: LCCOMB_X22_Y35_N26
\Add0~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~84_combout\ = (!\present_state.s_stop~q\ & \Add0~41_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datad => \Add0~41_combout\,
	combout => \Add0~84_combout\);

-- Location: LCCOMB_X22_Y35_N12
\count[19]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(19) = (\Selector2~0_combout\ & ((\Add0~84_combout\))) # (!\Selector2~0_combout\ & (count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(19),
	datac => \Selector2~0_combout\,
	datad => \Add0~84_combout\,
	combout => count(19));

-- Location: LCCOMB_X24_Y35_N8
\Add0~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~43_combout\ = (count(20) & (\Add0~42\ $ (GND))) # (!count(20) & (!\Add0~42\ & VCC))
-- \Add0~44\ = CARRY((count(20) & !\Add0~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(20),
	datad => VCC,
	cin => \Add0~42\,
	combout => \Add0~43_combout\,
	cout => \Add0~44\);

-- Location: LCCOMB_X23_Y35_N16
\Add0~85\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~85_combout\ = (!\present_state.s_stop~q\ & \Add0~43_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_stop~q\,
	datad => \Add0~43_combout\,
	combout => \Add0~85_combout\);

-- Location: LCCOMB_X23_Y35_N8
\count[20]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(20) = (\Selector2~0_combout\ & ((\Add0~85_combout\))) # (!\Selector2~0_combout\ & (count(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(20),
	datab => \Selector2~0_combout\,
	datad => \Add0~85_combout\,
	combout => count(20));

-- Location: LCCOMB_X24_Y35_N10
\Add0~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~45_combout\ = (count(21) & (!\Add0~44\)) # (!count(21) & ((\Add0~44\) # (GND)))
-- \Add0~46\ = CARRY((!\Add0~44\) # (!count(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(21),
	datad => VCC,
	cin => \Add0~44\,
	combout => \Add0~45_combout\,
	cout => \Add0~46\);

-- Location: LCCOMB_X22_Y35_N30
\Add0~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~86_combout\ = (!\present_state.s_stop~q\ & \Add0~45_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datad => \Add0~45_combout\,
	combout => \Add0~86_combout\);

-- Location: LCCOMB_X22_Y35_N10
\count[21]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(21) = (\Selector2~0_combout\ & ((\Add0~86_combout\))) # (!\Selector2~0_combout\ & (count(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(21),
	datac => \Add0~86_combout\,
	datad => \Selector2~0_combout\,
	combout => count(21));

-- Location: LCCOMB_X24_Y35_N12
\Add0~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~47_combout\ = (count(22) & (\Add0~46\ $ (GND))) # (!count(22) & (!\Add0~46\ & VCC))
-- \Add0~48\ = CARRY((count(22) & !\Add0~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(22),
	datad => VCC,
	cin => \Add0~46\,
	combout => \Add0~47_combout\,
	cout => \Add0~48\);

-- Location: LCCOMB_X23_Y35_N12
\Add0~87\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~87_combout\ = (!\present_state.s_stop~q\ & \Add0~47_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_stop~q\,
	datad => \Add0~47_combout\,
	combout => \Add0~87_combout\);

-- Location: LCCOMB_X23_Y35_N22
\count[22]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(22) = (\Selector2~0_combout\ & ((\Add0~87_combout\))) # (!\Selector2~0_combout\ & (count(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(22),
	datad => \Add0~87_combout\,
	combout => count(22));

-- Location: LCCOMB_X24_Y35_N14
\Add0~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~49_combout\ = (count(23) & (!\Add0~48\)) # (!count(23) & ((\Add0~48\) # (GND)))
-- \Add0~50\ = CARRY((!\Add0~48\) # (!count(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(23),
	datad => VCC,
	cin => \Add0~48\,
	combout => \Add0~49_combout\,
	cout => \Add0~50\);

-- Location: LCCOMB_X25_Y35_N12
\Add0~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~88_combout\ = (!\present_state.s_stop~q\ & \Add0~49_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datad => \Add0~49_combout\,
	combout => \Add0~88_combout\);

-- Location: LCCOMB_X25_Y35_N30
\count[23]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(23) = (\Selector2~0_combout\ & ((\Add0~88_combout\))) # (!\Selector2~0_combout\ & (count(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(23),
	datac => \Selector2~0_combout\,
	datad => \Add0~88_combout\,
	combout => count(23));

-- Location: LCCOMB_X24_Y35_N16
\Add0~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~51_combout\ = (count(24) & (\Add0~50\ $ (GND))) # (!count(24) & (!\Add0~50\ & VCC))
-- \Add0~52\ = CARRY((count(24) & !\Add0~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(24),
	datad => VCC,
	cin => \Add0~50\,
	combout => \Add0~51_combout\,
	cout => \Add0~52\);

-- Location: LCCOMB_X25_Y35_N16
\Add0~89\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~89_combout\ = (\Add0~51_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~51_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~89_combout\);

-- Location: LCCOMB_X25_Y35_N2
\count[24]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(24) = (\Selector2~0_combout\ & ((\Add0~89_combout\))) # (!\Selector2~0_combout\ & (count(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(24),
	datac => \Selector2~0_combout\,
	datad => \Add0~89_combout\,
	combout => count(24));

-- Location: LCCOMB_X24_Y35_N18
\Add0~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~53_combout\ = (count(25) & (!\Add0~52\)) # (!count(25) & ((\Add0~52\) # (GND)))
-- \Add0~54\ = CARRY((!\Add0~52\) # (!count(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(25),
	datad => VCC,
	cin => \Add0~52\,
	combout => \Add0~53_combout\,
	cout => \Add0~54\);

-- Location: LCCOMB_X25_Y35_N28
\Add0~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~90_combout\ = (!\present_state.s_stop~q\ & \Add0~53_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datad => \Add0~53_combout\,
	combout => \Add0~90_combout\);

-- Location: LCCOMB_X25_Y35_N26
\count[25]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(25) = (\Selector2~0_combout\ & ((\Add0~90_combout\))) # (!\Selector2~0_combout\ & (count(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(25),
	datac => \Selector2~0_combout\,
	datad => \Add0~90_combout\,
	combout => count(25));

-- Location: LCCOMB_X24_Y35_N20
\Add0~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~55_combout\ = (count(26) & (\Add0~54\ $ (GND))) # (!count(26) & (!\Add0~54\ & VCC))
-- \Add0~56\ = CARRY((count(26) & !\Add0~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datad => VCC,
	cin => \Add0~54\,
	combout => \Add0~55_combout\,
	cout => \Add0~56\);

-- Location: LCCOMB_X25_Y35_N24
\Add0~91\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~91_combout\ = (!\present_state.s_stop~q\ & \Add0~55_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datad => \Add0~55_combout\,
	combout => \Add0~91_combout\);

-- Location: LCCOMB_X25_Y35_N6
\count[26]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(26) = (\Selector2~0_combout\ & ((\Add0~91_combout\))) # (!\Selector2~0_combout\ & (count(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datac => \Selector2~0_combout\,
	datad => \Add0~91_combout\,
	combout => count(26));

-- Location: LCCOMB_X24_Y35_N22
\Add0~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~57_combout\ = (count(27) & (!\Add0~56\)) # (!count(27) & ((\Add0~56\) # (GND)))
-- \Add0~58\ = CARRY((!\Add0~56\) # (!count(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(27),
	datad => VCC,
	cin => \Add0~56\,
	combout => \Add0~57_combout\,
	cout => \Add0~58\);

-- Location: LCCOMB_X23_Y35_N10
\Add0~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~92_combout\ = (!\present_state.s_stop~q\ & \Add0~57_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_stop~q\,
	datad => \Add0~57_combout\,
	combout => \Add0~92_combout\);

-- Location: LCCOMB_X23_Y35_N18
\count[27]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(27) = (\Selector2~0_combout\ & ((\Add0~92_combout\))) # (!\Selector2~0_combout\ & (count(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(27),
	datac => \Selector2~0_combout\,
	datad => \Add0~92_combout\,
	combout => count(27));

-- Location: LCCOMB_X24_Y35_N24
\Add0~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~59_combout\ = (count(28) & (\Add0~58\ $ (GND))) # (!count(28) & (!\Add0~58\ & VCC))
-- \Add0~60\ = CARRY((count(28) & !\Add0~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(28),
	datad => VCC,
	cin => \Add0~58\,
	combout => \Add0~59_combout\,
	cout => \Add0~60\);

-- Location: LCCOMB_X23_Y35_N28
\Add0~93\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~93_combout\ = (!\present_state.s_stop~q\ & \Add0~59_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_stop~q\,
	datad => \Add0~59_combout\,
	combout => \Add0~93_combout\);

-- Location: LCCOMB_X23_Y35_N30
\count[28]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(28) = (\Selector2~0_combout\ & ((\Add0~93_combout\))) # (!\Selector2~0_combout\ & (count(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(28),
	datab => \Selector2~0_combout\,
	datad => \Add0~93_combout\,
	combout => count(28));

-- Location: LCCOMB_X24_Y35_N26
\Add0~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~61_combout\ = (count(29) & (!\Add0~60\)) # (!count(29) & ((\Add0~60\) # (GND)))
-- \Add0~62\ = CARRY((!\Add0~60\) # (!count(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(29),
	datad => VCC,
	cin => \Add0~60\,
	combout => \Add0~61_combout\,
	cout => \Add0~62\);

-- Location: LCCOMB_X23_Y35_N20
\Add0~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~94_combout\ = (!\present_state.s_stop~q\ & \Add0~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_stop~q\,
	datad => \Add0~61_combout\,
	combout => \Add0~94_combout\);

-- Location: LCCOMB_X23_Y35_N14
\count[29]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(29) = (\Selector2~0_combout\ & ((\Add0~94_combout\))) # (!\Selector2~0_combout\ & (count(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(29),
	datad => \Add0~94_combout\,
	combout => count(29));

-- Location: LCCOMB_X24_Y35_N28
\Add0~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~63_combout\ = (count(30) & (\Add0~62\ $ (GND))) # (!count(30) & (!\Add0~62\ & VCC))
-- \Add0~64\ = CARRY((count(30) & !\Add0~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(30),
	datad => VCC,
	cin => \Add0~62\,
	combout => \Add0~63_combout\,
	cout => \Add0~64\);

-- Location: LCCOMB_X23_Y35_N24
\Add0~95\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~95_combout\ = (!\present_state.s_stop~q\ & \Add0~63_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_stop~q\,
	datad => \Add0~63_combout\,
	combout => \Add0~95_combout\);

-- Location: LCCOMB_X23_Y35_N26
\count[30]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(30) = (\Selector2~0_combout\ & ((\Add0~95_combout\))) # (!\Selector2~0_combout\ & (count(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(30),
	datab => \Selector2~0_combout\,
	datad => \Add0~95_combout\,
	combout => count(30));

-- Location: LCCOMB_X24_Y35_N30
\Add0~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~65_combout\ = \Add0~64\ $ (count(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => count(31),
	cin => \Add0~64\,
	combout => \Add0~65_combout\);

-- Location: LCCOMB_X23_Y36_N0
\Add0~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~67_combout\ = (\Add0~65_combout\ & !\present_state.s_stop~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~65_combout\,
	datad => \present_state.s_stop~q\,
	combout => \Add0~67_combout\);

-- Location: LCCOMB_X23_Y36_N8
\count[31]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- count(31) = (\Selector2~0_combout\ & ((\Add0~67_combout\))) # (!\Selector2~0_combout\ & (count(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => count(31),
	datad => \Add0~67_combout\,
	combout => count(31));

-- Location: LCCOMB_X23_Y36_N30
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!count(11) & (!count(13) & (!count(14) & !count(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(11),
	datab => count(13),
	datac => count(14),
	datad => count(12),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X22_Y36_N16
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!count(3) & (!count(5) & (!count(4) & !count(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datab => count(5),
	datac => count(4),
	datad => count(6),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X25_Y36_N20
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!count(9) & (!count(8) & (!count(7) & !count(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(9),
	datab => count(8),
	datac => count(7),
	datad => count(10),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X22_Y36_N18
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (!count(16) & (!count(15) & (!count(17) & !count(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(16),
	datab => count(15),
	datac => count(17),
	datad => count(18),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X22_Y36_N2
\LessThan0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (\LessThan0~2_combout\ & (\LessThan0~0_combout\ & (\LessThan0~1_combout\ & \LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => \LessThan0~0_combout\,
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~3_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X22_Y35_N6
\next_state.s_stop~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s_stop~0_combout\ = (count(2) & (count(1) & count(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datab => count(1),
	datad => count(0),
	combout => \next_state.s_stop~0_combout\);

-- Location: LCCOMB_X23_Y35_N4
\LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = (!count(30) & (!count(29) & (!count(28) & !count(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(30),
	datab => count(29),
	datac => count(28),
	datad => count(27),
	combout => \LessThan0~7_combout\);

-- Location: LCCOMB_X25_Y35_N0
\LessThan0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (!count(25) & (!count(24) & (!count(23) & !count(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(25),
	datab => count(24),
	datac => count(23),
	datad => count(26),
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X22_Y35_N18
\LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!count(19) & (!count(22) & (!count(20) & !count(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(19),
	datab => count(22),
	datac => count(20),
	datad => count(21),
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X22_Y36_N12
\LessThan0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (\LessThan0~7_combout\ & (\LessThan0~6_combout\ & \LessThan0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~7_combout\,
	datac => \LessThan0~6_combout\,
	datad => \LessThan0~5_combout\,
	combout => \LessThan0~8_combout\);

-- Location: LCCOMB_X22_Y36_N22
\LessThan0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~9_combout\ = (count(31)) # ((\LessThan0~4_combout\ & (!\next_state.s_stop~0_combout\ & \LessThan0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(31),
	datab => \LessThan0~4_combout\,
	datac => \next_state.s_stop~0_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan0~9_combout\);

-- Location: LCCOMB_X22_Y36_N0
\next_state.s_stop~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s_stop~1_combout\ = (\LessThan0~8_combout\ & (\UART_BAUD|Equal1~1_combout\ & (\next_state.s_stop~0_combout\ & \LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \UART_BAUD|Equal1~1_combout\,
	datac => \next_state.s_stop~0_combout\,
	datad => \LessThan0~4_combout\,
	combout => \next_state.s_stop~1_combout\);

-- Location: LCCOMB_X22_Y36_N20
\Selector41~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector41~0_combout\ = ((\next_state.s_stop~1_combout\) # ((\LessThan0~9_combout\ & \UART_BAUD|Equal1~1_combout\))) # (!\present_state.s_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~9_combout\,
	datab => \UART_BAUD|Equal1~1_combout\,
	datac => \present_state.s_data~q\,
	datad => \next_state.s_stop~1_combout\,
	combout => \Selector41~0_combout\);

-- Location: CLKCTRL_G0
\Selector41~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Selector41~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Selector41~0clkctrl_outclk\);

-- Location: IOIBUF_X22_Y39_N15
\tx_start~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_start,
	o => \tx_start~input_o\);

-- Location: LCCOMB_X25_Y36_N22
\Selector42~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector42~0_combout\ = (\present_state.s_stop~q\ & ((\UART_BAUD|Equal1~1_combout\) # ((!\tx_start~input_o\ & !\present_state.s_idle~q\)))) # (!\present_state.s_stop~q\ & (!\tx_start~input_o\ & (!\present_state.s_idle~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datab => \tx_start~input_o\,
	datac => \present_state.s_idle~q\,
	datad => \UART_BAUD|Equal1~1_combout\,
	combout => \Selector42~0_combout\);

-- Location: LCCOMB_X25_Y36_N16
\next_state.s_idle_616\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s_idle_616~combout\ = (GLOBAL(\Selector41~0clkctrl_outclk\) & ((\Selector42~0_combout\))) # (!GLOBAL(\Selector41~0clkctrl_outclk\) & (\next_state.s_idle_616~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s_idle_616~combout\,
	datab => \Selector42~0_combout\,
	datad => \Selector41~0clkctrl_outclk\,
	combout => \next_state.s_idle_616~combout\);

-- Location: LCCOMB_X25_Y36_N6
\present_state.s_idle~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \present_state.s_idle~0_combout\ = !\next_state.s_idle_616~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \next_state.s_idle_616~combout\,
	combout => \present_state.s_idle~0_combout\);

-- Location: FF_X25_Y36_N7
\present_state.s_idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \present_state.s_idle~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s_idle~q\);

-- Location: LCCOMB_X22_Y36_N8
\Selector40~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector40~0_combout\ = (\present_state.s_idle~q\ & (((\present_state.s_start~q\ & !\UART_BAUD|Equal1~1_combout\)))) # (!\present_state.s_idle~q\ & ((\tx_start~input_o\) # ((\present_state.s_start~q\ & !\UART_BAUD|Equal1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_idle~q\,
	datab => \tx_start~input_o\,
	datac => \present_state.s_start~q\,
	datad => \UART_BAUD|Equal1~1_combout\,
	combout => \Selector40~0_combout\);

-- Location: LCCOMB_X22_Y36_N14
\next_state.s_start_605\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s_start_605~combout\ = (GLOBAL(\Selector41~0clkctrl_outclk\) & ((\Selector40~0_combout\))) # (!GLOBAL(\Selector41~0clkctrl_outclk\) & (\next_state.s_start_605~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \next_state.s_start_605~combout\,
	datac => \Selector40~0_combout\,
	datad => \Selector41~0clkctrl_outclk\,
	combout => \next_state.s_start_605~combout\);

-- Location: FF_X22_Y36_N9
\present_state.s_start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \next_state.s_start_605~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s_start~q\);

-- Location: LCCOMB_X22_Y36_N6
\Selector38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector38~0_combout\ = (\UART_BAUD|Equal1~1_combout\ & ((\present_state.s_start~q\) # ((\LessThan0~9_combout\ & \present_state.s_data~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_start~q\,
	datab => \LessThan0~9_combout\,
	datac => \present_state.s_data~q\,
	datad => \UART_BAUD|Equal1~1_combout\,
	combout => \Selector38~0_combout\);

-- Location: LCCOMB_X22_Y36_N26
\next_state.s_data_594\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s_data_594~combout\ = (GLOBAL(\Selector41~0clkctrl_outclk\) & ((\Selector38~0_combout\))) # (!GLOBAL(\Selector41~0clkctrl_outclk\) & (\next_state.s_data_594~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector41~0clkctrl_outclk\,
	datac => \next_state.s_data_594~combout\,
	datad => \Selector38~0_combout\,
	combout => \next_state.s_data_594~combout\);

-- Location: FF_X22_Y36_N21
\present_state.s_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \next_state.s_data_594~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s_data~q\);

-- Location: LCCOMB_X22_Y36_N28
\Selector36~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector36~0_combout\ = (\present_state.s_data~q\ & (((!\LessThan0~9_combout\)) # (!\UART_BAUD|Equal1~1_combout\))) # (!\present_state.s_data~q\ & (!\UART_BAUD|Equal1~1_combout\ & (\present_state.s_stop~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_data~q\,
	datab => \UART_BAUD|Equal1~1_combout\,
	datac => \present_state.s_stop~q\,
	datad => \LessThan0~9_combout\,
	combout => \Selector36~0_combout\);

-- Location: LCCOMB_X22_Y36_N30
\next_state.s_stop_583\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \next_state.s_stop_583~combout\ = (GLOBAL(\Selector41~0clkctrl_outclk\) & ((\Selector36~0_combout\))) # (!GLOBAL(\Selector41~0clkctrl_outclk\) & (\next_state.s_stop_583~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \next_state.s_stop_583~combout\,
	datac => \Selector36~0_combout\,
	datad => \Selector41~0clkctrl_outclk\,
	combout => \next_state.s_stop_583~combout\);

-- Location: FF_X22_Y35_N7
\present_state.s_stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \next_state.s_stop_583~combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \present_state.s_stop~q\);

-- Location: IOIBUF_X24_Y39_N15
\in_sw[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(7),
	o => \in_sw[7]~input_o\);

-- Location: LCCOMB_X21_Y34_N16
\data[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data[0]~0_combout\ = (\present_state.s_start~q\ & (\UART_BAUD|Equal1~0_combout\ & (!\UART_BAUD|clk16_reg\(0) & \UART_BAUD|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_start~q\,
	datab => \UART_BAUD|Equal1~0_combout\,
	datac => \UART_BAUD|clk16_reg\(0),
	datad => \UART_BAUD|Equal0~0_combout\,
	combout => \data[0]~0_combout\);

-- Location: CLKCTRL_G2
\data[0]~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \data[0]~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \data[0]~0clkctrl_outclk\);

-- Location: LCCOMB_X25_Y38_N8
\data[7]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(7) = (GLOBAL(\data[0]~0clkctrl_outclk\) & (\in_sw[7]~input_o\)) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & ((data(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in_sw[7]~input_o\,
	datac => data(7),
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(7));

-- Location: IOIBUF_X29_Y39_N8
\in_sw[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(4),
	o => \in_sw[4]~input_o\);

-- Location: LCCOMB_X26_Y38_N16
\data[4]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(4) = (GLOBAL(\data[0]~0clkctrl_outclk\) & ((\in_sw[4]~input_o\))) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & (data(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data(4),
	datac => \in_sw[4]~input_o\,
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(4));

-- Location: IOIBUF_X26_Y39_N1
\in_sw[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(6),
	o => \in_sw[6]~input_o\);

-- Location: LCCOMB_X26_Y38_N6
\data[6]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(6) = (GLOBAL(\data[0]~0clkctrl_outclk\) & ((\in_sw[6]~input_o\))) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & (data(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data(6),
	datac => \in_sw[6]~input_o\,
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(6));

-- Location: LCCOMB_X26_Y38_N8
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (count(1) & (((count(0)) # (data(6))))) # (!count(1) & (data(4) & (!count(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(1),
	datab => data(4),
	datac => count(0),
	datad => data(6),
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X26_Y39_N15
\in_sw[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(5),
	o => \in_sw[5]~input_o\);

-- Location: LCCOMB_X26_Y38_N24
\data[5]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(5) = (GLOBAL(\data[0]~0clkctrl_outclk\) & ((\in_sw[5]~input_o\))) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & (data(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data(5),
	datac => \in_sw[5]~input_o\,
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(5));

-- Location: LCCOMB_X26_Y38_N26
\Mux0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux0~0_combout\ & ((data(7)) # ((!count(0))))) # (!\Mux0~0_combout\ & (((count(0) & data(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data(7),
	datab => \Mux0~0_combout\,
	datac => count(0),
	datad => data(5),
	combout => \Mux0~1_combout\);

-- Location: IOIBUF_X26_Y39_N22
\in_sw[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(2),
	o => \in_sw[2]~input_o\);

-- Location: LCCOMB_X26_Y38_N22
\data[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(2) = (GLOBAL(\data[0]~0clkctrl_outclk\) & (\in_sw[2]~input_o\)) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & ((data(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in_sw[2]~input_o\,
	datac => data(2),
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(2));

-- Location: IOIBUF_X29_Y39_N15
\in_sw[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(3),
	o => \in_sw[3]~input_o\);

-- Location: LCCOMB_X26_Y38_N20
\data[3]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(3) = (GLOBAL(\data[0]~0clkctrl_outclk\) & ((\in_sw[3]~input_o\))) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & (data(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data(3),
	datac => \in_sw[3]~input_o\,
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(3));

-- Location: IOIBUF_X26_Y39_N8
\in_sw[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(0),
	o => \in_sw[0]~input_o\);

-- Location: LCCOMB_X26_Y38_N10
\data[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(0) = (GLOBAL(\data[0]~0clkctrl_outclk\) & ((\in_sw[0]~input_o\))) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & (data(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data(0),
	datac => \in_sw[0]~input_o\,
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(0));

-- Location: IOIBUF_X26_Y39_N29
\in_sw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_sw(1),
	o => \in_sw[1]~input_o\);

-- Location: LCCOMB_X26_Y38_N12
\data[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- data(1) = (GLOBAL(\data[0]~0clkctrl_outclk\) & ((\in_sw[1]~input_o\))) # (!GLOBAL(\data[0]~0clkctrl_outclk\) & (data(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data(1),
	datac => \in_sw[1]~input_o\,
	datad => \data[0]~0clkctrl_outclk\,
	combout => data(1));

-- Location: LCCOMB_X26_Y38_N4
\Mux0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (count(0) & (((count(1)) # (data(1))))) # (!count(0) & (data(0) & (!count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data(0),
	datab => count(0),
	datac => count(1),
	datad => data(1),
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X26_Y38_N18
\Mux0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (count(1) & ((\Mux0~2_combout\ & ((data(3)))) # (!\Mux0~2_combout\ & (data(2))))) # (!count(1) & (((\Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data(2),
	datab => data(3),
	datac => count(1),
	datad => \Mux0~2_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X25_Y36_N4
\Selector6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (count(2) & (\Mux0~1_combout\)) # (!count(2) & ((\Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~1_combout\,
	datac => count(2),
	datad => \Mux0~3_combout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X25_Y36_N8
\Selector6~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\present_state.s_stop~q\) # (((\Selector6~0_combout\ & \present_state.s_data~q\)) # (!\present_state.s_idle~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datab => \Selector6~0_combout\,
	datac => \present_state.s_data~q\,
	datad => \present_state.s_idle~q\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X22_Y36_N24
\tx_done_tick~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_done_tick~2_combout\ = (\present_state.s_start~q\) # (\present_state.s_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_start~q\,
	datad => \present_state.s_data~q\,
	combout => \tx_done_tick~2_combout\);

-- Location: LCCOMB_X22_Y35_N2
\tx_done_tick$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \tx_done_tick$latch~combout\ = (\tx_done_tick~2_combout\ & ((\tx_done_tick$latch~combout\))) # (!\tx_done_tick~2_combout\ & (\present_state.s_stop~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \present_state.s_stop~q\,
	datac => \tx_done_tick~2_combout\,
	datad => \tx_done_tick$latch~combout\,
	combout => \tx_done_tick$latch~combout\);

-- Location: LCCOMB_X21_Y34_N0
\state_out~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \state_out~0_combout\ = (\present_state.s_data~q\) # (!\present_state.s_idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_data~q\,
	datad => \present_state.s_idle~q\,
	combout => \state_out~0_combout\);

-- Location: LCCOMB_X21_Y34_N12
\state_out~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \state_out~1_combout\ = (\present_state.s_start~q\) # (!\present_state.s_idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \present_state.s_start~q\,
	datad => \present_state.s_idle~q\,
	combout => \state_out~1_combout\);

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

ww_s_tx <= \s_tx~output_o\;

ww_tx_done_tick <= \tx_done_tick~output_o\;

ww_state_out(0) <= \state_out[0]~output_o\;

ww_state_out(1) <= \state_out[1]~output_o\;
END structure;


