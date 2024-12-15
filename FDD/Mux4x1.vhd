library ieee;
use ieee.std_logic_1164.all;

entity Mux4a1 is
port(
		E: in std_logic_vector (3 downto 0);
		Sel: in std_logic_vector (1 downto 0);
		Salida: out std_logic
	);
end Mux4a1;

architecture mux4 of Mux4a1 is
begin
	Salida<= E(0) when Sel = "00" else
			 E(1) when Sel = "01" else
			 E(2) when Sel = "10" else
			 E(3) when Sel = "11" ;
			 
end mux4;


