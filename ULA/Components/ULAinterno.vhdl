-- modulo ULA para NEANDER
library ieee;
use ieee.std_logic_1164.all;

entity ULAinterno is
    port(
        -- dados
        x, y; in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0);
        --controle
        ula_op : in std_logic_vector (2 downto 0);
        --status
        flagsNZ : out std_logic_vector (1 downto 0);
    );
end entity;

architecture superCalc of ULAinterno is

    signal s_resultado : std_logic_vector(7 downto 0);
    signal s_not : std_logic_vector(7 downto 0); -- sinal da not
    signal s_and : std_logic_vector(7 downto 0); -- sinal da and
    signal s_or : std_logic_vector(7 downto 0); -- sinal da or
    signal s_add : std_logic_vector(7 downto 0); -- sinal da add
    signal s_cout : std_logic; -- sinal do cout, parte do ADDmod

    begin
        --modulo not

        --modulo and, not
        
        --modulo add
        -- u_adder : faad

        -- modulo detector NZ
        flagNZ(1) <= 