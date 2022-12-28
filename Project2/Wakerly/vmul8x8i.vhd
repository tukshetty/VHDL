library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
entity vmul8x8i is
 port (
 X: in UNSIGNED (7 downto 0);
 Y: in UNSIGNED (7 downto 0);
 P: out UNSIGNED (15 downto 0)
 );
end vmul8x8i;
architecture vmul8x8i_arch of vmul8x8i is
begin
 P <= X * Y;
end vmul8x8i_arch;
