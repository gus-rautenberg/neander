library ieee;
use ieee.std_logic_1164.all;

entity mod_JN is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_JN is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= '1';
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not(b(2)) and b(0); -- PC
    controle(4) <= '0'; -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= not(b(2)) and not(b(1)) and not(b(0)); -- REM
    controle(1) <= not(b(2)) and not(b(1)) and b(0); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;