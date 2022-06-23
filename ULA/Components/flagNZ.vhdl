#library ieee;

entity flagNZ is
    port(
        clk, reset : std_logic;
        dataIN : in std_logic_vector(1 downto 0);
        ac_nrw : in std_logic;
        dataOUT : out std_logic_vector(1 downto 0);
    )
end entity;

architecture status of flagNZ is
    component ffd is
        port(
            dataIN : std_logic;
            clk, pr, cl : std_logic;
            dataout: std_logic
        );
end component
 signal ref_d, s_d : std_logic_vector(1 downto 0);
 begin
    --flag N
    u_ffdN : ffd port map(reg_d, clk, '1', reset, s_d(1));
    u_ffZ: ffd port map(reg_d(0), clk, reset, '1', s_d(0));

    --mux
    dataout <= s_d;

end architecture