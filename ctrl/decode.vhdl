library ieee;
use ieee.std_logic_1164.all;

entity decode is
    port(
        instrIn  : in std_logic_vector(7 downto 0);
        instrOut : out std_logic_vector(10 downto 0)
    );
end entity;

architecture decodificar of decode is

begin

    instrOut <= "10000000000" when instrIn = "00000000" else
                "01000000000" when instrIn = "00010000" else
                "00100000000" when instrIn = "00100000" else
                "00010000000" when instrIn = "00110000" else
                "00001000000" when instrIn = "01000000" else
                "00000100000" when instrIn = "01010000" else
                "00000010000" when instrIn = "01100000" else
                "00000001000" when instrIn = "10000000" else
                "00000000100" when instrIn = "10010000" else
                "00000000010" when instrIn = "10100000" else
                "00000000001" when instrIn = "11110000" else (others => 'Z');

end architecture;