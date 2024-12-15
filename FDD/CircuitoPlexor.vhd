-- Descripción del código:
-- Este es un diseño VHDL para un multiplexor de expansión (ExpansionMUX) de 8 entradas,
-- basado en 2 multiplexores de 4 a 1 y un multiplexor de 2 a 1. 
-- Selecciona una de las 8 entradas de acuerdo con la señal de selección (Sel) y 
-- genera una salida única (Salida).

library ieee;
use ieee.std_logic_1164.all;
use work.MuxPack.all;  -- Incluye la librería que contiene los componentes de los multiplexores

-- Declaración de la entidad (ExpansionMUX) que recibe 8 entradas, una señal de selección de 3 bits
-- y genera una salida de un solo bit.
entity ExpansionMUX is
port(
    E: in std_logic_vector (7 downto 0);  -- Entradas de 8 bits
    Sel: in std_logic_vector (2 downto 0);  -- Señal de selección de 3 bits
    Salida: out std_logic  -- Salida de un solo bit
);
end ExpansionMUX;

-- Arquitectura del multiplexor de expansión, implementado usando dos MUX de 4 a 1 y un MUX de 2 a 1
architecture EXPMUX of ExpansionMUX is
-- Declaración de señales internas para dividir las entradas y selección
signal aux1: std_logic_vector (3 downto 0);  -- Primer grupo de 4 bits de las entradas
signal aux2: std_logic_vector (3 downto 0);  -- Segundo grupo de 4 bits de las entradas
signal auxSel: std_logic_vector (1 downto 0);  -- Señal de selección de 2 bits para los MUX de 4 a 1
signal auxOut: std_logic_vector (1 downto 0);  -- Salidas de los MUX de 4 a 1
begin

    -- Asigna los primeros 4 bits de E a aux1
    aux1(0) <= E(0);
    aux1(1) <= E(1);
    aux1(2) <= E(2);
    aux1(3) <= E(3);

    -- Asigna los últimos 4 bits de E a aux2
    aux2(0) <= E(4);
    aux2(1) <= E(5);
    aux2(2) <= E(6);
    aux2(3) <= E(7);

    -- Asigna los dos primeros bits de Sel a auxSel para controlar los MUX de 4 a 1
    auxSel(0) <= Sel(0);
    auxSel(1) <= Sel(1);

    -- Instancia el primer MUX de 4 a 1 para procesar los primeros 4 bits (aux1)
    U1: Mux4a1 port map (aux1, auxSel, auxOut(0));

    -- Instancia el segundo MUX de 4 a 1 para procesar los últimos 4 bits (aux2)
    U2: Mux4a1 port map (aux2, auxSel, auxOut(1));

    -- Instancia el MUX de 2 a 1 para seleccionar entre las salidas de los dos MUX anteriores
    U3: Mux2a1 port map (auxOut, Sel(2), Salida);

end EXPMUX;
