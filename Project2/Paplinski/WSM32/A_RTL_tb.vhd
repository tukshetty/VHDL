library ieee;use ieee.std_logic_1164.all;
entity A_RTL_tb is
end entity;
 
architecture tb of A_RTL_tb is
 
component A_reg
	port(clk : in std_logic;
         op  : in std_logic_vector(6 downto 0);
	     F  : in std_logic_vector(31 downto 0); 
         A : out std_logic_vector(31 downto 0)
    );
end component;

signal clk_tb : std_logic := '0';
signal op_tb  : std_logic_vector(6 downto 0) := "0000000";
signal F_tb   : std_logic_vector(31 downto 0) := x"0000_0000"; 
signal A_tb   : std_logic_vector(31 downto 0);
constant period : time := 3 ns;
begin
uut: A_reg      
	port map (clk => clk_tb,
			op => op_tb,
			F => F_tb,
		    A => A_tb
		  );
			clk_tb <= not clk_tb after period/2;
	  		op_tb <= "0000000", "1111111" after 10 ns, "1010111" after 20 ns, "1000100" after 30 ns, "1010101" after 40 ns, "0000011" after 50 ns;
			F_tb <= x"0000_0000", x"2222_1545" after 10 ns, x"ffff_4242" after 20 ns, x"5555_9999" after 30 ns, x"c21a_1102" after 40 ns, x"d550_1020" after 50 ns;
		
stop: process
begin
	wait for 60 ns; 
		assert false
			report "simulation ended by Dobariya at" & time'image(now)
		severity failure;
	end process;
end tb;

