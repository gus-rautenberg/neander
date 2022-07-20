library ieee;
use ieee.std_logic_1164.all;

entity mod_LDA is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0);
    );
end entity;

architecture bhvr of mod_LDA is
begin

    -- Barr
    controle(0) <= 1;
    controle(1) <= not(b(2)) or b(1) or not(b(0));
    -- OP
    controle(2) <= 0;
    controle(3) <= 1;
    controle(4) <= 0;
    -- !rw
    controle(5) <= not(b(1)) and (b(2) xor b(0)); -- PC
    controle(6) <= b(2) and b(1) and b(0); -- AC
    controle(7) <= 0; -- MEM
    controle(8) <= (not(b1) and (b(2) xnor b(0))) or (!b(2) and b(1) and b(0)); -- REM
    controle(9) <= (b2 and not(b0)) or (not(b(2)) and not(b(1)) and b(0)); -- RDM
    controle(10) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;