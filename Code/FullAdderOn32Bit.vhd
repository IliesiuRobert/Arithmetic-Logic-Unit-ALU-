library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FullAdderOn32Bit is
  Port (A : in STD_LOGIC_VECTOR(31 downto 0);
        B : in STD_LOGIC_VECTOR(31 downto 0);
        Sum : out STD_LOGIC_VECTOR(31 downto 0);
        Cout : out STD_LOGIC);
end FullAdderOn32Bit;

architecture Behavioral of FullAdderOn32Bit is

component FullAdderOn1Bit is
  Port (A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end component;

signal carry : STD_LOGIC_VECTOR(31 downto 0);

begin
    ForFirstBit : FullAdderOn1Bit port map(A => A(0), B => B(0), Cin => '0', S => Sum(0), Cout => carry(0));
    
    For1To30Bits : for i in 1 to 30 generate
        For1Bit : FullAdderOn1Bit port map(A => A(i), B => B(i), Cin => carry(i-1), S => Sum(i), Cout => carry(i));
    end generate For1To30Bits; 
    
    ForLastBit : FullAdderOn1Bit port map(A => A(31), B => B(31), Cin => carry(30), S => Sum(31), Cout => Cout);
end Behavioral;
