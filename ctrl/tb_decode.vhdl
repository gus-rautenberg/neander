library ieee;
use ieee.std_logic_1164.all;

entity tb_decode is
end entity;

architecture behavior of tb_decode is
    constant ciclo_clock : time := 20 ns;

    component decode is
        port(
            instrIn  : in std_logic_vector(7 downto 0);
            instrOut : out std_logic_vector(10 downto 0)
        );
    end component;

    signal s_instrIn  : std_logic_vector(7 downto 0);
    signal s_instrOut : std_logic_vector(10 downto 0);

begin

    u_decode : decode port map(s_instrIn, s_instrOut);

    tb : process
    begin

        s_instrIn <= "00000000";
        wait for ciclo_clock;

        s_instrIn <= "00010000";
        wait for ciclo_clock;

        s_instrIn <= "00100000";
        wait for ciclo_clock;

        s_instrIn <= "00110000";
        wait for ciclo_clock;

        s_instrIn <= "01000000";
        wait for ciclo_clock;

        s_instrIn <= "01010000";
        wait for ciclo_clock;

        s_instrIn <= "01100000";
        wait for ciclo_clock;

        s_instrIn <= "10000000";
        wait for ciclo_clock;

        s_instrIn <= "10010000";
        wait for ciclo_clock;

        s_instrIn <= "10100000";
        wait for ciclo_clock;

        s_instrIn <= "11110000";
        wait for ciclo_clock;

        s_instrIn <= "11111000";
        wait for ciclo_clock;

        wait;
    end process;
end architecture;