library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ejercicio2 is
   port (clk, rst: in std_logic;
         cnt: in std_logic;
         C: out std_logic_vector(2 downto 0);
         tc: out std_logic);
end ejercicio2;

architecture Structure of ejercicio2 is
   component Reg4
      port (clk, rst: in std_logic;
            ld: in std_logic;            
            I: in std_logic_vector(2 downto 0);
            Q: out std_logic_vector(2 downto 0));
   end component;

   component Inc3
      port (a: in std_logic_vector(2 downto 0);
            s: out std_logic_vector(2 downto 0));
   end component;

   component true_ctr
      port (w, x, y: in std_logic;
            F: out std_logic);
   end component;

   signal tempC: std_logic_vector(2 downto 0);
   signal incC: std_logic_vector(2 downto 0);

begin
   
	Register3: Reg4 port map(clk, rst, cnt, incC, tempC);
	incrementer: Inc3 port map( tempC, incC);
	truegate: true_ctr port map( tempC(2),tempC(1), tempC(0), tc);
	
   process(tempC)
   begin
      C <= tempC;
   end process;
end Structure;