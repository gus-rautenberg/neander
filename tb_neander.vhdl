library ieee;
use ieee.std_logic_1164.all;

entity tb_neander is
  port(
    rst, clk  : in std_logic
  );
end entity;

architecture comportamento of tb_neander is
  constant ciclo_clock : time := 20 ns;

  component neander is
    port(
      rst, clk : in std_logic
    );
  end component;

  signal srst : std_logic := '1';
  signal sclk : std_logic := '0';

begin
  sclk <= not(sclk) after ciclo_clock / 2;

  u_neander : neander port map(srst, sclk);

  tb : process
  begin
    -- reset inicial
    srst <= '0';
    wait for ciclo_clock;
    srst <= '1';

    wait;
  end process;
end architecture;