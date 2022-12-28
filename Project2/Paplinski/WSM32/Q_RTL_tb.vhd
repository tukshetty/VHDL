library ieee;use ieee.std_logic_1164.all;
entity Q_RTL_tb is
end entity;
 
architecture tb of Q_RTL_tb is
component Q_reg
	port(clk : in std_logic;
         op  : in std_logic_vector(6 downto 0);
	     QQ  : in std_logic_vector(31 downto 0); 
         F0  : in std_logic;
	     Q_1 : in std_logic := '0';
	     Qn_1: out std_logic_vector(32 downto 0);
	     Q0_1: out std_logic_vector(1 downto 0)
         );
end component;

signal clk_tb : std_logic := '0';
signal op_tb  : std_logic_vector(6 downto 0) := "0000000";
signal QQ_tb  : std_logic_vector(31 downto 0) := x"0000_0000"; 
signal F0_tb  : std_logic := '0';
signal Q_1_tb : std_logic := '0'; 
signal Qn_1_tb  : std_logic_vector(32 downto 0);
signal Q0_1_tb: std_logic_vector(1 downto 0);
constant period : time := 3 ns;
begin
uut: Q_reg       
	port map (clk => clk_tb,
			op  => op_tb,
			QQ  => QQ_tb,
			F0  => F0_tb,
			Q_1 => Q_1_tb,
			Q0_1=> Q0_1_tb,
			Qn_1=> Qn_1_tb
			);
			clk_tb <= not clk_tb after period/2;
 			op_tb <= "0000000", "1111111" after 5 ns, "1010111" after 8 ns, "1000100" after 10 ns, "1010101" after 12 ns, "0000011" after 18 ns, "1001110" after 22 ns;
			QQ_tb <= "00000000", "10100001" after 5 ns, "10110101" after 10 ns, "10110010" after 15 ns, "11111111" after 20 ns, "10101010" after 25 ns;
			F0_tb  <= '0', '1' after 8 ns, '0' after 12 ns,'1' after 16 ns, '0' after 20 ns, '1' after 25 ns;  
			Q_1_tb <= '0', '0' after 6 ns;
stop: process
begin
	wait for 60 ns; 
		assert false
			report "simulation ended by Dobariya at" & time'image(now)
		severity failure;
	end process;
end tb;

