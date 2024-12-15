library ieee;
use ieee.std_logic_1164.all;

entity sumcomimp is 
port(
	a, b, c: in std_logic;
		scom, Cout: out std_logic);
end sumcomimp;

architecture sumadr of sumcomimp is

signal auxiliar, msAux, and0, c1: std_logic:='0';
begin

auxiliar <= (a xor b);
and0 <= (a and b);
scom <= (auxiliar xor c);
msAux <= (c and auxiliar);
Cout <= (and0 or msAux);


end sumadr;