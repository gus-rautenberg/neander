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
            ula_op : in std_logic_vector (2 downto 0);
            --status
            flagsNZ : out std_logic_vector (1 downto 0)
        );
    end component;

    -- signal:

begin

    tb : process
    begin
        
    end process;
    
end architecture;