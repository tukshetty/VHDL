library ieee; use ieee.std_logic_1164.all; 

entity D_reg is
	generic(m : positive := 32);
	port
 	(DD : in std_logic_vector (m-1 downto 0); 
 	clk, Dop : in std_logic;
 	D : out std_logic_vector (m-1 downto 0)
 	); 
end entity;

architecture RTL of D_reg is
signal temp : std_logic_vector(m-1 downto 0);
begin
process (clk, Dop) begin
	if (Dop = '0') then 
	temp <= temp;
	elsif (Dop = '1') then
    temp <= DD;
    end if;
end process;
	D <= temp;
end RTL;
