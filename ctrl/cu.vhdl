library ieee;
use ieee.std_logic_1164.all; 

entity CU is
    port(
        dec2uc              : in std_logic_vector(10 downto 0);
        cl, clk             : in std_logic;
        NZ                  : in std_logic_vector(1 downto 0);
        barrControl : out std_logic_vector(10 downto 0)
    );
end entity;

architecture CU_comp of CU is

    component counter is
        port(
            clk: in std_logic;
            reset: in std_logic;
            q: out std_logic_vector(2 downto 0)
        );
    end component;
    


    component mod_NOP is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_STA is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_LDA is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_ADD is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_AND is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_OR is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_NOT is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_JMP is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_JN is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_JZ is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;
    
      component mod_HLT is
        port(
            b : in std_logic_vector(2 downto 0);
            controle : out std_logic_vector(10 downto 0);
        );
      end component;

    signal sCounter : std_logic_vector (2 downto 0);
    signal sNop, sSta, sLda, sAdd, sAnd, sOr, sNot, sJmp, sJN, sJZ, sHLT : std_logic_vector(10 downto 0);

begin

    u_counter : counter port map(clk, cl, sCounter);
    u_NOP : mod_NOP port map(sCounter, sNOP);
    u_STA : mod_STA port map(sCounter, sSta);
    u_LDA : mod_LDA port map(sCounter, sLDA);
    u_AND : mod_AND port map(sCounter, sAND);
    u_ADD : mod_ADD port map(sCounter, sADD);
    u_OR : mod_OR port map(sCounter, sOR);
    u_NOT : mod_NOTT port map(sCounter, sNot);
    u_HLT : mod_HLT port map(sCounter, sHLT);
    u_JMP : mod_JMP port map(sCounter, sJmp);
    u_JN : mod_JN port map(sCounter, sJN);
    u_JZ : mod_JZ port map(sCounter, sJZ);

    barrControl <=  sNop when dec2uc="10000000000" else
                    sSta when dec2uc="01000000000" else
                    sLda when dec2uc="00100000000" else
                    sAdd when dec2uc="00010000000" else
                    sAnd when dec2uc="00001000000" else
                    sOr  when dec2uc="00000100000" else
                    sNot when dec2uc="00000010000" else
                    sJmp when dec2uc="00000001000" else

                    sJmp when dec2uc = ("00000000100") and (NZ(1) = '1') else    
                    sJN  when dec2uc = ("00000000100") and (NZ(1) = '0') else 

                    sJMP when dec2uc = ("00000000010") and (NZ(0) = '1') else
                    sJZ when dec2uc = ("00000000010") and (NZ(0) = '0' ) else

                    sJN  when dec2uc="00000000100" else
                    sJZ  when dec2uc="00000000010" else
                    sHlt when dec2uc="00000000001" else
                    (others => 'Z');

end architecture;

