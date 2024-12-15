library ieee;
use ieee.std_logic_1164.all;

-- Declaración de la entidad 'decodificador00' con una entrada de 3 bits (X) y una salida de 8 bits (S)
entity decodificador00 is
port(
    X: in std_logic_vector (2 downto 0);  -- Entrada de 3 bits
    S: out std_logic_vector (7 downto 0)  -- Salida de 8 bits
);
end decodificador00;

-- Descripción de la arquitectura 'decodificar' del decodificador
architecture decodificar of decodificador00 is
begin
    -- Asignación de la salida S según el valor de X utilizando una serie de comparaciones
    S <= "00000001" when X = "000" else -- 0
         "00000010" when X = "001" else -- 1
         "00000100" when X = "010" else -- 2
         "00001000" when X = "011" else -- 3
         "00010000" when X = "100" else -- 4
         "00100000" when X = "101" else -- 5
         "01000000" when X = "110" else -- 6
         "10000000" when X = "111" else -- 7
         "00000000";  -- Si X no coincide con ninguna de las condiciones, asigna "00000000" por defecto
end decodificar;
