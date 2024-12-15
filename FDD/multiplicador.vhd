library ieee;
use ieee.std_logic_1164.all;

entity mul is
Port (a,b: in std_logic_vector(3 downto 0);
		sa1, sa2, sa3, sa4, sa5, sa6: out std_logic);
		
end mul;


architecture multi of mul is

component medio is
	port(
		a, b: in std_logic;
		Cmedi, s1: out std_logic);
end component;


component sumcomimp is
	port(
	a, b, c: in std_logic;
		scom, Cout: out std_logic);
end component;

signal ca: std_logic_vector(4 downto 0);
signal p: std_logic_vector(8 downto 0);
signal aux: std_logic_vector(3 downto 0);

--aux es el carreo de los sumadores completos--

begin

--primero salidas de and--
		
p(0) <= a(0) and b(0);
p(1) <= a(1) and b(0);
p(2) <= a(2) and b(0);

p(3) <= a(0) and b(1);
p(4) <= a(1) and b(1);
p(5) <= a(2) and b(1);

p(6) <= a(0) and b(2);
p(7) <= a(1) and b(2);
p(8) <= a(2) and b(2);

--logica suma y carreo--

c1: medio port map (p(1),p(3),sa2,ca(0));
c2: sumcomimp port map (p(2),p(4),p(6),aux(0),ca(1));
c3: medio port map (ca(0),aux(0),sa3,ca(2));
c4: sumcomimp port map (p(5),p(7),ca(1),aux(1),ca(3));
c5: medio port map (ca(2),aux(1),sa4,ca(4));
c6: sumcomimp port map (p(8),ca(3),ca(4),sa5,sa6);

--salidas de la multiplicacion o si o si--

sa1 <= p(0);



end multi;