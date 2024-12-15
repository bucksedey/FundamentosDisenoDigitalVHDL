library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entidad del demultiplexor 1 a 4
entity demux_1to4 is
 port(
     F : in STD_LOGIC;     -- Entrada
     S0, S1 : in STD_LOGIC;  -- Señales de selección
     A, B, C, D : out STD_LOGIC  -- Salidas
 );
end demux_1to4;

-- Arquitectura que define el comportamiento del demultiplexor
architecture bhv of demux_1to4 is
begin
    process (F, S0, S1) is
    begin
        -- Asigna 'F' a la salida correspondiente según las señales de selección
        if (S0 = '0' and S1 = '0') then
            A <= F;
        elsif (S0 = '1' and S1 = '0') then
            B <= F;
        elsif (S0 = '0' and S1 = '1') then
            C <= F;
        else
            D <= F;
        end if;
    end process;
end bhv;
