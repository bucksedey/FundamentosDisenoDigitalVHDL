library ieee;
use ieee.std_logic_1164.all;

entity Mux2a1 is
port(
		E: in std_logic_vector (1 downto 0);
		Sel: in std_logic;
		Salida: out std_logic
	);
end Mux2a1;

architecture mux2 of Mux2a1 is
begin
	Salida<= E(0) when Sel = '0' else
			 E(1) when Sel = '1'  ;
			 
end mux2;


