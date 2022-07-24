library ieee;
use ieee.std_logic_1164.all; 

entity UC is
    port(
        dec2uc              : in std_logic_vector(10 downto 0);
        cl, clk             : in std_logic;
        NZ                  : in std_logic_vector(1 downto 0);
        barrControl : out std_logic_vector(10 downto 0)
    );
end entity;

architecture UC_comp of UC is

    component counter is
        port(
            clk: in std_logic;
            reset: in std_logic;
            q: out std_logic_vector(2 downto 0)
        );
    end component;

    signal sCounter : std_logic_vector (2 downto 0);
    signal sNop, sSta, sLda, sAdd, sAnd, sOr, sNot, sJmp, sJN, sJZ, sHLT : std_logic_vector(10 downto 0);

    begin

        u_counter : counter port map(clk, cl, sCounter);

        barrControl <=  sNop when dec2uc="10000000000" else
                            sSta when dec2uc="01000000000" else
                            sLda when dec2uc="00100000000" else
                            sAdd when dec2uc="00010000000" else
                            sAnd when dec2uc="00001000000" else
                            sOr  when dec2uc="00000100000" else
                            sNot when dec2uc="00000010000" else
                            sJmp when dec2uc="00000001000" else
                            sJn  when dec2uc="00000000100" else
                            sJz  when dec2uc="00000000010" else
                            sHlt when dec2uc="00000000001" else
                            (others => 'Z');

    -- NOP
    sNOP: 
    -- LDA

   
