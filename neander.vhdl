library ieee;
use ieee.std_logic_1164.all; 

entity neander is
    port(
        rst : in std_logic;
        clk : in std_logic
    );
end entity;

architecture neander_pc of neander is
    
    component controller is
        port(
            barramento          : in std_logic_vector(7 downto 0);
            flagNZ     : in std_logic_vector(1 downto 0);
            RI_nrw, cl, clk     : in std_logic;
            barramento_controle : out std_logic_vector(10 downto 0)
        );
    end component;

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

    component mem is
        port(
            barramento                      : inout std_logic_vector(7 downto 0);
            end_PC, end_barr                : in std_logic_vector(7 downto 0);
            barrPC,REM_nrw,MEM_nrw,RDM_nrw  : in std_logic;
            cl, clk                         : in std_logic
        );
    end component;

    component pc is
        port(
            barramento      : in std_logic_vector(7 downto 0);
            s_endPC2MEM     : out std_logic_vector(7 downto 0);
            nbarrINC,nrw    : in std_logic;
            cl, clk         : in std_logic
        );
    end component;

    signal barramento           : std_logic_vector(7 downto 0) := (others => 'Z'); 
    signal s_endPC              : std_logic_vector(7 downto 0) := (others => 'Z'); 
    signal flagsNZ              : std_logic_vector(1 downto 0) := (others => 'Z');
    signal s_bctrl              : std_logic_vector(10 downto 0);
begin

    -- ULA
    ula_modulo  : moduloUlA port map(barramento, rst, clk, s_bctrl(4), s_bctrl(3), s_bctrl(8 downto 6), flagsNZ);

    -- Memória
    mem_modulo  : mem port map(barramento, s_endPC, barramento, s_bctrl(9), s_bctrl(2), s_bctrl(3), s_bctrl(1), rst, clk);

    -- PC
    pc_modulo   : pc port map(barramento, s_endPC, s_bctrl(10), s_bctrl(5), rst, clk);

    -- UC
    cu_modulo   : controller port map(barramento, flagsNZ, s_bctrl(0), rst, clk, s_bctrl);
    
    
end architecture neander_pc;