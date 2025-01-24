library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MemoryAddressManagement is
    Port (clk : in STD_LOGIC;
          en : in STD_LOGIC;
          reset : in STD_LOGIC;
          enable_A : out STD_LOGIC;
          enable_B : out STD_LOGIC;
          Address_A : out STD_LOGIC_VECTOR(3 downto 0);
          Address_B : out STD_LOGIC_VECTOR(3 downto 0)
          );
end MemoryAddressManagement;

architecture Behavioral of MemoryAddressManagement is
signal addressA : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal addressB : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal toggle : STD_LOGIC := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then 
            toggle <= '0';
            addressA <= (others => '0');
            addressB <= (others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                toggle <= not toggle; 
                if toggle = '0' then
                    addressA <= std_logic_vector(unsigned(addressA) + 1);
                else
                    addressB <= std_logic_vector(unsigned(addressB) + 1);
                end if;
            end if;
        end if;
    end process;
    
    process(toggle, en)
    begin
        if en = '1' then
            if toggle = '0' then
                enable_A <= '1';
                enable_B <= '0';
            else
                enable_A <= '0';
                enable_B <= '1';
            end if;
        else
            enable_A <= '0';
            enable_B <= '0';
        end if;
    end process;
    
    Address_A <= addressA;
    Address_B <= addressB;
end Behavioral;
