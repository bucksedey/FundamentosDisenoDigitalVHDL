library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Declaración de la entidad 'Dec7seg' que recibe una entrada de 4 bits (A) y genera una salida de 11 bits (sa) 
-- que controla un display de 7 segmentos.
ENTITY Dec7seg IS
PORT(
    A: IN STD_LOGIC_VECTOR(3 DOWNTO 0);  -- Entrada de 4 bits que representa un número decimal (0-9)
    sa: OUT std_logic_vector (10 downto 0)  -- Salida de 11 bits que codifica la señal para un display de 7 segmentos
);
END Dec7seg;

-- Descripción de la arquitectura 'decodificador' que realiza la conversión de los números decimales (0-9)
-- en sus representaciones correspondientes en un display de 7 segmentos.
ARCHITECTURE decodificador OF Dec7seg IS
BEGIN 
    -- Proceso que asigna el valor de la salida 'sa' dependiendo del valor de la entrada 'A'
    process(A)
    begin
        case A is 
            when "0000" => 
                
                sa <= "00010111111"; -- 0
            when "0001" => 
                sa <= "00010000110"; -- 1
            when "0010" =>
                sa <= "00011011011"; -- 2
            when "0011" =>
                sa <= "00011001111"; -- 3
            when "0100" => 
                sa <= "00011100110"; -- 4
            when "0101" => 
                sa <= "00011101101"; -- 5
            when "0110" => 
                sa <= "00011111101"; -- 6
            when "0111" => 
                sa <= "00010000111"; -- 7
            when "1000" => 
                sa <= "00011111111"; -- 8
            when "1001" => 
                sa <= "00011100111"; -- 9
            when others  => 
                sa <= "00010000000"; -- Valor por defecto
        end case;
    end process;
END decodificador;
