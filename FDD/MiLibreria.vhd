library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaración de la librería 'MiLibreria' que incluye la definición de un componente
package MiLibreria is

    -- Componente 'MedioSumador' con entradas A y B, y salidas SUMA y Co
    component MedioSumador is
        Port(
            A, B: in std_logic;  -- Entradas de un solo bit
            SUMA, Co: out std_logic  -- Salidas de un solo bit (Suma y Carry)
        );
    end component;    

end MiLibreria;
