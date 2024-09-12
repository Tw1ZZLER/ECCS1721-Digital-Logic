library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab08b is
  port (
    clk        : in std_logic;
    reset      : in std_logic;
    switches   : in std_logic_vector(15 downto 0);
    segment    : out std_logic_vector(7 downto 0);
    seg_select : out std_logic_vector(3 downto 0)
  );
end lab08b;

architecture behavioral of lab08b is

  type input_t is array(0 to 3) of std_logic_vector(3 downto 0);

  signal input : input_t;

  type display_t is array(0 to 3) of std_logic_vector(7 downto 0);

  signal display : display_t;

  signal counter      : unsigned(17 downto 0);
  signal next_counter : unsigned(17 downto 0);

  signal selected_seg      : unsigned(1 downto 0);
  signal next_selected_seg : unsigned(1 downto 0);

begin

  input(0) <= switches(15 downto 12);
  input(1) <= switches(11 downto 8);
  input(2) <= switches(7 downto 4);
  input(3) <= switches(3 downto 0);

  process (clk) begin
    if (clk'event and clk = '1') then
      if (reset = '1') then
        counter      <= "000000000000000000";
        selected_seg <= "00";
      else
        counter      <= next_counter;
        selected_seg <= next_selected_seg;
      end if;
    end if;
  end process;

  -- hexadecimal to 7-segment conversion
  -- output is "PGFEDCBA" where A-G are cathodes A-G, and P is the decimal point
  -- remember that the LEDs in the 7-segment display are active low
  -- see constraint file (lab08b.xdc) for more details
  gen_display :
  for i in 0 to 3 generate
    display(i) <= 
      "11000000" when input(i) = "0000" else
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

  next_counter      <= counter + 1;
  next_selected_seg <= selected_seg + 1 when counter = 0 else selected_seg;

  segment <= 
    display(0) when selected_seg = 0 else
    display(1) when selected_seg = 1 else
    display(2) when selected_seg = 2 else
    display(3);

  seg_select <= 
    "0111" when selected_seg = 0 else
    "1011" when selected_seg = 1 else
    "1101" when selected_seg = 2 else
    "1110";

end architecture behavioral;