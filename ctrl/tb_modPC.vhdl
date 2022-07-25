library ieee;
use ieee.std_logic_1164.all;

entity tb_modPC is
end entity;

architecture behavior of tb_modPC is
    constant ciclo_clock : time := 20 ns;

    component modPC is
        port(
            barramento      : in std_logic_vector(7 downto 0);
            s_endPC2MEM     : out std_logic_vector(7 downto 0);
            nbarrINC,nrw    : in std_logic;
            cl, clk         : in std_logic
        );
    end component;

    signal s_bar, s_end : std_logic_vector(7 downto 0);
    signal s_nbarinc, s_nrw, scl : std_logic;
    signal sclk : std_logic := '0';

begin
    sclk <= not(sclk) after ciclo_clock / 2;

    u_pc : modPC port map(s_bar, s_end, s_nbarinc, s_nrw, scl, sclk);

    tb : process
    begin

        scl <= '0';
        wait for ciclo_clock;

        scl <= '1';
        s_bar <= "00000011";
        s_nbarinc <= '1';
        s_nrw <= '0';
        wait for ciclo_clock;

        s_bar <= "00000011";
        s_nrw <= '1';
        wait for ciclo_clock;

        s_bar <= "00000011";
        s_nrw <= '0';
        wait for ciclo_clock;

        s_bar <= "00000011";
        s_nrw <= '1';
        wait for ciclo_clock;

        wait;
    end process;
end architecture;