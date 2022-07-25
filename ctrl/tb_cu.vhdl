library ieee;
use ieee.std_logic_1164.all;

entity tb_cu is
end entity;

architecture behavior of tb_cu is
    constant ciclo_clock : time := 20 ns;

    component CU is
        port(
            dec2uc      : in std_logic_vector(10 downto 0);
            cl, clk     : in std_logic;
            NZ          : in std_logic_vector(1 downto 0);
            barrControl : out std_logic_vector(10 downto 0)
        );
    end component;

        signal s_dec2uc, s_barrControl : std_logic_vector(10 downto 0);
        signal scl, sck : std_logic := '0';
        signal s_nz : std_logic_vector(1 downto 0) := "11";

begin
    sck <= not(sck) after ciclo_clock/2;

    u_cu : cu port map(s_dec2uc, scl, sck, s_nz, s_barrControl);

    tb : process
    begin

        wait for 8*ciclo_clock;
        
        scl <= '1';
        wait for 8*ciclo_clock;

        s_dec2uc <= "10000000000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "01000000000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00100000000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00010000000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00001000000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000100000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000010000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000001000";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000000100";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000000100";
        s_nz(1) <= '0';
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000000010";
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000000010";
        s_nz(0) <= '0';
        wait for 8*ciclo_clock;

        s_dec2uc <= "00000000001";
        wait for 8*ciclo_clock;

        wait;
        
    end process;
end architecture;