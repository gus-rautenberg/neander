library ieee;
use ieee.std_logic_1164.all;

entity tb_alu is
end entity;

architecture behavior of tb_alu is
    constant ciclo_clock : time := 20 ns;

    component moduloUlA is 
    port(
        barramento : inout std_logic_vector(7 downto 0);
        rsr, clk : in std_logic;
        ac_nrw : in std_logic;
        mem_nrw :  in std_logic;
        ula_op : in std_logic_vector(2 downto 0);
        flagsNZ : out std_logic_vector(1 downto 0)
    );
    end component;