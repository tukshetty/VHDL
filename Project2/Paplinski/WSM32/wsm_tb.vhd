--Group2
	-- Shetty
	-- Dobariya
	-- Fan

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.all;

ENTITY wsm_tb IS
END ENTITY;

ARCHITECTURE tb OF wsm_tb IS
 
-- (UUT)
 
COMPONENT wsm
	PORT ( 	clk_w: IN  STD_LOGIC;
		qq_w : IN  STD_LOGIC_VECTOR (31 downto 0);
		dd_w : IN  STD_LOGIC_VECTOR (31 downto 0);

		rst_w: IN  STD_LOGIC;
		st_w : IN  STD_LOGIC;
		rdy_w: OUT STD_LOGIC;
		aq_w : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);

		op_w : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		zI_w : OUT STD_LOGIC
	
             );
END COMPONENT;
 
--Inputs
SIGNAL clk_w_tb : STD_LOGIC := '0';
SIGNAL qq_w_tb  : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"0000_0000";
SIGNAL dd_w_tb  : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"0000_0000";

SIGNAL rst_w_tb : STD_LOGIC;
SIGNAL st_w_tb  : STD_LOGIC;
SIGNAL rdy_w_tb : STD_LOGIC;
SIGNAL aq_w_tb  : STD_LOGIC_VECTOR(63 DOWNTO 0) ;

SIGNAL op_w_tb  : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL zI_w_tb  : STD_LOGIC;

 
--Outputs


CONSTANT period : time := 2 ns;
 
BEGIN
 
--(UUT)
uut: wsm       
			PORT MAP (clk_w => clk_w_tb,
				   qq_w => qq_w_tb,
				   dd_w => dd_w_tb,
				   
				  rst_w => rst_w_tb,
				   st_w => st_w_tb,
				  rdy_w => rdy_w_tb,
				   aq_w => aq_w_tb,

				   op_w => op_w_tb,
				   zI_w => zI_w_tb
				 
				  );

			clk_w_tb <= NOT clk_w_tb after period/2;
	  	
			qq_w_tb <= x"6980_11A5", x"1198_8C1A" AFTER 30 ns, x"2ABC_A000" AFTER 50 ns; 
			dd_w_tb <= x"5311_AB12", x"0201_1A10" AFTER 28 ns, x"4000_1000" AFTER 40 ns; 
			rst_w_tb <= '0', '1' AFTER 2 ns; 
			st_w_tb  <= '0', '1' AFTER 4 ns, '0' AFTER 40 ns;
 stop: PROCESS
 BEGIN
	WAIT FOR 100 ns;
		ASSERT FALSE
			REPORT "Simulation ended by Group2 at" & time'image(now)
		SEVERITY FAILURE;
	END PROCESS;
END tb;

