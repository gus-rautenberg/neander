library ieee;
use ieee.std_logic_1164.all;

entity flagnz is
	port(
		d      : in  std_logic_vector(1 downto 0);
		clock  : in  std_logic;
		pr, cl : in  std_logic;
		nrw    : in  std_logic;
		s      : out std_logic_vector(1 downto 0)
	);
end entity flagnz;

architecture reg1bit of flagnz is

	component regCarga1bit is
		port(
			d      : in  std_logic;
			clock  : in  std_logic;
			pr, cl : in  std_logic;
			nrw    : in  std_logic;
			s      : out std_logic
		);
	end component regCarga1bit;

    signal ref_d, s_d : std_logic_vector(1 downto 0);

    begin
    --flag N
    u_ffdN : regCarga1bit port map(reg_d, clk, '1', reset, s_d(1));
    -- flag Z
    u_ffZ  : regCarga1bit port map(reg_d(0), clk, reset, '1', s_d(0));

    --mux
    dataout <= s_d;

end architecture