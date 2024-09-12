library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab06b is
  port (
    clk        : in std_logic;
    reset      : in std_logic;
    switches   : in std_logic_vector(15 downto 0);
    segment    : out std_logic_vector(7 downto 0);
    seg_select : out std_logic_vector(3 downto 0)
  );
end lab06b;

architecture behavioral of lab06b is

  -- alias signal for brevity
  signal input : std_logic_vector(3 downto 0);

begin

  input <= switches(15 downto 12);

  -- hexadecimal to 7-segment conversion
  -- output is "ABCDEFGP" where A-G are cathodes A-G, and P is the decimal point
  -- see constraint file (lab06b.xdc) for more details
  segment <=  "11000000" when input = "0000" else
              "11111001" when input = "0001" else
              "10100100" when input = "0010" else
              "10110000" when input = "0011" else
              "10011001" when input = "0100" else
              "10010010" when input = "0101" else
              "10000010" when input = "0110" else
              "11111000" when input = "0111" else
              "10000000" when input = "1000" else
              "10010000" when input = "1001" else
              "10001000" when input = "1010" else
              "10000011" when input = "1011" else
              "11000110" when input = "1100" else
              "10100001" when input = "1101" else
              "10000110" when input = "1110" else
              "10001110";

  -- select leftmost digit of 7-segment display
  seg_select <= "0111";

end architecture behavioral;