-- cntu the control unit -- by app
library IEEE ;
use IEEE.std_logic_1164.all ;

ENTITY cntu IS -- the control unit by app
	PORT ( rst, clk, st, zi : IN STD_LOGIC ;
		op : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) ;
		rdy : OUT STD_LOGIC
	) ;
END cntu ;

ARCHITECTURE behv OF cntu IS
-- TYPE states IS ( SI, SM, SF ) ;
-- SIGNAL stt, nxtSt : states := SI ;
SIGNAL stt, nxtSt : STD_LOGIC_VECTOR(1 DOWNTO 0) ;
-- we can use a "hard" encoding of states
CONSTANT SI : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00" ;
CONSTANT SM : STD_LOGIC_VECTOR(1 DOWNTO 0) := "01" ;
CONSTANT SF : STD_LOGIC_VECTOR(1 DOWNTO 0) := "10" ;
-- Internal op-code signals and related constants
SIGNAL Aop, Qop, Sop : STD_LOGIC_VECTOR(1 DOWNTO 0) ;
SIGNAL Dop : STD_LOGIC ;
CONSTANT ldD : STD_LOGIC := '1' ;
CONSTANT nopD : STD_LOGIC := '0';
CONSTANT nop : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00" ;
CONSTANT ldAshr,shrQ,cnt : STD_LOGIC_VECTOR(1 DOWNTO 0) := "01" ;
CONSTANT reset, load : STD_LOGIC_VECTOR(1 DOWNTO 0) := "10" ;

BEGIN
-- to synthesize edge-triggered flip-flops
-- with asynchronous reset when rst = 0
	PROCESS ( clk, rst)
	BEGIN
	IF (rst = '0') THEN
		stt <= SI ;
	ELSIF ( clk 'event AND (clk'LAST_VALUE = '0') AND (clk = '1') ) THEN
		stt <= nxtSt ;
	END IF ;
	END PROCESS;
-- the state process describes the transitions between states
-- and the output signals
	PROCESS ( stt, st, zi )
	BEGIN
-- default assignments
	nxtSt <= stt ;
	Dop <= nopD ;
	Aop <= nop ;
	Qop <= nop ;
	Sop <= nop ;
	rdy <= '0' ;
-- state transitions and output signals
	CASE stt IS 
	WHEN SI =>
		rdy <= '0' ;
		Dop <= ldD ;
		Aop <= reset ;
		Qop <= load ;
		Sop <= reset ;
		IF ( st = '1' ) THEN 
			nxtSt <= SM ; 
		END IF ;
	WHEN SM =>
		Aop <= ldAshr ;
		Qop <= shrQ ;
		Sop <= cnt ;
		IF ( zi = '1' ) THEN 
			nxtSt <= SF ;
		END IF ;
	WHEN OTHERS => --- when SF
		rdy <= '1' ;
		IF ( st = '0' ) THEN 
			nxtSt <= SI ; 
		END IF ;
	END CASE ;
	END PROCESS;
op(6) <= Dop ;
op(5 DOWNTO 4) <= Aop ;
op(3 DOWNTO 2) <= Qop ;
op(1 DOWNTO 0) <= Sop ;
END ARCHITECTURE;
