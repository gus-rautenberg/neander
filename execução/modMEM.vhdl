library ieee;
use ieee.std_logic_1164.all;

entity mem is
    port(
        barramento                      : inout std_logic_vector(7 downto 0);
        end_PC, end_barr                : in std_logic_vector(7 downto 0);
        barrPC,REM_nrw,MEM_nrw,RDM_nrw  : in std_logic;
        cl, clk                         : in std_logic
    );
end entity;

architecture behavior of mem is
    component registrador_8 is
        port(
            d      : in  std_logic_vector(7 downto 0);
            clock  : in  std_logic;
            cl     : in  std_logic;
            nrw    : in  std_logic;
            s      : out std_logic_vector(7 downto 0)
        );
    end component;

    component as_ram is
        port(
            addr  : in    std_logic_vector(7 downto 0);
            data  : inout std_logic_vector(7 downto 0);
            notrw : in    std_logic;
            reset : in    std_logic
        );
    end component;

    component mux2x8 is 
        port(
            a:   in  std_logic_vector(7 downto 0);
            b:   in  std_logic_vector(7 downto 0);
            sel: in  std_logic;
            z :  out std_logic_vector(7 downto 0)
        );
    end component mux2x8;

    signal s_mux2rem, s_mem2rdm, s_rdm2barramento : std_logic_vector(7 downto 0);
    signal s_rem2mem : std_logic_vector(7 downto 0) := (others => '0');
begin

    -- MUX 2x8
    u_mux : mux2x8 port map (end_barr, end_PC, barrPC, s_mux2rem);

    -- REM
    u_rem : registrador_8 port map (s_mux2rem, clk, cl, REM_nrw, s_rem2mem);

    -- RDM
    u_rdm : registrador_8 port map(s_mem2rdm, clk, cl, RDM_nrw, s_rdm2barramento);

    -- MEM
    u_mem : as_ram port map(s_rem2mem,s_mem2rdm, MEM_nrw, cl);

    -- MUX (especial)
    barramento <= s_rdm2barramento when MEM_nrw = '0' else (others => 'Z');
    s_mem2rdm <= barramento when MEM_nrw = '1' else (others => 'Z');

    end architecture;   