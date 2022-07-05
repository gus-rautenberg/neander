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
    component ac is
        port(
            d      : in  std_logic_vector(7 downto 0);
		    clock  : in  std_logic;
		    cl : in  std_logic;
		    nrw    : in  std_logic;
		    s      : out std_logic_vector(7 downto 0)
        );
    end component;

    -- component registrador -> FLAG
    component flagnz is
        port(
            d      : in  std_logic_vector(1 downto 0);
		    clock  : in  std_logic;
		    cl : in  std_logic;
		    nrw    : in  std_logic;
		    s      : out std_logic_vector(1 downto 0)
        );
    end component;
    -- component 
    component mod_ula is
        port(
            x, y; in std_logic_vector(7 downto 0);
            s : out std_logic_vector(7 downto 0);
        --controle
            ula_op : in std_logic_vector (2 downto 0);
        --status
            flagsNZ : out std_logic_vector (1 downto 0);
        );
        end component;
     -- lista de signals
    signal s_ac2ula, s_ula2ac : std_logic_vector(7 downto 0);
    signal s_ac2flags : std_logic_vector(1 downto 0);
begin
    -- u_AC : reg port map();
    AC : ac port map(s_ula2ac,clk,rst,ac_nrw,s_ac2ula);
    -- u+flagsNZ : reg2 port map();
    FLAGS: flagnz port map(s_ac2flags,clk,rst,ac_nrw,flagsNZ);
    -- u_ULAinterna : ULA_ALU portmap();
    ULA: mod_ula port map(s_ac2ula, barramento,s_ula2ac,ULA_op,s_ac2flags);
    --MUX
    barramento <= s_ac2ula when men_nrw='1' else(others <='Z');
       


    end architecture;