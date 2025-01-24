library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdderOn1Bit is
  Port (A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end FullAdderOn1Bit;

architecture Behavioral of FullAdderOn1Bit is

signal P : STD_LOGIC;
signal Pxor : STD_LOGIC;

begin
    S <= A xor B xor Cin;
    P <= A and B; 
    Pxor <= A xor B;
    Cout <= P or (Pxor and Cin);
end Behavioral;
