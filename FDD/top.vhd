library ieee;
use ieee.std_logic_1164.all;

entity tope is 
port(
	a , b: in std_logic_vector(3 downto 0);
		x: in std_logic;
		band: out std_logic;
		sa: out std_logic_vector(3 downto 0));
		
end tope;

architecture sumado of tope is

component medio is
	port(
		a, b: in std_logic;
		Cmedi, s1: out std_logic);
end component;


component sumcomimp is
	port(
	a, b, c: in std_logic;
		ccom, Cout: out std_logic);
end component;
signal ca: std_logic_vector(3 downto 0);
signal comp: std_logic_vector(3 downto 0);
signal s: std_logic_vector(3 downto 0);
signal SX,led: std_logic;


begin

comp(0) <= b(0) xor x;
comp(1) <= b(1) xor x;
comp(2) <= b(2) xor x;
comp(3) <= b(3) xor x;


c1: sumcomimp port map (a(0) , comp(0), x, s(0), ca(0));
c2: sumcomimp port map (a(1) , comp(1), ca(0), s(1), ca(1));
c3: sumcomimp port map (a(2) , comp(2), ca(1), s(2), ca(2));
c4: sumcomimp port map (a(3) , comp(3), ca(2), s(3), ca(3));

led <= ca(3) xor ca(2);

band <= led;

SX <= not led;

sa(0) <= s(0) and SX;
sa(1) <= s(1) and SX;
sa(2) <= s(2) and SX;
sa(3) <= s(3) and SX;

end sumado;