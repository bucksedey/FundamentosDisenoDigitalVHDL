library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MiLibreria.ALL;

entity SumadorCompleto is
Port(
	 A,B,Ci: in STD_LOGIC;
	 SUMA,Co: out STD_LOGIC
	 );
end SumadorCompleto;

architecture Behavioral Of SumadorCompleto is
	signal suma1, suma2, acarreo1, acarreo2: STD_LOGIC;

begin
	
	MS1: MedioSumador
	  port map (
				A => A,
				B => B,
				SUMA => suma1,
				Co => acarreo1
			  );

	MS2: MedioSumador
	  port map (
				A => Ci,
				B => suma1,
				SUMA => suma2,
				Co => acarreo2
			  );
	
	SUMA <= suma2;
	Co <= acarreo1 OR acarreo2;

end Behavioral;