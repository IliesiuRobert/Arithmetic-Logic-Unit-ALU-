library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FullSubtractorOn32Bit is
    Port (A : in STD_LOGIC_VECTOR(31 downto 0);
          B : in STD_LOGIC_VECTOR(31 downto 0);
          Dif : out STD_LOGIC_VECTOR(31 downto 0);
          Borrow : out STD_LOGIC);
end FullSubtractorOn32Bit;

architecture Behavioral of FullSubtractorOn32Bit is

component FullAdderOn1Bit is
  Port (A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end component;

signal notB : STD_LOGIC_VECTOR(31 downto 0);
signal difference : STD_LOGIC_VECTOR(31 downto 0);
signal bor : STD_LOGIC_VECTOR(31 downto 0);

begin
    notB <= not(B);
    
    ForFirstBit : FullAdderOn1Bit port map(A => A(0), B => notB(0), Cin => '1', S => difference(0), Cout => bor(0));
    
    For1To30Bits : for i in 1 to 30 generate
        For1Bit : FullAdderOn1Bit port map(A => A(i), B => notB(i), Cin => bor(i-1), S => difference(i), Cout => bor(i));
    end generate For1To30Bits; 
    
    ForLastBit : FullAdderOn1Bit port map(A => A(31), B => notB(31), Cin => bor(30), S => difference(31), Cout => Borrow);  
    
    Dif <= difference; 
end Behavioral;
