library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab04 is
  port (
    f1 : in    signed(3 downto 0); -- fraction part of first number
    e1 : in    signed(3 downto 0); -- exponent part of first number
    f2 : in    signed(3 downto 0); -- fraction part of second number
    e2 : in    signed(3 downto 0); -- exponent part of second number
    p  : out   signed(7 downto 0); -- "product" f1 * (1 / f2)
    s  : out   signed(4 downto 0)  -- "sum" e1 - e2 + a
  );
end lab04;

architecture behavioral of lab04 is

  signal f2_recip : signed(3 downto 0); -- reciprocal of f2, (1 / f2)
  signal norm     : signed(4 downto 0); -- normalization factor 'a'
  signal e1_ext   : signed(4 downto 0); -- sign extension of exponent part of first number
  signal e2_ext   : signed(4 downto 0); -- sign extension of exponent part of second number

begin

  -- lookup tables for reciprocal and normalization factor
  f2_recip <= "0100" when f2 = "0100" else
              "0111" when f2 = "0101" else
              "0110" when f2 = "0110" else
              "0101" when f2 = "0111" else
              "1000" when f2 = "1000" else
              "1011" when f2 = "1001" else
              "1010" when f2 = "1010" else
              "1001";

  norm <= "00010" when f2 = "0100" else
          "00001" when f2 = "0101" else
          "00001" when f2 = "0110" else
          "00001" when f2 = "0111" else
          "00000" when f2 = "1000" else
          "00001" when f2 = "1001" else
          "00001" when f2 = "1010" else
          "00001";

  -- calculate result
  p <= f1 * f2_recip;

  e1_ext <= e1(3) & e1(3 downto 0);
  e2_ext <= e2(3) & e2(3 downto 0);

  s <= e1_ext - e2_ext + norm;

end architecture behavioral;
