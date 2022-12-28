library ieee;use ieee.std_logic_1164.all;
entity A_reg is
    generic(m : integer := 32);
    
	port(clk : in std_logic;
         op  : in std_logic_vector(6 downto 0);
	     F  : in std_logic_vector(m-1 downto 0); 
         A : out std_logic_vector(m-1 downto 0)
    );
end entity;

architecture RTL of A_reg is
signal Aop : std_logic_vector(1 downto 0);
signal temp : std_logic_vector(m-1 downto 0);
begin
	Aop <= op(5 downto 4);
	process(clk,Aop)
		begin 
			if(clk'event and clk = '1') then
				if (Aop = "00" ) then 			
				 	 temp <= temp;							
				elsif (Aop = "01" ) then		
					 temp <= F(m-1) & F(m-1 downto 1);
				elsif (Aop = "10" or Aop = "11" ) then
					 temp <= (others => '0');			       
				end if;
			end if;
	end process;
	A <= temp;
end architecture;


