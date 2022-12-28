

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY counter_tb IS
END ENTITY;

ARCHITECTURE tb OF counter_tb IS
 
-- (UUT)

COMPONENT counter is
	PORT(clk : IN STD_LOGIC;
             op  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	     zI  : OUT STD_LOGIC
            );
END COMPONENT;

--Inputs
SIGNAL clk_tb : STD_LOGIC := '0';
SIGNAL op_tb  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
 
 
--Outputs
SIGNAL zI_tb   : STD_LOGIC;
CONSTANT period : time := 2 ns;
 
BEGIN
 
-- (UUT)
uut: counter       
			PORT MAP (clk => clk_tb,
				   op => op_tb,
				   zI => zI_tb
				  );
			clk_tb <= NOT clk_tb after period/2;
	  	
			op_tb  <= "0000000", "0000001" AFTER 4 ns, "0000011" AFTER 25 ns, "0000010" AFTER 30 ns; --"1100011" AFTER 12 ns, "1000111" AFTER 15 ns, "0011011" AFTER 19 ns, "0010100" AFTER 22 ns, "0111000" AFTER 26 ns, "0100001" AFTER 29 ns, "0010011" AFTER 31 ns, "1111111" AFTER 35 ns, "1010101" AFTER 39 ns, "1011011" AFTER 40 ns, "1010111" AFTER 45 ns, "0111101" AFTER 50 ns;
		


		

 stop: PROCESS
 BEGIN
	WAIT FOR 60 ns; 
		ASSERT FALSE
			REPORT "Simulation ended by Group2 at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;

