Library IEEE;
use ieee.std_logic_1164.all;

Entity Teclado is
PORT (
        clk: in std_logic;
        col: in std_logic_vector (2 downto 0);
        filas: out std_logic_vector (3 downto 0);
        display: out std_logic;
        Segmentos: out std_logic_vector (7 downto 0)
        );
End Teclado;

architecture TecladoMatricial of Teclado is

component LIB_TECLADO_MATRICIAL_4X4_INTESC_RevA is
    GENERIC(
        FREQ_CLK: INTEGER:=50000000
            );
            
     PORT(
    CLK           : IN  STD_LOGIC;                           --clk FPGA
    COLUMNAS   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0); --PUERTO CONECTADO A LAS COLUMNAS DEL TECLADO
    FILAS       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --PUERTO CONECTADO A LA FILAS DEL TECLADO
    BOTON_PRES : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --PUERTO QUE INDICA LA TECLA QUE SE PRESION�
    IND          : OUT STD_LOGIC                              --BANDERA QUE INDICA CUANDO SE PRESION� UNA TECLA (S�LO DURA UN CICLO DE clk)
);

end component LIB_TECLADO_MATRICIAL_4X4_INTESC_RevA;


signal boton_pres: std_logic_vector (3 downto 0) := (others=>'0');
signal ind: std_logic := '0';
signal segm : std_logic_vector (7 downto 0) := "00000000";


begin

libreria: LIB_TECLADO_MATRICIAL_4x4_INTESC_RevA GENERIC MAP (FREQ_CLK=> 50000000)
    port map (clk, col, filas, boton_pres, ind);
	 
Proceso_Teclado: process (clk, ind, boton_pres, segm) begin
        if rising_edge (clk) then
            if ind='1' and boton_pres=x"0" then segm<="11000000";
            elsif ind='1' and boton_pres=x"1" then segm<="11111001";
            elsif ind='1' and boton_pres=x"2" then segm<="10100100";
            elsif ind='1' and boton_pres=x"3" then segm<="10110000";
            elsif ind='1' and boton_pres=x"4" then segm<="10011001";
            elsif ind='1' and boton_pres=x"5" then segm<="10010010";
            elsif ind='1' and boton_pres=x"6" then segm<="10000010";
            elsif ind='1' and boton_pres=x"7" then segm<="11111000";
            elsif ind='1' and boton_pres=x"8" then segm<="10000000";
            elsif ind='1' and boton_pres=x"9" then segm<="10011000";
            elsif ind='1' and boton_pres=x"A" then segm<="10001000";
            elsif ind='1' and boton_pres=x"B" then segm<="10000011";
            elsif ind='1' and boton_pres=x"C" then segm<="11000110";
            elsif ind='1' and boton_pres=x"D" then segm<="10100001";
            elsif ind='1' and boton_pres=x"E" then segm<="10000110";
            elsif ind='1' and boton_pres=x"F" then segm<="10001110";
            else segm<= segm;
            end if;
        end if; 
end process;

display <= '0';
segmentos<= segm;

end TecladoMatricial; 