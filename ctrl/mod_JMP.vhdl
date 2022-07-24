library ieee;
use ieee.std_logic_1164.all;

entity mod_JMP is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0);
    );
end entity;

architecture bhvr of mod_JMP is
begin

    -- Barr
    controle(0) <= not b(2) or (b(2) and not b(1) and not b(0));
    controle(1) <= not b(2) or (b(2) and not b(1) and not b(0));
    -- OP
    controle(2) <= 0;
    controle(3) <= 0;
    controle(4) <= 0;
    -- !rw
    controle(5) <= not b(2) and (b(1)); -- PC
    controle(6) <= 0; -- AC
    controle(7) <= 0; -- MEM
    controle(8) <= 0; -- REM
    controle(9) <= 0; -- RDM
    controle(10) <= 0; -- RI

end architecture;