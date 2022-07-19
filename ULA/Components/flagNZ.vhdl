library ieee;
use ieee.std_logic_1164.all;

entity flagnz is
	port(
		d      : in  std_logic_vector(1 downto 0);
		clock  : in  std_logic;
		cl : in  std_logic;
		nrw : in  std_logic;
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

    -- signal ref_d, s_d : std_logic_vector(1 downto 0);
begin
    --flag N
    u_ffdN : regCarga1bit port map(d(1), clock, '1', cl, nrw, s(1));
    -- flag Z
    u_ffZ  : regCarga1bit port map(d(0), clock, cl, '1', nrw, s(0));

end architecture;