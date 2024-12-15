library ieee;
use ieee.std_logic_1164.all;

-- Declaración de la entidad 'logic' con 6 entradas (A, B, C, D, E, F) y 3 salidas (X1, X2, X3)
entity logic is port(
    A,B,C,D,E,F: in std_logic;  -- Entradas de tipo std_logic
    X1,X2,X3: out std_logic     -- Salidas de tipo std_logic
);
end logic;

-- Definición de la arquitectura booleana para la entidad 'logic'
architecture booleana of logic is 
begin
    -- X1 es la operación XNOR entre A y B
    X1 <= A XNOR B;

    -- X2 es una expresión booleana compleja con operaciones AND, OR, NAND, XNOR y XOR
    X2 <= (((C AND D) OR (A XNOR B)) NAND
          ((E XOR F) AND (C AND D)));  

    -- X3 es la operación XNOR entre E y F, seguida de una operación AND con (C AND D)
    X3 <= (E XNOR F) AND (C AND D);
end booleana;
