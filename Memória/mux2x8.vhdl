library ieee;
use ieee.std_logic_1164.all;

entity mux2x8 is 
port(
    a:   in  std_logic_vector(7 downto 0);
    b:   in  std_logic_vector(7 downto 0);
    sel: in  std_logic;
    z :  out std_logic_vector(7 downto 0);
);
end entity mux2x8;

architecture behavior of mux2x8 is

    begin

    z <= a when sel='0' else 
    b when sel='1';

    end architecture;