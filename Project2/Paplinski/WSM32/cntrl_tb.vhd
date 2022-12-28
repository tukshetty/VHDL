library ieee;use ieee.std_logic_1164.all;
entity cntu_tb is
end entity;
 
architecture tb of cntu_tb is
component cntu is 
	PORT ( rst, clk, st, zi : IN STD_LOGIC ;
op : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) ;
-- stt : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) ;
rdy : OUT STD_LOGIC
) ;
end component;

signal clk_tb : std_logic := '0';
signal rst_tb : std_logic := '0';
signal st_tb : std_logic := '0';
signal zi_tb : std_logic := '0';
signal op_tb : STD_LOGIC_VECTOR(6 DOWNTO 0) ;
signal rdy_tb : std_logic ;
SIGNAL Aop, Qop, Sop : STD_LOGIC_VECTOR(1 DOWNTO 0) ;
SIGNAL Dop : STD_LOGIC ;

constant period : time := 2 ns;
begin
uut: cntu      
	port map (clk => clk_tb, rst => rst_tb, st => st_tb, zi => zi_tb, op => op_tb, rdy => rdy_tb);
	
	clk_tb <= not clk_tb after period/2;
	rst_tb <= '0' , '1' after 3 ns;
	st_tb <= '1' , '0' after 4 ns, '1' after 15 ns;
	zi_tb <= '1' , '0' after 15 ns;
	Dop <= op_tb(6);
	Aop <= op_tb(5 DOWNTO 4);
	Qop <= op_tb(3 DOWNTO 2);
	Sop <= op_tb(1 DOWNTO 0);
stop: process
begin
	wait for 60 ns; 
		assert false
			report "simulation ended by Shetty at" & time'image(now)
		severity failure;
	end process;
end tb;

