library ieee;
use ieee.std_logic_1164.all; 

entity controller is
    port(
        barramento          : in std_logic_vector(7 downto 0);
        flagNZ     : in std_logic_vector(1 downto 0);
        RI_nrw, cl, clk     : in std_logic;
        barramento_controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture controle_modulo of controller is
    
    component ri is
        port(
		    d      : in  std_logic_vector(7 downto 0);
		    clock  : in  std_logic;
		    cl : in  std_logic;
		    nrw    : in  std_logic;
		    s      : out std_logic_vector(7 downto 0)
	    );
    end component;

    component decode is
        port(
            instrin : in std_logic_vector(7 downto 0);
            instrout: out std_logic_vector(10 downto 0)
        );
    end component;

    component UC is
        port(
            dec2uc              : in std_logic_vector(10 downto 0);
            cl, clk             : in std_logic;
            NZ                  : in std_logic_vector(1 downto 0);
            barrControl : out std_logic_vector(10 downto 0)
        );
    end component;

    signal ri2decode : std_logic_vector(7 downto 0);
    signal decode2uc : std_logic_vector(10 downto 0);

    begin
    -- RI
    RI_reg : ri port map(barramento, clk, cl, RI_nrw, ri2decode);

    -- Decodificador
    dec : decode port map(ri2decode,decode2UC);

    -- UC
    uc_comp : UC port map(decode2uc,cl,clk, flagNZ,barramento_controle);
    
end architecture controle_modulo;