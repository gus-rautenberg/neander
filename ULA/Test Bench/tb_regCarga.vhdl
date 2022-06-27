library ieee;
use ieee.std_logic_1164.all;

entity tb_regCarga is
end entity;

architecture behavior of tb_reg is
    constant ciclo_clock : time := 20 ns;

    component reg is
        port(
		d      : in  std_logic;
		clock  : in  std_logic;
		pr, cl : in  std_logic;
		nrw    : in  std_logic;
		s      : out std_logic
	);
    end component;

    signal s_dataIn, spr, scl, s_nrw, s_dataOut : std_logic;
    signal sck : std_logic := '0';

begin
    sck <= not(sck) after ciclo_clock/2;

    u_registrador : reg port map(s_dataIn, sck, spr, scl, s_nrw, s_dataOut);

    tb : process
    begin
        
        spr <= '0';
        scl <= '1';
        wait for ciclo_clock;

        spr <= '1';
        scl <= '0';
        wait for ciclo_clock;

        spr <= '1';
        scl <= '1';
        wait for ciclo_clock;

        s_dataIn <= '1';
        s_nrw    <= '0';
        wait for ciclo_clock;
        
        s_dataIn <= '0';
        s_nrw    <= '0';
        wait for ciclo_clock;

        s_dataIn <= '1';
        s_nrw    <= '1';
        wait for ciclo_clock;

        s_dataIn <= '0';
        s_nrw    <= '0';
        wait for ciclo_clock;

        s_dataIn <= '0';
        s_nrw    <= '1';
        wait for ciclo_clock;

        s_dataIn <= '1';
        s_nrw    <= '0';
        wait for ciclo_clock;
    end process;

end architecture;