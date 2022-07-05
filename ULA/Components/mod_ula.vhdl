-- modulo ULA para NEANDER
library ieee;
use ieee.std_logic_1164.all;

entity mod_ula is
    port(
        -- dados
        x, y; in std_logic_vector(7 downto 0);
        s : out std_logic_vector(7 downto 0);
        --controle
        ula_op : in std_logic_vector (2 downto 0);
        --status
        flagsNZ : out std_logic_vector (1 downto 0);
    );
end entity;

architecture superCalc of mod_ula is

    signal s_resultado : std_logic_vector(7 downto 0);
    signal s_not : std_logic_vector(7 downto 0); -- sinal da not
    signal s_and : std_logic_vector(7 downto 0); -- sinal da and
    signal s_or : std_logic_vector(7 downto 0); -- sinal da or
    signal s_add : std_logic_vector(7 downto 0); -- sinal da add
    signal s_cout : std_logic; -- sinal do cout, parte do ADDmod

    
    --modulo and, not
    component modAND is
        port(
            X : in std_logic_vector(7 downto 0);
            Y : in std_logic_vector(7 downto 0);
            sAND : out std_logic_vector(7 downto 0)
        );
    end component;

    component modNOT is
        port(
            X : in std_logic_vector(7 downto 0);
            notX : out std_logic_vector(7 downto 0)
        );
    end component;

    --modulo add
    component modADD is
        port(
            A : in std_logic_vector(7 downto 0);
            B : in std_logic_vector(7 downto 0);
            Cin_geral : in std_logic;
            ZOut : out std_logic_vector(7 downto 0);
            Cout_geral : out std_logic
        );
    end component; 

    --modulo or
    component modOR is
        port(
            X : in std_logic_vector(7 downto 0);
            Y : in std_logic_vector(7 downto 0);
            sOR : out std_logic_vector(7 downto 0)
        );
    end component;
    
    --mux5x8
    component mux5x8 is
        port(
            sy : in std_logic_vector(7 downto 0);
            sadd : in std_logic_vector(7 downto 0);
            sor : in std_logic_vector(7 downto 0);
            sand : in std_logic_vector(7 downto 0);
            snot : in std_logic_vector(7 downto 0);
            sel : in std_logic_vector(2 downto 0);
            saidaMUX : out std_logic_vector(7 downto 0)
        );
        end component;

    -- modulo detector NZ

    begin

        u_not : modNOT port map(x, s_not);
	    u_and : modAND port map(x, y, s_and);
	    u_or : modOR port map(x, y, s_or);
	    u_add : modADD port map(x, y, '0', s_add, s_cout);
	    u_mux5x8 : mux5x8 port map(y, s_add, s_or, s_and, s_not, ula_op, s_resultado);
	
        -- modulo detector NZ
        flagsNZ(1) <= s_resultado(7); -- flags
        flagsNZ(0) <= not(s_resultado(7) or s_resultado(6) or s_resultado(5) or s_resultado(4) or s_resultado(3) or s_resultado(2) or s_resultado(1) or s_resultado(0));


        end architecture superCalc;



        --modulo not
    
        --modulo and, not
        
        --modulo add
        -- u_adder : faad