library ieee;
use ieee.std_logic_1164.all; 

entity modRDM is
    port(
        datain      : in std_logic_vector(7 downto 0);
        clk, cl     : in std_logic;
        nrw         : in std_logic;
        dataout      : out std_logic_vector(7 downto 0)

    );
end entity;

architecture RDM of modRDM is
    component ffd is
        port(
            d      : in std_logic;
            nrw    : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

begin
    regRDM : for i in 7 downto 0 generate
        r : ffd port map(datain(i), nrw, clk, '1', cl, dataout(i));
    end generate regRDM;

end architecture;