library ieee;
use ieee.std_logic_1164.all;

entity tb_ula is
end entity;

architecture behavior of tb_ula is
    constant ciclo_clock : time := 20 ns;

    component ULAinterno is
        port(
            -- dados
            x, y : in std_logic_vector(7 downto 0);
            s : out std_logic_vector(7 downto 0);
            --controle
            ula_op : in std_logic_vector(2 downto 0);
            --status
            flagsNZ : out std_logic_vector(1 downto 0)
        );
    end component;

    signal s_acIn, s_barramento, s_saida : std_logic_vector(7 downto 0);
    signal s_ulaOp : std_logic_vector(2 downto 0);
    signal s_flags : std_logic_vector(1 downto 0);

begin

    tb : process
    begin

        s_acIn       <= "10110010";
        s_barramento <= "00101101";
        s_ulaOp      <= "001";
        wait for ciclo_clock;

        s_ulaOp      <= "001";
        wait for ciclo_clock;

        s_ulaOp      <= "010";
        wait for ciclo_clock;

        s_ulaOp      <= "011";
        wait for ciclo_clock;

        s_ulaOp      <= "100";
        wait for ciclo_clock;

        s_ulaOp      <= "101";
        wait for ciclo_clock;

        s_ulaOp      <= "110";
        wait for ciclo_clock;

        s_ulaOp      <= "111";
        wait for ciclo_clock;

    end process;
    
end architecture;