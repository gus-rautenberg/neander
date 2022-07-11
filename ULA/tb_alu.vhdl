library ieee;
use ieee.std_logic_1164.all;

entity tb_alu is
end entity;

architecture behavior of tb_alu is
    constant ciclo_clock : time := 20 ns;

    component moduloUlA is 
    port(
        --dados
        barramento : inout std_logic_vector(7 downto 0);

        --controle
        rsr, clk : in std_logic;
        nrw : in std_logic; -- nrw serve pra flag e para ac
        mem_nrw :  in std_logic; -- pra que isso?
        ula_op : in std_logic_vector(2 downto 0);
        
        --status
        flagsNZ : out std_logic_vector(1 downto 0)  
    );
    end component;

    signal s_barramento : std_logic_vector(7 downto 0);
    signal srsr, s_nrw, smem_nrw : std_logic;
    signal sula_op : std_logic_vector(2 downto 0);
    signal flagNZ : std_logic_vector(1 downto 0);
    signal sck : std_logic := '0';

begin
    sck <= not(sck) after ciclo_clock/2;

    u_alu : moduloULA port map(s_barramento, srsr, sck, s_nrw, smem_nrw, sula_op);

    tb : process
    begin
        srsr <= '0';
        s_barramento <= "01001101";
        smem_nrw <= '0';
        s_nrw <= '0';
        sula_op <= "000";
        wait for ciclo_clock;

        srsr <= '1';
        s_barramento <= "01001101";
        wait for ciclo_clock;

        smem_nrw <= '1';
        s_nrw <= '0';
        wait for ciclo_clock;
        
        s_nrw <= '1';
        wait for ciclo_clock;

        s_barramento <= "11000101";
        s_nrw <= '0';
        sula_op <= "010";
        wait for ciclo_clock;

        s_nrw <= '1';
        wait for ciclo_clock;

        s_barramento <= "00100101";
        s_nrw <= '1';
        sula_op <= "101";
        wait for ciclo_clock;

        s_barramento <= "10000000";
        s_nrw <= '1';
        sula_op <= "000";
        wait for ciclo_clock;

        s_barramento <= "00000001";
        s_nrw <= '0';
        sula_op <= "001";
        wait for ciclo_clock;
    
        s_nrw <= '1';
        wait for ciclo_clock*2;

    end process;
end architecture;