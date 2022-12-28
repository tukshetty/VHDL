--Group2
	-- Shetty
	-- Dobariya
	-- Fan
	
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.all;


ENTITY wsm is

GENERIC(m : INTEGER := 32);

	PORT ( 	clk_w: IN  STD_LOGIC;
		qq_w : IN  STD_LOGIC_VECTOR (m-1 downto 0);
		dd_w : IN  STD_LOGIC_VECTOR (m-1 downto 0);

		rst_w: IN  STD_LOGIC;
		st_w : IN  STD_LOGIC;
		rdy_w: OUT STD_LOGIC;
		aq_w : OUT STD_LOGIC_VECTOR(((2*m)-1) DOWNTO 0);

		op_w : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		zI_w : OUT STD_LOGIC		
		
             );		
	END wsm;


ARCHITECTURE structural OF wsm IS


        COMPONENT Dpath					  		          	  
	PORT ( 	clk: IN  STD_LOGIC;								  
		qq : IN  STD_LOGIC_VECTOR (m-1 downto 0);					  
		dd : IN  STD_LOGIC_VECTOR (m-1 downto 0);					  		
		op : IN  STD_LOGIC_VECTOR (6 DOWNTO 0);						  	
		zI : OUT STD_LOGIC;								  
		aq : OUT STD_LOGIC_VECTOR(((2*m)-1) DOWNTO 0)				 
		); 										  					  	
	END COMPONENT;									  	  



COMPONENT cntu					  		          	  		    
	PORT ( clk: IN STD_LOGIC;								    
	       rst: IN STD_LOGIC;								    
	       st : IN STD_LOGIC;								    
	       zi : IN STD_LOGIC;								    
	       op : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);						    						    
	      rdy : OUT STD_LOGIC					    			    
	     );					  						    
	END COMPONENT;										    


BEGIN

U1   : cntu   	  	  PORT MAP(clk_w, rst_w, st_w, zI_w, op_w, rdy_w);
U2   : Dpath          PORT MAP(clk_w, qq_w,  dd_w, op_w, zI_w, aq_w); 	 

END ARCHITECTURE structural;

