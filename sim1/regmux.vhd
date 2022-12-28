library ieee; use ieee.std_logic_1164. all;
entity RegMux is 
	port
	( a,b,c,d : in std_logic_vector (3 downto 0);
	  sel : in std_logic_vector (1 downto 0);
	  clk : in std_logic;
	  y : out std_logic_vector (3 downto 0);
	  x : out std_logic_vector (3 downto 0)
	);
end entity;

architecture beh of RegMux is
begin
	x <= a when sel = "00" else
	     b when sel = "01" else
	     c when sel = "10" else
	     d;
process (clk)
begin 
	if rising_edge (clk) then
	case sel is
		when "00" => y <= a;
		when "01" => y <= b;
		when "10" => y <= c;
		when others => y <= d;
	end case;
	end if;
end process;
end architecture beh;

--architecture seq of reg_mux is	
--begin	
--process (clk)
--begin 
--	if rising_edge (clk) then
--		y <= x;
--	end if;
--end process;
--end architecture seq;
