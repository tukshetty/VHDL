library ieee;use ieee.std_logic_1164.all;
entity Q_reg is
    generic(n : positive := 32);
    
	port(clk : in std_logic;
         op  : in std_logic_vector(6 downto 0);
	     QQ  : in std_logic_vector(n-1 downto 0); 
         F0  : in std_logic;
	     Q_1 : in std_logic := '0';
	     Qn_1: out std_logic_vector(n downto 0);
	     Q0_1: out std_logic_vector(1 downto 0)
         );
end entity;

architecture RTL of Q_reg is
signal Qop : std_logic_vector(1 downto 0);
signal temp : std_logic_vector(n downto 0);
begin
	Qop <= op(3 DOWNTO 2);
	process(clk,Qop)
	begin
		if (clk 'event and clk = '1') then
			if (Qop = "00" ) then 
			temp <= temp;				
			elsif (Qop = "01" ) then 
			temp <= F0 & temp(n downto 1);  
			elsif(Qop = "10" or Qop = "11" ) then 
			temp <= QQ & Q_1; 		
			end if;
		end if;
	end process;
	Q0_1 <= temp(1 downto 0);
	Qn_1 <= temp;
end architecture;

