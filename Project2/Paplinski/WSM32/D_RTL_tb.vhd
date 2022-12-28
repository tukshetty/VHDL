library ieee;use ieee.std_logic_1164.all;
entity D_RTL_tb is
end entity;
 
architecture tb of D_RTL_tb is
component D_reg
	port(DD : in std_logic_vector (31 downto 0); 
 		clk, Dop : in std_logic;
 		D : out std_logic_vector (31 downto 0)
 		); 
end component;

signal clk_tb : std_logic := '0';
signal Dop_tb  : std_logic := '0';
signal DD_tb  : std_logic_vector(31 downto 0) := x"0000_0000"; 
signal D_tb   : std_logic_vector(31 downto 0);
constant period : time := 3 ns;
begin
uut: D_reg       
	port map (clk => clk_tb,
			Dop => Dop_tb,
			DD => DD_tb,
			D => D_tb
			);
			clk_tb <= not clk_tb after period/2;
			Dop_tb <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns;
			DD_tb <= x"0000_0000", x"2222_1545" after 10 ns, x"ffff_4242" after 20 ns, x"5555_9999" after 30 ns, x"c21a_1102" after 40 ns, x"d550_1020" after 50 ns;
stop: process
begin
	wait for 60 ns; 
		assert false
			report "simulation ended by Dobariya at" & time'image(now)
		severity failure;
	end process;
end tb;











