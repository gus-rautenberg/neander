library ieee;
use ieee.std_logic_1164.all;

entity tb_modMEM is
end entity;

architecture mem_modulo of tb_modMEM is
    constant cicloClock : time := 20 ns;

    component mem is
        port(
            barramento                      : inout std_logic_vector(7 downto 0);
            end_PC, end_barr                : in std_logic_vector(7 downto 0);
            barrPC,REM_nrw,MEM_nrw,RDM_nrw  : in std_logic;
            cl, clk                         : in std_logic
        );
    end component;

    signal srst : std_logic := '1';
    signal sclk : std_logic := '0';
    signal sEndPC, sEndBarr, sBarramento  : std_logic_vector(7 downto 0);
    signal sBarrPC, sRemNRW, sMemNRW, sRdmNRW  : std_logic;

begin
    sclk <= not(sclk) after cicloClock / 2;

    u_MEM : mem port map(sBarramento, sEndPC, sEndBarr, sBarrPC, sRemNRW, sMemNRW, sRdmNRW,srst, sclk);

    tb : process
    begin
        -- reset inicial
        srst <= '0';
        wait for cicloClock;
        srst <= '1';

        sBarrPC <= '1';
        sRemNrw <= '1';
        sMemNrw <= '0';
        sRdmNrw <= '1';

        -- Leitura na posição 0
        sEndPC <= "00000000";
        wait for cicloClock;

        sMemNrw <= '1';
        sbarramento <= "00100000";
        wait for cicloClock;

        wait; -- forever!
    end process;
end architecture;