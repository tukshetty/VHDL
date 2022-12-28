

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

ENTITY ALU_tb IS
END ENTITY;
 
ARCHITECTURE tb OF ALU_tb IS
 
--(UUT)

COMPONENT ALU
	PORT(A  : IN SIGNED(7 DOWNTO 0);
	     B  : IN SIGNED(7 DOWNTO 0); 
             op : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	     F  : OUT SIGNED(7 DOWNTO 0)
             );
END COMPONENT;

--Inputs
SIGNAL A_tb   : SIGNED(7 DOWNTO 0) := "00000000";
SIGNAL B_tb   : SIGNED(7 DOWNTO 0) := "00000000";
SIGNAL op_tb  : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
 
 
--Outputs
SIGNAL F_tb   : SIGNED(7 DOWNTO 0);

 
BEGIN
 
-- (UUT)
uut: ALU       
			PORT MAP ( A  => A_tb,
				   B  => B_tb,
				   op => op_tb,
				   F => F_tb
				  );
			
	  	        A_tb   <= "00000000", "11110011" AFTER 4 ns, "01010101" AFTER 8 ns, "10100101" AFTER 12 ns, "01100111" AFTER 20 ns, "10011101" AFTER 25 ns;
			B_tb   <= "00000000", "11010111" AFTER 4 ns, "11110001" AFTER 8 ns, "01001001" AFTER 12 ns, "01101011" AFTER 20 ns, "10000001" AFTER 25 ns;
			op_tb  <= "00", "11" AFTER 4 ns, "01" AFTER 8 ns, "10" AFTER 12 ns, "11" AFTER 20 ns, "01" AFTER 25 ns; 
		


		

 stop: PROCESS
 BEGIN
	WAIT FOR 40 ns; 
		ASSERT FALSE
			REPORT "Simulation ended by Group2 at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;

