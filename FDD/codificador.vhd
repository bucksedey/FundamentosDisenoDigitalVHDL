library ieee;
use ieee.std_logic_1164.all;

-- Declaración de la entidad 'codificador00' con una entrada de 8 bits (X) y una salida de 3 bits (S)
entity codificador00 is
port(
    X: in std_logic_vector (7 downto 0);  -- Entrada de 8 bits
    S: out std_logic_vector (2 downto 0)  -- Salida de 3 bits
);
end codificador00;

-- Descripción de la arquitectura 'codificar' del codificador
architecture codificar of codificador00 is
begin
    -- Asignación de la salida S según el valor de X utilizando una serie de comparaciones
    S <= "000" when X = "00000001" else -- 0
         "001" when X = "00000010" else -- 1
         "010" when X = "00000100" else -- 2
         "011" when X = "00001000" else -- 3
         "100" when X = "00010000" else -- 4
         "101" when X = "00100000" else -- 5
         "110" when X = "01000000" else -- 6
         "111" when X = "10000000" else -- 7
         "000";  -- Si X no coincide con ninguna de las condiciones, asigna "000" como valor por defecto
end codificar;
