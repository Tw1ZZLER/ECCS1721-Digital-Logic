library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity display_controller is
  port (
    selected_seg: in   unsigned(1 downto 0);
    data       : in    std_logic_vector(15 downto 0);
    segment    : out   std_logic_vector(7 downto 0);
    seg_select : out   std_logic_vector(3 downto 0)
  );
end display_controller;

architecture behavioral of display_controller is

  type input_t is array(0 to 3) of std_logic_vector(3 downto 0);

  signal input : input_t;

  type display_t is array(0 to 3) of std_logic_vector(7 downto 0);

  signal display : display_t;

  

begin

  input(0) <= data(15 downto 12);
  input(1) <= data(11 downto 8);
  input(2) <= data(7 downto 4);
  input(3) <= data(3 downto 0);



  -- hexadecimal to 7-segment conversion
  -- output is "PGFEDCBA" where A-G are cathodes A-G, and P is the decimal point
  -- remember that the LEDs in the 7-segment display are active low

  display(0) <= "11000000" when input(0) = "0000" else
                "11111001" when input(0) = "0001" else
                "10100100" when input(0) = "0010" else
                "10110000" when input(0) = "0011" else
                "10011001" when input(0) = "0100" else
                "10010010" when input(0) = "0101" else
                "10000010" when input(0) = "0110" else
                "11111000" when input(0) = "0111" else
                "10000000" when input(0) = "1000" else
                "10010000" when input(0) = "1001" else
                "10001000" when input(0) = "1010" else
                "10000011" when input(0) = "1011" else
                "11000110" when input(0) = "1100" else
                "10100001" when input(0) = "1101" else
                "10000110" when input(0) = "1110" else
                "10001110";

  display(1) <= "01000000" when input(1) = "0000" else
                "01111001" when input(1) = "0001" else
                "00100100" when input(1) = "0010" else
                "00110000" when input(1) = "0011" else
                "00011001" when input(1) = "0100" else
                "00010010" when input(1) = "0101" else
                "00000010" when input(1) = "0110" else
                "01111000" when input(1) = "0111" else
                "00000000" when input(1) = "1000" else
                "00010000" when input(1) = "1001" else
                "00001000" when input(1) = "1010" else
                "00000011" when input(1) = "1011" else
                "01000110" when input(1) = "1100" else
                "00100001" when input(1) = "1101" else
                "00000110" when input(1) = "1110" else
                "00001110";

  gen_display :
  for i in 2 to 3 generate
    display(i) <= "11000000" when input(i) = "0000" else
                  "11111001" when input(i) = "0001" else
                  "10100100" when input(i) = "0010" else
                  "10110000" when input(i) = "0011" else
                  "10011001" when input(i) = "0100" else
                  "10010010" when input(i) = "0101" else
                  "10000010" when input(i) = "0110" else
                  "11111000" when input(i) = "0111" else
                  "10000000" when input(i) = "1000" else
                  "10010000" when input(i) = "1001" else
                  "10001000" when input(i) = "1010" else
                  "10000011" when input(i) = "1011" else
                  "11000110" when input(i) = "1100" else
                  "10100001" when input(i) = "1101" else
                  "10000110" when input(i) = "1110" else
                  "10001110";
  end generate gen_display;

  segment <= display(0) when selected_seg = 0 else
             display(1) when selected_seg = 1 else
             display(2) when selected_seg = 2 else
             display(3);

  seg_select <= "0111" when selected_seg = 0 else
                "1011" when selected_seg = 1 else
                "1101" when selected_seg = 2 else
                "1110";

end architecture behavioral;
