-- library ieee;
-- use ieee.std_logic_1164.all; 

-- entity modREM is
--     port(
--         endin       : in std_logic_vector(7 downto 0);
--         clk, cl     : in std_logic;
--         nrw         : in std_logic;
--         endout      : out std_logic_vector(7 downto 0)
--     );   
-- end entity;

-- architecture REM of modREM is
--     component ffd is
--         port(
--             d      : in std_logic;
--             nrw    : in std_logic;
--             clk    : in std_logic;
--             pr, cl : in std_logic;
--             q, nq  : out std_logic
--         );
--     end component;

-- begin
--     regREM : for i in 7 downto 0 generate
--         r : ffd port map(endin(i), nrw,clk, '1', cl, endout(i));
--     end generate regREM;

-- end architecture;