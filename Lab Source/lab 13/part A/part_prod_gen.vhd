library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity partial_product_generator is
  port (
    input1 : in    std_logic_vector(7 downto 0);
    input2 : in    std_logic;
    output : out   std_logic_vector(7 downto 0)
  );
end partial_product_generator;

architecture behavioral of partial_product_generator is

begin

  gen_ppg :
  for i in 0 to 7 generate
    output(i) <= input1(i) and input2;
  end generate gen_ppg;

end architecture behavioral;
