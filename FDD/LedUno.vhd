library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entidad 'onled' que tiene una entrada 'I' y una salida 'O', donde la salida sigue el valor de la entrada.
entity onled is
Port ( I: in STD_LOGIC;  -- Entrada de un solo bit
       O: out STD_LOGIC  -- Salida de un solo bit
);
end onled;

-- Arquitectura 'on_led' que asigna el valor de la entrada 'I' directamente a la salida 'O'
architecture on_led of onled is 
begin 
    O <= I;  -- La salida sigue el valor de la entrada
end on_LED;
