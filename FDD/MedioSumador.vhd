library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entidad 'MedioSumador' que tiene dos entradas 'A' y 'B', y dos salidas 'SUMA' y 'Co'
entity MedioSumador is
    Port(
        A, B: in std_logic;  -- Entradas de un solo bit
        SUMA, Co: out std_logic  -- Salidas de un solo bit (Suma y Carry)
    );            
end MedioSumador;

-- Arquitectura 'aMedioSumador' que define las operaciones del sumador
architecture aMedioSumador of MedioSumador is
begin
    SUMA <= A XOR B;
    Co <= A AND B;  
end aMedioSumador;
