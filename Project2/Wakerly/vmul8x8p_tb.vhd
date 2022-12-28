library ieee; use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
entity vmulp_tb is
end;

architecture tb of vmulp_tb is
component vmul8x8p is
	port ( X: in STD_LOGIC_VECTOR (7 downto 0);
 Y: in STD_LOGIC_VECTOR (7 downto 0);
 P: out STD_LOGIC_VECTOR (15 downto 0) );
end component;

--component vmul8x8s is
--	port ( X: in STD_LOGIC_VECTOR (7 downto 0);
 --Y: in STD_LOGIC_VECTOR (7 downto 0);
-- P: out STD_LOGIC_VECTOR (15 downto 0) );
--end component;

--component vmul8x8i is
--	port (
-- X: in UNSIGNED (7 downto 0);
-- Y: in UNSIGNED (7 downto 0);
-- P: out UNSIGNED (15 downto 0)
-- );
--end component;
			
	signal X: std_logic_vector(7 downto 0) := "00000000";
	signal Y: std_logic_vector(7 downto 0) := "00000000";
	signal pP: std_logic_vector(15 downto 0);
	--signal sP: std_logic_vector(15 downto 0);
	--signal A : UNSIGNED (7 downto 0) := "00000000";
	--signal B : UNSIGNED (7 downto 0) := "00000000";
	--signal iP: UNSIGNED(15 downto 0);
	begin
	uut1 : vmul8x8p 
		port map (X => X, Y => Y, P => pP);

--	uut2 : vmul8x8s 
--		port map (X => X, Y => Y, P => sP);

--	uut3 : vmul8x8i 
--		port map (X => A, Y => B, P => iP);

		--A <= not A after 2 ns;
		X <= "01010011", "10100011" after 5 ns, "10101101" after 8 ns, "01010001" after 12 ns;
		Y <= "00011001", "01010101" after 8 ns, "11111111" after 10 ns, "10111000" after 14 ns;
--		A <= "01010011", "10100011" after 5 ns;
--		B <= "00011001", "01010101" after 8 ns;
		
		timeBomb : process
		begin
			wait for 40 ns;
			assert false
				report "Simulation ended by Shetty at " & time'image(now)
				severity failure;
		end process;
end architecture tb;
