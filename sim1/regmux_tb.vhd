
library ieee; use ieee.std_logic_1164.all;
entity RegMux_tb is 
end entity;
architecture testbench of RegMux_tb is

	component RegMux is
	port
	( a, b, c, d: in std_logic_vector (3 downto 0); 
	  sel : in std_logic_vector (1 downto 0); 
	  clk: in std_logic;
	  x, y : out std_logic_vector (3 downto 0)
	);
end component;

	signal a_tb : std_logic_vector (3 downto 0) := "0010";
	signal b_tb : std_logic_vector (3 downto 0) := "0100";
	signal c_tb : std_logic_vector (3 downto 0) := "0110"; 
	signal d_tb : std_logic_vector (3 downto 0) := "1000"; 
	signal sel_tb : std_logic_vector (1 downto 0) := "00";
	signal clk_tb : std_logic := '0';
	signal x_tb : std_logic_vector (3 downto 0); 
	signal y_tb : std_logic_vector (3 downto 0);
begin
	dut : RegMux port map
	(a => a_tb,
     	 b => b_tb, 
	 c => c_tb, 
	 d => d_tb, 
	 clk => clk_tb,
	 sel => sel_tb, 
	 x => x_tb, 
	 y => y_tb
     );

	clk_tb <= not clk_tb after 50 ns;
	a_tb <= "0011" after 100 ns, "0000" after 700 ns; 
	b_tb <= "0101" after 300 ns;
	c_tb <= "0111" after 500 ns; 
	d_tb <= "1001" after 700 ns; 
	sel_tb <= "01" after 200 ns, "10" after 400 ns,
	   "11" after 600 ns, "00" after 800 ns;
end architecture;
