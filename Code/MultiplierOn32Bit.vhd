library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MultiplierOn32Bit is
    Port ( multiplicand : in STD_LOGIC_VECTOR(31 downto 0); 
           multiplier : in STD_LOGIC_VECTOR(31 downto 0); 
           product : out STD_LOGIC_VECTOR(63 downto 0) 
           );
end MultiplierOn32Bit;

architecture Behavioral of MultiplierOn32Bit is

begin  
    process(multiplicand, multiplier)
    variable pv, bp : STD_LOGIC_VECTOR(63 downto 0);
    begin
        pv := (others => '0');
        bp := X"00000000" & multiplier;
        for i in 0 to 31 loop
            if multiplicand(i) = '1' then
                pv := pv + bp; 
            end if; 
            
            bp := bp(62 downto 0) & '0';
        end loop;
        
        product <= pv;
    end process;
end Behavioral;
