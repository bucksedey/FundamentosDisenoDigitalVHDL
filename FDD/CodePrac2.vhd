library ieee;
use ieee.std_logic_1164.all;

-- Declaración de la entidad 'registro_5bits', que es un registro de 5 bits con varias operaciones
-- de control, como retención, carga de datos y corrimiento (izquierda y derecha).
entity registro_5bits is
    port(
        clk: in std_logic;                     -- Señal de reloj (clk)
        rst: in std_logic;                     -- Señal de reset (rst)
        din: in std_logic;                     -- Entrada de un bit para el corrimiento
        sel: in std_logic_vector(1 downto 0);  -- Señal de selección para determinar la operación
        bus_in: in std_logic_vector(4 downto 0); -- Entrada de 5 bits (bus_in) para carga de datos
        dout: out std_logic_vector(4 downto 0)  -- Salida del registro de 5 bits
    );
end registro_5bits;

-- Descripción de la arquitectura 'behave' del registro de 5 bits
architecture behave of registro_5bits is
    signal reg: std_logic_vector(4 downto 0);  -- Señal interna que almacena los 5 bits del registro
begin
    -- Proceso que se ejecuta en el flanco ascendente del reloj (clk)
    process(clk)
    begin
        if rising_edge(clk) then  -- Detecta el flanco ascendente del reloj
            if rst = '1' then     -- Si la señal de reset está activa
                reg <= (others => '0');  -- Se resetea el registro a cero
            else
                case sel is
                    when "00" =>
                        -- Retención de datos: el valor del registro no cambia
                        reg <= reg;
                    when "01" =>
                        -- Carga de datos: el valor de bus_in se carga en el registro
                        reg <= bus_in;
                    when "10" =>
                        -- Corrimiento a la izquierda: el bit 'din' se coloca en el bit menos significativo
                        reg <= reg(3 downto 0) & din;
                    when "11" =>
                        -- Corrimiento a la derecha: el bit 'din' se coloca en el bit más significativo
                        reg <= din & reg(4 downto 1);
                    when others =>
                        -- Selección no válida: el valor del registro no cambia
                        reg <= reg;
                end case;
            end if;
        end if;
    end process;

    -- Asigna el valor del registro a la salida dout
    dout <= reg;

end behave;
