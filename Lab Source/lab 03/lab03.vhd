library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab03 is
  port (
    x     : in    signed(19 downto 0);
    sin_x : out   signed(19 downto 0);
    cos_x : out   signed(19 downto 0)
  );
end lab03;

architecture behavioral of lab03 is

  type array_t is array (natural range <>) of signed(19 downto 0);

  type long_array_t is array (natural range <>) of signed(39 downto 0);

  signal x_r_sh                  : array_t(10 downto 1);
  signal x_div                   : array_t(10 downto 2);
  signal x_pow_n_over_fac_n      : long_array_t(10 downto 2);
  signal x_pow_n_over_fac_n_trnc : array_t(10 downto 2);

begin

  -- right shift x (divide by 2^1, 2^2, 2^3, ..., 2^10) and sign extend
  x_r_sh(1)  <= x(19) & x(19 downto 1);
  x_r_sh(2)  <= x(19) & x(19) & x(19 downto 2);
  x_r_sh(3)  <= x(19) & x(19) & x(19) & x(19 downto 3);
  x_r_sh(4)  <= x(19) & x(19) & x(19) & x(19) & x(19 downto 4);
  x_r_sh(5)  <= x(19) & x(19) & x(19) & x(19) & x(19) & x(19 downto 5);
  x_r_sh(6)  <= x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19 downto 6);
  x_r_sh(7)  <= x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19 downto 7);
  x_r_sh(8)  <= x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19 downto 8);
  x_r_sh(9)  <= x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19 downto 9);
  x_r_sh(10) <= x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19) & x(19 downto 10);

  -- calculate (x / 2), (x / 3), ..., (x / 10)
  x_div(2)  <= x_r_sh(1);
  x_div(3)  <= x_r_sh(2) + x_r_sh(4) + x_r_sh(6) + x_r_sh(8) + x_r_sh(10);
  x_div(4)  <= x_r_sh(2);
  x_div(5)  <= x_r_sh(3) + x_r_sh(4) + x_r_sh(7) + x_r_sh(8);
  x_div(6)  <= x_div(3)(19) & x_div(3)(19 downto 1);
  x_div(7)  <= x_r_sh(3) + x_r_sh(6) + x_r_sh(9);
  x_div(8)  <= x_r_sh(3);
  x_div(9)  <= x_r_sh(3) - x_r_sh(6) + x_r_sh(10);
  x_div(10) <= x_div(5)(19) & x_div(5)(19 downto 1);

  -- calculate terms of taylor series
  -- (x^2 / 2) = x^2 / 2!
  x_pow_n_over_fac_n(2)      <= x * x_div(2);
  x_pow_n_over_fac_n_trnc(2) <= x_pow_n_over_fac_n(2)(35 downto 16);

  -- (x^2 / 2) * (x / 3) = x^3 / 6 = x^3 / 3!
  x_pow_n_over_fac_n(3)      <= x_pow_n_over_fac_n_trnc(2) * x_div(3);
  x_pow_n_over_fac_n_trnc(3) <= x_pow_n_over_fac_n(3)(35 downto 16);

  -- (x^3 / 3!) * (x / 4) = x^4 / 4!
  x_pow_n_over_fac_n(4)      <= x_pow_n_over_fac_n_trnc(3) * x_div(4);
  x_pow_n_over_fac_n_trnc(4) <= x_pow_n_over_fac_n(4)(35 downto 16);

  -- (x^4 / 4!) * (x / 5) = x^5 / 5!
  x_pow_n_over_fac_n(5)      <= x_pow_n_over_fac_n_trnc(4) * x_div(5);
  x_pow_n_over_fac_n_trnc(5) <= x_pow_n_over_fac_n(5)(35 downto 16);

  -- (x^5 / 5!) * (x / 6) = x^6 / 6!
  x_pow_n_over_fac_n(6)      <= x_pow_n_over_fac_n_trnc(5) * x_div(6);
  x_pow_n_over_fac_n_trnc(6) <= x_pow_n_over_fac_n(6)(35 downto 16);

  -- x^7 / 7!
  x_pow_n_over_fac_n(7)      <= x_pow_n_over_fac_n_trnc(6) * x_div(7);
  x_pow_n_over_fac_n_trnc(7) <= x_pow_n_over_fac_n(7)(35 downto 16);

  -- x^8 / 8!
  x_pow_n_over_fac_n(8)      <= x_pow_n_over_fac_n_trnc(7) * x_div(8);
  x_pow_n_over_fac_n_trnc(8) <= x_pow_n_over_fac_n(8)(35 downto 16);

  -- x^9 / 9!
  x_pow_n_over_fac_n(9)      <= x_pow_n_over_fac_n_trnc(8) * x_div(9);
  x_pow_n_over_fac_n_trnc(9) <= x_pow_n_over_fac_n(9)(35 downto 16);

  -- x^10 / 10!
  x_pow_n_over_fac_n(10)      <= x_pow_n_over_fac_n_trnc(9) * x_div(10);
  x_pow_n_over_fac_n_trnc(10) <= x_pow_n_over_fac_n(10)(35 downto 16);

  -- construct taylor series and assign outputs
  -- 1 - (x^2 / 2!) + (x^4 / 4!) - (x^6 / 6!) + (x^8 / 8!) - (x^10 / 10!)
  cos_x <= "00010000000000000000" - x_pow_n_over_fac_n_trnc(2) + x_pow_n_over_fac_n_trnc(4) - x_pow_n_over_fac_n_trnc(6) + x_pow_n_over_fac_n_trnc(8) - x_pow_n_over_fac_n_trnc(10);

  -- x - (x^3 / 3!) + (x^5 / 5!) - (x^7 / 7!) + (x^9 / 9!)
  sin_x <= x - x_pow_n_over_fac_n_trnc(3) + x_pow_n_over_fac_n_trnc(5) - x_pow_n_over_fac_n_trnc(7) + x_pow_n_over_fac_n_trnc(9);

end architecture behavioral;
