library ieee;
use ieee.std_logic_1164.all;

entity modADD is
	port(
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		Cin_geral : in std_logic;
		ZOut : out std_logic_vector(7 downto 0);
		Cout_geral : out std_logic
	);
end entity;

architecture comuta of modADD is
	
	component fadder is
		port(
			A, B, Cin : in std_logic;
			S, Cout : out std_logic
		);
	end component;

	signal Cout : std_logic_vector(7 downto 0);

begin
	u_adder0 : fadder port map(A(0), B(0), Cin_geral, ZOut(0), Cout(0));
	u_adder1 : fadder port map(A(1), B(1), Cout(0), ZOut(1), Cout(1));
	u_adder2 : fadder port map(A(2), B(2), Cout(1), ZOut(2), Cout(2));
	u_adder3 : fadder port map(A(3), B(3), Cout(2), ZOut(3), Cout(3));
	u_adder4 : fadder port map(A(4), B(4), Cout(3), ZOut(4), Cout(4));
	u_adder5 : fadder port map(A(5), B(5), Cout(4), ZOut(5), Cout(5));
	u_adder6 : fadder port map(A(6), B(6), Cout(5), ZOut(6), Cout(6));
	u_adder7 : fadder port map(A(7), B(7), Cout(6), ZOut(7), Cout(7));
	Cout_geral <= Cout(7);
	
end architecture;