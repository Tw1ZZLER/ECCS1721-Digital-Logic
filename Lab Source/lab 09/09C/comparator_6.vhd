library IEEE;
  use IEEE.std_logic_1164.all;

entity comparator_6 is
  port (
    a : in    std_logic_vector(5 downto 0);
    b : in    std_logic_vector(5 downto 0);
    eq     : out   std_logic;
    a_g_b    : out   std_logic
  );
end comparator_6;

architecture structural of comparator_6 is

  component full_comparator is
    port (
      a      : in    std_logic;
      b      : in    std_logic;
      eq_in   : in    std_logic;
      a_g_b_in  : in    std_logic;
      eq_out  : out   std_logic;
      a_g_b_out : out   std_logic
    );
  end component;

  component half_comparator is
    port (
      a      : in    std_logic;
      b      : in    std_logic;
      eq_out  : out   std_logic;
      a_g_b_out : out   std_logic
    );
  end component;

  signal eq_buf  : std_logic_vector(5 downto 0);
  signal a_g_b_buf : std_logic_vector(5 downto 0);

begin

  hc: half_comparator port map(a => a(5), b => b(5), eq_out => eq_buf(5), a_g_b_out => a_g_b_buf(5));

  full_comparators:
  for i in 0 to 4 generate

    fcs: full_comparator port map(a => a(i), b => b(i), eq_in => eq_buf(i + 1), a_g_b_in => a_g_b_buf(i + 1), eq_out => eq_buf(i), a_g_b_out => a_g_b_buf(i));

  end generate full_comparators;

  eq <= eq_buf(0);
  a_g_b <= a_g_b_buf(0);

end architecture structural;
