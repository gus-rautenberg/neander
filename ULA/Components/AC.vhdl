library ieee;
use ieee.std_logic_1164.all;

entity ac is
	port(
		d      : in  std_logic_vector(7 downto 0);
		clock  : in  std_logic;
		cl : in  std_logic;
		nrw    : in  std_logic;
		s      : out std_logic_vector(7 downto 0)
	);
end entity;

architecture reg1bit of ac is

	component regCarga1bit is
		port(
			d      : in  std_logic;
			clock  : in  std_logic;
			pr, cl : in  std_logic;
			nrw    : in  std_logic;
			s      : out std_logic
		);
	end component regCarga1bit;

begin
	
	
	gen_ac : for i in 0 to 7 generate
		
		u_reg : regCarga1bit port map(d(i), clock, '1', cl, nrw, s(i));

	end generate gen_ac;
	
end architecture;