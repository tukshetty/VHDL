
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.all;


ENTITY Dpath is

GENERIC(m : INTEGER := 32);
--GENERIC(n : INTEGER := 8);

	PORT ( 	clk: IN  STD_LOGIC;
		qq : IN  STD_LOGIC_VECTOR (m-1 downto 0);
		dd : IN  STD_LOGIC_VECTOR (m-1 downto 0);
		op : IN  STD_LOGIC_VECTOR (6 DOWNTO 0);
		zI : OUT STD_LOGIC;
		aq : OUT STD_LOGIC_VECTOR(((2*m)-1) DOWNTO 0)
	     );		
	END Dpath;


ARCHITECTURE structural OF Dpath IS

	
    COMPONENT D_reg	is			  		         
	  port
 	(DD : in std_logic_vector (m-1 downto 0); 
 	clk, Dop : in std_logic;
 	D : out std_logic_vector (m-1 downto 0)
 	);									  	 
	END COMPONENT;									  	 



	COMPONENT A_reg	is							 
	  port(clk : in std_logic;
         op  : in std_logic_vector(6 downto 0);
	     F  : in std_logic_vector(m-1 downto 0); 
         A : out std_logic_vector(m-1 downto 0)
    );									  	 
	END COMPONENT;									  	

	COMPONENT Q_reg is							  	 
	  port(clk : in std_logic;
         op  : in std_logic_vector(6 downto 0);
	     QQ  : in std_logic_vector(m-1 downto 0); 
         F0  : in std_logic;
	     Q_1 : in std_logic := '0';
	     Qn_1: out std_logic_vector(m downto 0);
	     Q0_1: out std_logic_vector(1 downto 0)
         );							  	 
	END COMPONENT;									  	 


	COMPONENT ALU is							       
	PORT(A  : IN  SIGNED(m-1 DOWNTO 0);
	     B  : IN  SIGNED(m-1 DOWNTO 0); 
             op : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	     F  : OUT SIGNED(m-1 DOWNTO 0)
            );
	END COMPONENT;									       




	COMPONENT counter is							  
	PORT(clk : IN STD_LOGIC;							  
             op  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);					  
	     zI  : OUT STD_LOGIC			  				  
            );										  
	END COMPONENT;									 


SIGNAL   D_s  : STD_LOGIC_VECTOR(m-1 DOWNTO 0):= x"0000_0000";
SIGNAL   A_s  : STD_LOGIC_VECTOR(m-1 DOWNTO 0):= x"0000_0000";
SIGNAL   Q_s  : STD_LOGIC_VECTOR(m DOWNTO 0) := ('0' & x"0000_0000");
CONSTANT q_1_s: STD_LOGIC:= '0';
SIGNAL  q0_1_s: STD_LOGIC_VECTOR(1 DOWNTO 0):= "00";
SIGNAL   F_s  : SIGNED(m-1 DOWNTO 0):= x"0000_0000"; 
SIGNAL   zI_s : STD_LOGIC:= '0';

BEGIN



 U1   : D_reg      PORT MAP(clk => clk, Dop => op(6), DD => dd ,D => D_s ); 	
		         	
 U2   : Q_reg      PORT MAP(clk => clk, op => op, QQ => qq, F0 => F_s(0), Q_1 => q_1_s, Qn_1 => Q_s, Q0_1 => q0_1_s);

 U3   : A_reg      PORT MAP(clk => clk, op => op , F => STD_LOGIC_VECTOR(F_s), A => A_s);

 U4   : ALU        PORT MAP(A => SIGNED(A_s), B => SIGNED(D_s), op => q0_1_s, F => F_s);	

 U5   : counter    PORT MAP(clk => clk, op => op, zI => zI_s);


aq <= A_s & Q_s(m DOWNTO 1);
  
zI <= zI_s;

END ARCHITECTURE structural;


