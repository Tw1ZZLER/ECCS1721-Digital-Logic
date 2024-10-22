library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity adder_8 is
  port (
    addend : in    std_logic_vector(7 downto 0);
    augend : in    std_logic_vector(7 downto 0);
    c_in   : in    std_logic;
    sum    : out   std_logic_vector(7 downto 0)
  );
end adder_8;

architecture structural of adder_8 is

  component full_adder is
    port (
      a     : in    std_logic;
      b     : in    std_logic;
      c_in  : in    std_logic;
      sum   : out   std_logic;
      c_out : out   std_logic
    );
  end component;

  signal carry : std_logic_vector(7 downto 0);

begin

  fa0 : full_adder
    port map (
      a     => addend(0),
      b     => augend(0),
      c_in  => c_in,
      sum   => sum(0),
      c_out => carry(0)
    );

  adder :
  for i in 1 to 7 generate
    fa : full_adder
      port map (
        a     => addend(i),
        b     => augend(i),
        c_in  => carry(i - 1),
        sum   => sum(i),
        c_out => carry(i)
      );
  end generate adder;

end architecture structural;
