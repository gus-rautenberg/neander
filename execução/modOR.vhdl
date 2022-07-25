library ieee;
use ieee.std_logic_1164.all;

entity modOR is
    port(
        X : in std_logic_vector(7 downto 0);
        Y : in std_logic_vector(7 downto 0);
        sOR : out std_logic_vector(7 downto 0)
    );
end entity;

architecture comuta of modOR is

begin
    sOR <= X or Y;
end architecture;