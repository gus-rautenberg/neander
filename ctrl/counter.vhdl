library ieee;
use ieee.std_logic_1164.all;

entity counter is
    port(
        clk: in std_logic;
        reset: in std_logic;
        q: out std_logic_vector(2 downto 0)
    );
end entity;

architecture cont of counter is
    
    component ffjk is
        port(
            j, k   : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

    signal s_t : std_logic_vector (2 downto 0);
    signal s_q : std_logic_vector (2 downto 0);
    signal s_nq : std_logic_vector (2 downto 0);

begin
    q <= s_q;

    u0 : ffjk port map(s_t(0), s_t(0), clk, '1', reset, s_q(0), s_nq(0));
    u1 : ffjk port map(s_t(1), s_t(1), clk, '1', reset, s_q(1), s_nq(1));
    u2 : ffjk port map(s_t(2), s_t(2), clk, '1', reset, s_q(2), s_nq(2));

    s_t(0) <= '1';

    s_t(1) <= s_q(0);

    s_t(2) <= s_q(1) and s_q(0);

end architecture;