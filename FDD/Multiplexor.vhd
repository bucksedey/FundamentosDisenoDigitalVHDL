library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY mux4a1 is
	PORT ( A1:  IN  std_logic;
		   A2:  IN  std_logic;
		   A3:  IN  std_logic;
		   A4:  IN  std_logic;
		   S0,S1:  IN  std_logic;
		   SALIDA: OUT std_logic);
END mux4a1;

ARCHITECTURE master OF mux4a1 IS
BEGIN
	PROCESS(A1,A2,A3,A4)
	BEGIN
		IF(S0='0' AND S1='0')THEN
			SALIDA <= A1;
		 ELSIF(S0='0' AND S1='1')THEN
			SALIDA <= A2;
		 ELSIF(S0='1' AND S1='0')THEN
			SALIDA <= A3;
		 ELSIF(S0='1' AND S1='1')THEN                                                
			SALIDA <= A4;
	 	END IF;
	END PROCESS;
END master;