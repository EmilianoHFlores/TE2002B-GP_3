library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity true_ctr is
   port(w, x, y: in std_logic;
        f: out std_logic);    
end true_ctr;  

architecture Behavior of true_ctr is
begin
   process(w, x, y) begin
      f <= (w and x and y) or (y and (w xor x));            
   end process;
end Behavior;