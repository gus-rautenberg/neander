library ieee;
use ieee.std_logic_1164.all;

entity modAND is
    port(
        X : in std_logic_vector(7 downto 0);
        Y : in std_logic_vector(7 downto 0);
        sAND : out std_logic_vector(7 downto 0)
    );
end entity;

architecture comuta of modAND is

begin
    sAND <= X and Y;
end architecture;