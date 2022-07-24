library ieee;
use ieee.std_logic_1164.all;

entity mod_JMP is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_JMP is
begin

    -- Barr
    controle(10) <= 0;
    controle(9) <= 0;
    -- OP
    controle(8) <= 0;
    controle(7) <= 0;
    controle(6) <= 0;
    -- !rw
    controle(5) <= 0; -- PC
    controle(4) <= 0; -- AC
    controle(3) <= 0; -- MEM
    controle(2) <= 0; -- REM
    controle(1) <= 0; -- RDM
    controle(0) <= 0; -- RI

end architecture;