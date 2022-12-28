
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.all;

ENTITY Dpath_tb IS
END ENTITY;

ARCHITECTURE tb OF Dpath_tb IS
 
--(UUT)

COMPONENT Dpath
	PORT ( 	clk: IN  STD_LOGIC;
		qq : IN  STD_LOGIC_VECTOR (7 downto 0);
		dd : IN  STD_LOGIC_VECTOR (7 downto 0);
		op : IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
		zI : OUT STD_LOGIC;
		aq : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
END COMPONENT;

--Inputs
SIGNAL clk_tb : STD_LOGIC := '0';
SIGNAL qq_tb  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
SIGNAL dd_tb  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
SIGNAL op_tb  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";

 
--Outputs
SIGNAL zI_tb  : STD_LOGIC;
SIGNAL aq_tb  : STD_LOGIC_VECTOR(15 DOWNTO 0);


CONSTANT period : time := 100 ns;

BEGIN
 

uut: Dpath      
			PORT MAP (clk => clk_tb,
				   qq => qq_tb,
				   dd => dd_tb,
				   op => op_tb,
				   zI => zI_tb,
				   aq => aq_tb

				  );

			clk_tb <= NOT clk_tb after period/2;
	  	
			qq_tb <= x"89", x"00" AFTER 700 ns; 
		
			dd_tb <= x"43", x"00" AFTER 500 ns; 
			
			op_tb <= "1111110", "0011101" AFTER 250 ns, "0010001" AFTER 1050 ns, "1100001" AFTER 1350 ns; 

		

 stop: PROCESS
 BEGIN
	WAIT FOR 1600 ns; 
		ASSERT FALSE
			REPORT "Simulation ended by Group2 at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;

