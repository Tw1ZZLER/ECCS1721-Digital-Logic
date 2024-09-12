library IEEE;
  use IEEE.std_logic_1164.all;

entity full_comparator is
  port (
    a      : in    std_logic;
    b      : in    std_logic;
    eq_in   : in    std_logic;
    a_g_b_in  : in    std_logic;
    eq_out  : out   std_logic;
    a_g_b_out : out   std_logic
  );
end full_comparator;

architecture behavioral of full_comparator is

begin

  eq_out  <= not(a xor b) and eq_in;
  a_g_b_out <= a when eq_in = '1' else a_g_b_in;

end architecture behavioral;
