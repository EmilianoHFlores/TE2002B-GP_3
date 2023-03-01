library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_ejercicio1 is
end tb_ejercicio1;

architecture Behavior of tb_ejercicio1 is
  -- Component declaration ...

 component ejercicio1 is
	port (clk, clr: in STD_LOGIC;
			a,b: in STD_LOGIC;
			z: out STD_LOGIC
			);
END component;
  
  
  constant CLK_PERIOD : time := 1000 ns;

  signal clk_tb, rst_tb, a_tb, b_tb, z_tb : std_logic;

begin
  tb_ejercicio1 : ejercicio1
                       port map (clk_tb, rst_tb, a_tb, b_tb, z_tb);

  -- Generate clock
  process begin
     clk_tb <= '0';
     wait for CLK_PERIOD/2;
     clk_tb <= '1';
     wait for CLK_PERIOD/2;
  end process;

  process begin
     rst_tb <= '1';
	  a_tb <= '0';
	  b_tb <= '0';
	  wait for CLK_PERIOD;
	  rst_tb <= '0';
     a_tb <= '1';
	  b_tb <= '1';
     wait for CLK_PERIOD;
     a_tb <= '0';
	  b_tb <= '1';
     wait for CLK_PERIOD;
     a_tb <= '0';
	  b_tb <= '1';
     wait for CLK_PERIOD;
     a_tb <= '0';
	  b_tb <= '1';
	  wait for CLK_PERIOD;
     a_tb <= '1';
	  b_tb <= '1';
	  wait for CLK_PERIOD;
  end process;   
end Behavior;