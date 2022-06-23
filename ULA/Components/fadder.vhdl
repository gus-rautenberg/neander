library ieee;
use ieee.std_logic_1164.all;

entity fadder is
    port(
        A, B, Cin : in std_logic;
        S, Cout : out std_logic
    );
end entity;

architecture sum of fadder is
begin
    S    <= (A xor B) xor Cin after lat;
    Cout <= (A and B) or (A and Cin) or (B and Cin) after lat;
end architecture;
