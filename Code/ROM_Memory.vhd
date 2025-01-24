library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM_Memory is
    Port (clk : in STD_LOGIC;
          Read_En : in STD_LOGIC;
          Address : in STD_LOGIC_VECTOR(3 downto 0);
          Data_out : out STD_LOGIC_VECTOR(31 downto 0));
end ROM_Memory;

architecture Behavioral of ROM_Memory is
type memROM is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
signal rom : memROM := (X"00000001", -- 1
                        X"00000005", -- 5
                        X"00000000", -- 0
                        X"00000036", -- 54
                        X"0000002E",  -- 46
                        X"000000FF", -- 510
                        X"00000008", -- 8
                        X"0000004B", -- 75
                        X"10101010", -- 269488144
                        X"10000001", -- 268435457
                        others => X"00000000");

signal Data_reg : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if Read_En = '1' then
                Data_reg <= rom(conv_integer(Address)); 
            end if;
        end if;
    end process;
    
    Data_out <= Data_reg;
end Behavioral;
