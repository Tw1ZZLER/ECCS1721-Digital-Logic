-------------------------------------------------------------------------------------
-- priority_encoder_64_2l.vhd
-------------------------------------------------------------------------------------
-- Authors:     Maxwell Phillips
-- Copyright:   Ohio Northern University, 2023.
-- License:     GPL v3
-- Description: Two-level priority encoder.
-- Precision:   64 bits.
-------------------------------------------------------------------------------------
--
-- Returns the floor of the base 2 logarithm of the input,
-- or alternatively, the position of the most significant high bit (MSHB).
-- Composed of a 'coarse' and 'fine' level.
-- The coarse encoder determines which `q` bit slice the MSHB is in.
-- The fine encoder determines where in that slice the MSHB is.
-- Combined, their outputs are equal to the expected primary output.
--
-------------------------------------------------------------------------------------
-- Generics
-------------------------------------------------------------------------------------
--
-- [G_n]: Input length `n`. For instance, the size of the multiplier in 2LMR.
--
-- [G_log_2_n]: Base 2 Logarithm of input length `n`; i.e., output length
--
-- [G_q]: The least power of 2 greater than sqrt(n); i.e., 2^(ceil(log_2(sqrt(n)))
--
-- [G_log_2_q]: Base 2 logarithm of `q` (# of bits required to represent q)
--
-- [G_k]: Defined as n/q. If n is a perfect square, then k = sqrt(n) = q.
--
-- [G_log_2_k]: Base 2 logarithm of `k`, and output size of the coarse encoder.
--
-------------------------------------------------------------------------------------
-- Ports
-------------------------------------------------------------------------------------
--
-- [input]: Self explanatory. Has size [G_n].
--
-- [output]: Base 2 logarithm or position of MSHB in [input].
--
-------------------------------------------------------------------------------------

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity priority_encoder_64 is
  generic (
    G_n       : integer := 64; -- Input length is n
    G_log_2_n : integer := 6;  -- Base 2 Logarithm of input length n; i.e., output length
    G_q       : integer := 8;  -- q is the least power of 2 greater than sqrt(n); i.e., 2^(ceil(log_2(sqrt(n)))
    G_log_2_q : integer := 3;  -- Base 2 Logarithm of q
    G_k       : integer := 8;  -- k is defined as n/q, if n is a perfect square, then k = sqrt(n) = q
    G_log_2_k : integer := 3   -- Base 2 Logarithm of k
  );
  port (
    input  : in    std_logic_vector(G_n - 1 downto 0);
    output : out   std_logic_vector(G_log_2_n - 1 downto 0);
    valid  : out   std_logic
  );
end priority_encoder_64;

architecture behavioral of priority_encoder_64 is

  component priority_encoder_8 is
    port ( 
      input  : in    std_logic_vector(7 downto 0);
      output : out   std_logic_vector(2 downto 0)
    );
  end component;

  component mux_generic is
    generic (
      G_entries     : natural;
      G_entry_width : natural
    );
    port (
      signal input  : in    std_logic_vector(G_n - 1 downto 0);
      signal sel    : in    std_logic_vector(natural(G_log_2_k) - 1 downto 0);
      signal output : out   std_logic_vector(G_entry_width - 1 downto 0)
    );
  end component;

  signal slice_or : std_logic_vector(G_k - 1 downto 0);       -- there should be `k` or gates with q inputs each. last is effectively unused
  signal c_output : std_logic_vector(G_log_2_k - 1 downto 0); -- coarse encoder output, select input signal for mux
  signal f_input  : std_logic_vector(G_q - 1 downto 0);       -- fine encoder input
  signal f_output : std_logic_vector(G_log_2_q - 1 downto 0); -- fine encoder output

begin

  gen_slice_or : 
  for i in 0 to (G_k - 1) generate
    slice_or((G_k - 1) - i) <= or input(((G_n - 1) - (G_q * i)) downto (G_n - (G_q * (i + 1))));
  end generate gen_slice_or;

  valid <= or slice_or;

  coarse_encoder : priority_encoder_8
    port map (
      input  => slice_or,
      output => c_output
    );

  mux : mux_generic
    generic map (
      G_entries     => G_k,
      G_entry_width => G_q
    )
    port map (
      input  => input,
      sel    => c_output,
      output => f_input
    );
  
  fine_encoder : priority_encoder_8
    port map (
      input  => f_input,
      output => f_output
    );

  output(G_log_2_n - 1 downto G_log_2_q) <= c_output;
  output(G_log_2_q - 1 downto 0) <= f_output;
  
end architecture behavioral;
