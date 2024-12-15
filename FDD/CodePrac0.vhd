library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaración de la entidad 'juegoDeFeria' con entradas para los dos jugadores, 
-- una señal de selección y una salida para el display
entity juegoDeFeria is
    Port (   jugador_0 : in STD_LOGIC_VECTOR (3 downto 0);  -- Entrada para las jugadas del jugador 0
            jugador_1 : in STD_LOGIC_VECTOR (3 downto 0);  -- Entrada para las jugadas del jugador 1
            sel : in STD_LOGIC;                           -- Selección entre los jugadores
            display : out STD_LOGIC_VECTOR (7 downto 0)    -- Salida para el display
    );
end juegoDeFeria;

-- Arquitectura del 'juegoDeFeria', que describe la funcionalidad del sistema
architecture aJuegoDeFeria of juegoDeFeria is
    -- Señales internas para almacenar los valores de los jugadores y los resultados
    signal jugador: std_logic_vector (3 downto 0);
    signal res: std_logic;
    signal sim_G : std_logic_vector(7 downto 0);  -- Simulación del display para el resultado ganador
    signal sim_L : std_logic_vector(7 downto 0);  -- Simulación del display para el resultado perdedor

begin
    -- Asignación del jugador seleccionado dependiendo de la señal 'sel' (Multiplexor 2x1)
    with sel select jugador <= 
        jugador_0 when '0',  -- Si 'sel' es 0, selecciona el jugador 0
        jugador_1 when others;  -- Si 'sel' es 1, selecciona el jugador 1

    -- Descripción de la tabla de verdad, que asigna el valor de 'res' dependiendo de la jugada
    pComp: process (jugador)
    begin
        case jugador is
            when "0000" => res <='0';  -- Jugada 0: Perdedor
            when "0001" => res <='0';  -- Jugada 1: Perdedor
            when "0010" => res <='0';  -- Jugada 2: Perdedor
            when "0011" => res <='0';  -- Jugada 3: Perdedor
            when "0100" => res <='0';  -- Jugada 4: Perdedor
            when "0101" => res <='0';  -- Jugada 5: Perdedor
            when "0110" => res <='0';  -- Jugada 6: Perdedor
            when "0111" => res <='1';  -- Jugada 7: Ganador
            when "1000" => res <='0';  -- Jugada 8: Perdedor
            when "1001" => res <='1';  -- Jugada 9: Ganador
            when "1010" => res <='1';  -- Jugada 10: Ganador
            when "1011" => res <='1';  -- Jugada 11: Ganador
            when "1100" => res <='1';  -- Jugada 12: Ganador
            when "1101" => res <='1';  -- Jugada 13: Ganador
            when "1110" => res <='1';  -- Jugada 14: Ganador
            when others => res <='1';  -- En cualquier otro caso, se considera ganador
        end case;
    end process pComp;

    -- Decodificador: asigna la salida del display dependiendo del resultado
    display <= sim_G when (res = '1')  -- Si el resultado es '1' (ganador), se muestra la simulación del ganador
            else sim_L;  -- Si el resultado es '0' (perdedor), se muestra la simulación del perdedor

end aJuegoDeFeria;
