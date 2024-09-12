library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity adder_9 is
  generic (
    use_carry_in : boolean := false
  );
  port (
    addend : in    std_logic_vector(8 downto 0);
    augend : in    std_logic_vector(8 downto 0);
    c_in   : in    std_logic;
    sum    : out   std_logic_vector(8 downto 0)
  );
end adder_9;

architecture behavioral of adder_9 is

  component half_adder is
    port (
      a     : in    std_logic;
      b     : in    std_logic;
      sum   : out   std_logic;
      c_out : out   std_logic
    );
  end component;

  component full_adder is
    port (
      a     : in    std_logic;
      b     : in    std_logic;
      c_in  : in    std_logic;
      sum   : out   std_logic;
      c_out : out   std_logic
    );
  end component;

  signal carry : std_logic_vector(8 downto 0);

begin

  -- Decide whether to generate half adder or full adder
  gen_ha :
  if not use_carry_in generate

    ha : half_adder
      port map (
        a     => addend(0),
        b     => augend(0),
        sum   => sum(0),
        c_out => carry(0)
      );

  end generate gen_ha;

  gen_fa :
  if use_carry_in generate

    fa0 : full_adder
      port map (
        a     => addend(0),
        b     => augend(0),
        c_in  => c_in,
        sum   => sum(0),
        c_out => carry(0)
      );

  end generate gen_fa;

  -- Generate remainder of 9-bit adder
  adder :
  for i in 1 to 8 generate
    fa : full_adder
      port map (
        a     => addend(i),
        b     => augend(i),
        c_in  => carry(i - 1),
        sum   => sum(i),
        c_out => carry(i)
      );
  end generate adder;

end architecture behavioral;
