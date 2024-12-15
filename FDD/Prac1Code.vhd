library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaración de la entidad 'p1' con entradas, salidas e inouts para varios componentes
entity p1 is
    port(
        clr, clk: in std_logic;  -- Señales de control (reset y reloj)
        relo: inout std_logic;  -- Reloj de salida
        y: in std_logic_vector(2 downto 1);  -- Señales de control adicionales
        ent, ent2: in std_logic;  -- Entradas de control
        display: out std_logic_vector(7 downto 0);  -- Display de salida
        LED: out std_logic_vector(9 downto 0);  -- LEDs de salida
        Q, Qn: inout std_logic  -- Salidas de flip-flop
    );
end p1;

-- Arquitectura 'Behavioral' que define el comportamiento de la entidad
architecture Behavioral of p1 is
    signal aux: std_logic;  -- Señal auxiliar para controlar el flip-flop
    signal contador: integer range 0 to 1399999 := 0;  -- Contador para el temporizador
begin
    -- Asignación de valores a los LEDs para mostrar el estado de diferentes señales
    LED(9) <= relo;
    LED(8 downto 7) <= y;
    LED(5) <= Qn;
    LED(4) <= Q;
    LED(3) <= ent2;
    LED(2) <= ent;
    LED(1) <= CLK;
    LED(0) <= CLR;

    -- Proceso que maneja el temporizador, el flip-flop y las operaciones según los valores de las entradas
    process(clk, clr, y, ent, ent2, Q, Qn)
    begin
        -- Reset de las señales cuando clr es '1'
        if(clr = '1') then
            aux <= '0';
            contador <= 0;
            Q <= '0';
            Qn <= '1';
        -- Condiciones de actualización del flip-flop y temporizador
        elsif (clk'event and clk = '1') then
            if(contador = 1399999) then
                aux <= not aux;  -- Cambio de estado de la señal auxiliar
                contador <= 0;
            else
                contador <= contador + 1;
            end if;

            -- Lógica del flip-flop y control de la señal Q dependiendo de las entradas
            if (aux'event and aux = '1') then
                case y is
                    when "00" =>
                        if(ent = '1' and ent2 = '0') then
                            Q <= '1';
                            Qn <= '0';
                        elsif(ent = '0' and ent2 = '1') then
                            Q <= '0';
                            Qn <= '1';
                        elsif(ent = '0' and ent2 = '0') then
                            Q <= Q;
                            Qn <= Qn;
                        else
                            Q <= not Q;
                            Qn <= not Qn;
                        end if;
                    when "01" =>
                        if(ent = '0') then
                            Q <= Q;
                            Qn <= not(Q);
                        elsif(ent = '1') then
                            Q <= not(Q);
                            Qn <= Q;
                        end if;
                    when "10" =>
                        Q <= ent;
                        Qn <= not(ent);
                    when "11" =>
                        if(ent = '0' and ent2 = '0') then
                            Q <= Q;
                            Qn <= Qn;
                        elsif(ent = '1' and ent2 = '1') then
                            Q <= '1';
                            Qn <= '1';
                        elsif(ent = '0' and ent2 = '1') then
                            Q <= '0';
                            Qn <= '1';
                        else
                            Q <= '1';
                            Qn <= '0';
                        end if;
                    when others =>
                        Q <= '1';
                        Qn <= '0';
                end case;
            end if;
        end if;
    end process;

    -- Asignación de la señal 'relo' a la señal auxiliar 'aux'
    relo <= aux;

    -- Asignación de valores al display dependiendo del estado de Q
    with Q select 
        display <= "00001101" when ('1'),
                   "01111111" when others;

end Behavioral;
