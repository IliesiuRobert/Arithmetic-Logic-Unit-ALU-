library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Debouncer is
    Port (
        btn_in : in STD_LOGIC;
        clk : in STD_LOGIC;
        btn_out : out STD_LOGIC
    );
end Debouncer;

architecture Behavioral of Debouncer is
    signal counter : integer := 0;
    signal stable_state : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if btn_in = stable_state then
                counter <= 0;
            else
                counter <= counter + 1;
                if counter > 10000 then -- Adapteaz? la frecven?a ceasului
                    stable_state <= btn_in;
                    counter <= 0;
                end if;
            end if;
        end if;
    end process;
    btn_out <= stable_state;
end Behavioral;
