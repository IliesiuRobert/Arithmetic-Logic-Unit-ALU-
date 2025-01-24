library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_env is
    Port( sw : in STD_LOGIC_VECTOR(7 downto 0);
          btn : in STD_LOGIC_VECTOR(4 downto 0);
          clk : in STD_LOGIC;
          cat : out STD_LOGIC_VECTOR(6 downto 0);
          an : out STD_LOGIC_VECTOR(7 downto 0);
          led : out STD_LOGIC_VECTOR (15 downto 0));
end test_env;

architecture Behavioral of test_env is

component Debouncer is
    Port (
        btn_in : in STD_LOGIC;
        clk : in STD_LOGIC;
        btn_out : out STD_LOGIC
    );
end component;

component MPG is
    Port ( enable : out STD_LOGIC;
           btn : in STD_LOGIC;
           clk : in STD_LOGIC);
end component;

component SSD is
    Port ( clk : in STD_LOGIC;
           digits : in STD_LOGIC_VECTOR(31 downto 0);
           an : out STD_LOGIC_VECTOR(7 downto 0);
           cat : out STD_LOGIC_VECTOR(6 downto 0));
end component;

component ROM_Memory is
    Port (clk : in STD_LOGIC;
          Read_En : in STD_LOGIC;
          Address : in STD_LOGIC_VECTOR(3 downto 0);
          Data_out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component MemoryAddressManagement is
    Port (clk : in STD_LOGIC;
          en : in STD_LOGIC;
          reset : in STD_LOGIC;
          enable_A : out STD_LOGIC;
          enable_B : out STD_LOGIC;
          Address_A : out STD_LOGIC_VECTOR(3 downto 0);
          Address_B : out STD_LOGIC_VECTOR(3 downto 0)
          );
end component;

component ALU is
    Port (A : in STD_LOGIC_VECTOR(31 downto 0);
          B : in STD_LOGIC_VECTOR(31 downto 0);
          SEL : in STD_LOGIC_VECTOR(3 downto 0);
          ALUOut : out STD_LOGIC_VECTOR(63 downto 0));
end component;

signal debounced_btn : STD_LOGIC;
signal en : STD_LOGIC;
signal enable_A : STD_LOGIC;
signal enable_B : STD_LOGIC;
signal Address_A : STD_LOGIC_VECTOR(3 downto 0);
signal Address_B : STD_LOGIC_VECTOR(3 downto 0); 
signal DataOut_A : STD_LOGIC_VECTOR(31 downto 0);
signal DataOut_B : STD_LOGIC_VECTOR(31 downto 0);
signal mux : STD_LOGIC_VECTOR(31 downto 0);
signal Result : STD_LOGIC_VECTOR(31 downto 0);

signal DataALUOut : STD_LOGIC_VECTOR(63 downto 0);

begin
    Button_Debounce: Debouncer port map(btn(0), clk, debounced_btn);
    
    MonopulsGeneratorSincron : MPG port map(en, debounced_btn, clk);

    MemoryManagement : MemoryAddressManagement port map(clk, en, btn(1), enable_A, enable_B, Address_A, Address_B);
    
    Memory_A : ROM_Memory port map(clk, enable_A, Address_A, DataOut_A);
    
    Memory_B : ROM_Memory port map(clk, enable_B, Address_B, DataOut_B);
    
    ALU_Op : ALU port map(DataOut_A, DataOut_B, sw(3 downto 0), DataALUOut);
    
    with sw(4) SELECT
        Result <= DataALUOut(31 downto 0) when '0',
                  DataALUOut(63 downto 32) when '1';
    
    with sw(6 downto 5) SELECT 
        mux <= DataOut_A when "00",
               DataOut_B when "01",
               Result when "10",
               X"00000000" when "11";
    
    Display : SSD port map(clk, mux, an, cat);
end Behavioral;
