library ieee;
use ieee.std_logic_1164.all;

-- Demultiplexor 1 a 4
entity Demux1a4 is
port(
    E: in std_logic_vector (3 downto 0);
    Sel: in std_logic_vector (1 downto 0);
    D0, D1, D2, D3: out std_logic_vector (3 downto 0)
);
end Demux1a4;

architecture demux4 of Demux1a4 is
begin
    D0 <= E when Sel = "00" else "0000";
    D1 <= E when Sel = "01" else "0000";
    D2 <= E when Sel = "10" else "0000";
    D3 <= E when Sel = "11" else "0000";
end demux4;
