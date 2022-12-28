library IEEE; use IEEE.std_logic_1164.all;


entity AND2 IS
 port( I0, I1: in STD_LOGIC;
 O: out STD_LOGIC );
end AND2;

architecture struc1 of AND2 is
begin
	O <= I0 and I1;
end struc1;

---------------------------------------------------
library IEEE; use IEEE.std_logic_1164.all;
entity XOR3 is
 port( I0, I1, I2: in STD_LOGIC;
 O: out STD_LOGIC );
end XOR3;

architecture struc2 of XOR3 is
begin
	O <= I0 XOR I1 XOR I2;
end struc2;

------------------------------------------------------------
library IEEE; use IEEE.std_logic_1164.all;
entity MAJ is -- Majority function, O = I0*I1 + I0*I2 + I1*I2
 port( I0, I1, I2: in STD_LOGIC;
 O: out STD_LOGIC );
end MAJ;

architecture struc3 of MAJ is
begin
	O <= (I0 and I1) or (I0 and I2) or (I1 and I2);
end struc3;



