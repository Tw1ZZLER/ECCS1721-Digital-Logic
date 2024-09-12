library IEEE;
  use IEEE.std_logic_1164.all;

entity half_comparator is
  port (
    a      : in    std_logic;
    b      : in    std_logic;
    eq_out  : out   std_logic;
    a_g_b_out : out   std_logic
  );
end half_comparator;

architecture behavioral of half_comparator is

begin

  eq_out  <= not(a xor b);
  a_g_b_out <= a;

end architecture behavioral;
