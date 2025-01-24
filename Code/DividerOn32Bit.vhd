library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DividerOn32Bit is
    port( numerator : in STD_LOGIC_VECTOR(31 downto 0);
          denominator : in STD_LOGIC_VECTOR(31 downto 0);
          quotient : out STD_LOGIC_VECTOR(31 downto 0);
          remainder : out STD_LOGIC_VECTOR(31 downto 0));
end DividerOn32Bit;

architecture Behavioral of DividerOn32Bit is
procedure div32(numer : in STD_LOGIC_VECTOR(31 downto 0);
                denom : in STD_LOGIC_VECTOR(31 downto 0);
                quotient : out STD_LOGIC_VECTOR(31 downto 0);
                remainder : out STD_LOGIC_VECTOR(31 downto 0)) is
    variable d, n1 : STD_LOGIC_VECTOR(32 downto 0); 
    variable n2 : STD_LOGIC_VECTOR(31 downto 0);
begin 
    d := '0' & denom; 
    n1 := (others => '0'); 
    n2 := numer; 
    
    if n2 = X"00000000" then
        quotient := n2;
        remainder := denom;
    else 
        for i in 0 to 31 loop 
            n1 := n1(31 downto 0) & n2(31); 
            n2 := n2(30 downto 0) & '0'; 

            if n1 >= d then 
                n1 := n1 - d; 
                n2(0) := '1'; 
            end if;
        end loop;    

        quotient := n2; 
        remainder := n1(31 downto 0);
    end if;     
end procedure;

begin
    process(numerator, denominator)
        variable remH, remL, quotH, quotL : STD_LOGIC_VECTOR(31 downto 0);
    begin 
        div32(numerator, denominator, quotH, remH);

        quotient <= quotH;
        remainder <= remH;
    end process;
end Behavioral;
