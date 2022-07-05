library ieee;
use ieee.std_logic_1164.all;

entity tb_ac is
end entity;

architecture behavior of tb_ac is
    constant ciclo_clock : time := 20 ns;

    component ac is
        port(
            d      : in  std_logic_vector(7 downto 0);
            clock  : in  std_logic;
            pr, cl : in  std_logic;
            nrw    : in  std_logic;
            s      : out std_logic_vector(7 downto 0)
        );
    end component ac;

    signal spr, scl, s_nrw : std_logic;
    signal s_dataIn, s_dataOut : std_logic_vector(7 downto 0);
    signal sck : std_logic := '0';

begin
    sck <= not(sck) after ciclo_clock/2;

    u_ac : ac port map(s_dataIn, sck, spr, scl, s_nrw, s_dataOut);

    tb : process
    begin

        spr <= '1';
        scl <= '0';
        wait for ciclo_clock;

        scl <= '1';
        s_dataIn <= "10010010";
        s_nrw    <= '1';
        wait for ciclo_clock;
        
        s_dataIn <= "00111001";
        s_nrw    <= '0';
        wait for ciclo_clock;

        s_dataIn <= "00111001";
        s_nrw    <= '1';
        wait for ciclo_clock;

        s_dataIn <= "10110011";
        s_nrw    <= '0';
        wait for ciclo_clock;
    end process;

end architecture;