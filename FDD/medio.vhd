library ieee;
use ieee.std_logic_1164.all;

-- Entidad 'medio' que tiene dos entradas 'a' y 'b' y dos salidas 'Cmedi' y 's1'
entity medio is
port(
    a, b: in std_logic;  -- Entradas de un solo bit
    Cmedi, s1: out std_logic  -- Salidas de un solo bit
);
end medio;

-- Arquitectura 'bhvs' que define las operaciones lógicas
architecture bhvs of medio is
begin
    Cmedi <= (a xor b);  -- La salida Cmedi es el resultado de la operación XOR entre a y b
    s1 <= (a and b);     -- La salida s1 es el resultado de la operación AND entre a y b
end bhvs;
