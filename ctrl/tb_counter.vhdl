library ieee;
use ieee.std_logic_1164.all;

entity tb_counter is
end entity;

architecture behavior of tb_counter is
    constant ciclo_clock : time := 20 ns;

    component counter is
        port(
            clk : in std_logic;
            reset : in std_logic;
            q: out std_logic_vector(2 downto 0)
        );
    end component;

    signal s_reset : std_logic;
    signal s_q : std_logic_vector(2 downto 0);
    signal sck : std_logic := '0';

begin
    sck <= not(sck) after ciclo_clock/2;

    u_counter : counter port map(sck, s_reset, s_q);

    tb : process
    begin
        s_reset <= '1';
        wait for ciclo_clock;

        s_reset <= '0';
        wait for 16*ciclo_clock;

        s_reset <= '1';
        wait for ciclo_clock;

        s_reset <= '0';
        wait;
    end process;
end architecture;