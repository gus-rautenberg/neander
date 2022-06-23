-- modulo ULA para NEANDER
library ieee;
use ieee.std_logic_1164.all;

entity moduloUlA is 
    port(
        --dados
        barramento : inout std_logic_vector(7 downto 0);

        --controle
        rsr, clk : in std_logic;
        ac_nrw : in std_logic;
        mem_nrw :  in std_logic;
        ula_op : in std_logic_vector(2 downto 0);
        
        --status
        flagsNZ : out std_logic_vector(1 downto 0);

        
    );

    end entity;

architecture calculater of moduloULA is
    -- component registrador-> AC

    -- component registrador -> FLAG

    -- component 

begin
    -- u_AC : reg port map();

    -- u+flagsNZ : reg2 port map();

    -- u_ULAinterna : ULA_ALU portmap();

    barramento <= s_ac2ula when man_nrw='1'
        else(others <='Z')
        -- lista de signals
    signal s_ac2ula, s_ula2ac : std_logic_vector(7 downto 0);
    signal s_ac2flags : std_logic_vector(1 downto 0);


    end architecture;