library ieee;
use ieee.std_logic_1164.all;


package MuxPack is
	--MUX 4 A 1--
	component Mux4a1 is
		port(
			E: in std_logic_vector (3 downto 0);
			Sel: in std_logic_vector (1 downto 0);
			Salida: out std_logic);
	end component;
	
	--MUX 2 A 1
	component Mux2a1 is
		port(
			E: in std_logic_vector (1 downto 0);
			Sel: in std_logic;
			Salida: out std_logic);
	end component;

end MuxPack;