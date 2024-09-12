library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity lab07d is
  generic (
    G_n     : integer := 16; -- Input length is n
    G_log2n : integer := 4;  -- Base 2 Logarithm of input length n; i.e., output length
    G_q     : integer := 4;  -- q is the least power of 2 greater than sqrt(n); i.e., 2^(ceil(log_2(sqrt(n)))
    G_log2q : integer := 2;  -- Base 2 Logarithm of q
    G_k     : integer := 4;  -- k is defined as n/q, if n is a perfect square, then k = sqrt(n) = q
    G_log2k : integer := 2   -- Base 2 Logarithm of k
  );
  port (
    switches   : in    std_logic_vector(G_n - 1 downto 0);
    leds       : out   std_logic_vector(15 downto 0);
    segment    : out   std_logic_vector(7 downto 0);
    seg_select : out   std_logic_vector(3 downto 0)
  );
end lab07d;

architecture behavioral of lab07d is

  signal input  : std_logic_vector(G_n - 1 downto 0);
  signal output : std_logic_vector(G_log2n - 1 downto 0);
  signal valid  : std_logic;

  component priority_encoder_4 is
    port (
      input  : in    std_logic_vector(G_k - 1 downto 0);
      output : out   std_logic_vector(G_log2k - 1 downto 0)
    );
  end component;

  signal slice_or : std_logic_vector(G_k - 1 downto 0);     -- there should be `k` or gates with `q` inputs each.
  signal c_output : std_logic_vector(G_log2k - 1 downto 0); -- coarse encoder output, select input signal for mux
  signal f_input  : std_logic_vector(G_q - 1 downto 0);     -- fine encoder input
  signal f_output : std_logic_vector(G_log2q - 1 downto 0); -- fine encoder output

begin

  -- GPIO Mapping Logic

  input    <= switches;
  leds(15) <= valid;

  -- Priority Encoder Logic

  slice_or(3) <= input(15) or input(14) or input(13) or input(12);
  slice_or(2) <= input(11) or input(10) or input(9) or input(8);
  slice_or(1) <= input(7) or input(6) or input(5) or input(4);
  slice_or(0) <= input(3) or input(2) or input(1) or input(0);

  coarse_encoder : priority_encoder_4
    port map (
      input  => slice_or,
      output => c_output
    );

  f_input <= input(15 downto 12) when c_output = "11" else
             input(11 downto 8)  when c_output = "10" else
             input(7 downto 4)   when c_output = "1"  else
             input(3 downto 0);

  fine_encoder : priority_encoder_4
    port map (
      input  => f_input,
      output => f_output
    );

  output <= c_output & f_output;

  valid <= slice_or(3) or slice_or(2) or slice_or(1) or slice_or(0);

  -- Seven-Segment Display Logic

  -- segment output is "PGFEDCBA" where A-G are cathodes A-G, and P is the decimal point
  -- remember that the LEDs in the 7-segment display are active low
  segment <= "10111111" when valid = '0' else
             "11000000" when output = "0000" else
             "11111001" when output = "0001" else
             "10100100" when output = "0010" else
             "10110000" when output = "0011" else
             "10011001" when output = "0100" else
             "10010010" when output = "0101" else
             "10000010" when output = "0110" else
             "11111000" when output = "0111" else
             "10000000" when output = "1000" else
             "10010000" when output = "1001" else
             "10001000" when output = "1010" else
             "10000011" when output = "1011" else
             "11000110" when output = "1100" else
             "10100001" when output = "1101" else
             "10000110" when output = "1110" else
             "10001110" when output = "1111" else
             "11111111";

  -- select leftmost digit of 7-segment display
  seg_select <= "0111";

end architecture behavioral;
