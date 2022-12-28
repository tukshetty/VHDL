
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;


ENTITY counter IS
    GENERIC(n : INTEGER := 32);
    
	PORT(clk : IN STD_LOGIC;
             op  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	     zI  : OUT STD_LOGIC
	      
            );
END ENTITY;

ARCHITECTURE behavioral of counter IS

SIGNAL Sop : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
	Sop <= op(1 DOWNTO 0);

	PROCESS(clk)
	VARIABLE Sc : INTEGER := 0;

	BEGIN
	 
		IF (clk 'event AND clk = '1') THEN
			IF 	(Sop = "00" ) THEN 
				Sc := Sc;  
				zI <= '0';

			ELSIF 	(Sop = "01" ) THEN 
				Sc := Sc + 1;
				
				IF (Sc = (n-1)) THEN
					zI <= '1';
				ELSE 
					zI <= '0';
				END IF;

			ELSIF	(Sop = "10" OR Sop = "11" ) THEN
				Sc := 0;
				zI <= '0';
			END IF;
		
		END IF;


	END PROCESS;

END ARCHITECTURE;


