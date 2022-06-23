-- modulo ULA para NEANDER
library ieee;
use ieee.std_logic_1164.all;

entity ULAinterno is
    port(
        -- dados
        x, y; in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0);
        --controle
        ula_op : in std_logic_vector (3 downto 0);
        --status
        flagsNZ : out std_logic_vector (1 downto 0);
    );
end entity;

architecture superCalc of ULAinterno is

    signal s_resultado : std_logic_vector(7 downto 0);
    begin
        --modulo not

        --modulo and, not
        
        --modulo add
        -- u_adder : faad

        -- modulo detector NZ
        flagNZ(1) <= 