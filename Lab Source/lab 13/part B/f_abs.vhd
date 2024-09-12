library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity f_abs is
  port (
    sign : in    std_logic;
    a    : in    std_logic;
    c_in  : in    std_logic;
    a_out : out   std_logic;
    c_out : out   std_logic
  );
end f_abs;

architecture behavioral of f_abs is

begin

  c_out <= a or c_in;
  a_out <= a xor (c_in and sign);

end architecture behavioral;
