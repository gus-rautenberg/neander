library ieee;
use ieee.std_logic_1164.all; 

entity modPC is
    port(
        barramento      : in std_logic_vector(7 downto 0);
        s_endPC2MEM     : out std_logic_vector(7 downto 0);
        nbarrINC,nrw    : in std_logic;
        cl, clk         : in std_logic
    );
end entity;

architecture behavior of modPC is
    component registrador_8 is
        port(
            d      : in  std_logic_vector(7 downto 0);
            clock  : in  std_logic;
            cl     : in  std_logic;
            nrw    : in  std_logic;
            s      : out std_logic_vector(7 downto 0)
        );
    end component;

    component modADD is
        port(
            A : in std_logic_vector(7 downto 0);
            B : in std_logic_vector(7 downto 0);
            Cin_geral : in std_logic;
            ZOut : out std_logic_vector(7 downto 0);
            Cout_geral : out std_logic
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

    signal sadd, s_mux2pc, s_PCatual : std_logic_vector(7 downto 0);
    signal s_cout : std_logic;

begin
    
    -- MUX 2x8
    u_mux : mux2x8 port map (barramento, sadd, nbarrINC, s_mux2pc);

    -- ADD
    u_add : modADD port map ("00000001", s_PCatual, '0', sadd, s_cout);

    --PC
    u_pc : registrador_8 port map (s_mux2pc, clk, cl, nrw, s_PCatual);

    s_endPC2MEM <= s_PCatual;

end architecture;