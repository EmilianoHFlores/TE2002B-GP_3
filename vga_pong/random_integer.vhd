LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY random_integer IS 
    GENERIC (
        min : INTEGER := 0;
        max : INTEGER := 100;
		seed : INTEGER := 1
    );
    PORT (clk : IN STD_LOGIC;
          rand : OUT INTEGER
    );
END random_integer;

ARCHITECTURE arch OF random_integer IS

SIGNAL random_counter : INTEGER := min;

begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			rand <= random_counter;
			
			IF (random_counter >= max) THEN
				random_counter <= min;
			ELSE
				random_counter <= random_counter + 1*seed;
			END IF;
		end if;
	end process;
END arch;