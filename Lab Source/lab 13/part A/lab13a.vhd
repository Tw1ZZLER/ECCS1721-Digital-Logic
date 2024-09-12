library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab13a is
  port (
    clk          : in    std_logic;
    reset        : in    std_logic;
    multiplicand : in    std_logic_vector(7 downto 0);
    multiplier   : in    std_logic_vector(7 downto 0);
    segment      : out   std_logic_vector(7 downto 0);
    seg_select   : out   std_logic_vector(3 downto 0)
  );
end lab13a;

architecture behavioral of lab13a is

  component display_controller is
    port (
      clk        : in    std_logic;
      reset      : in    std_logic;
      data       : in    std_logic_vector(15 downto 0);
      segment    : out   std_logic_vector(7 downto 0);
      seg_select : out   std_logic_vector(3 downto 0)
    );
  end component;

  component adder_9 is
    generic (
      use_carry_in : boolean := true
    );
    port (
      addend : in    std_logic_vector(8 downto 0);
      augend : in    std_logic_vector(8 downto 0);
      c_in   : in    std_logic;
      sum    : out   std_logic_vector(8 downto 0)
    );
  end component;

  component partial_product_generator is
    port (
      input1 : in    std_logic_vector(7 downto 0);
      input2 : in    std_logic;
      output : out   std_logic_vector(7 downto 0)
    );
  end component;

  component sign_magnitude is
    port (
      clk    : in    std_logic;
      reset  : in    std_logic;
      input  : in    std_logic_vector(15 downto 0);
      output : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal sm_output : std_logic_vector(15 downto 0);

  type arr8x8_t is array(0 to 7) of std_logic_vector(7 downto 0);

  type arr7x9_t is array(0 to 6) of std_logic_vector(8 downto 0);

  signal product : std_logic_vector(15 downto 0);

  signal part_prod : arr8x8_t;

  signal not_md : std_logic_vector(7 downto 0); -- inverted multiplicand

  signal sum : arr7x9_t;

  signal addend_adder : arr7x9_t;
  signal augend_adder : arr7x9_t;

begin

  -- Define arguments for each adder using shifts and sign extension
  -- ex. `addend_adder(0)` is the addend for adder 0, etc.
  addend_adder(0) <= part_prod(0)(7) & part_prod(0)(7) & part_prod(0)(7 downto 1);
  augend_adder(0) <= part_prod(1)(7) & part_prod(1);

  addend_adder(1) <= sum(0)(8) & sum(0)(8 downto 1);
  augend_adder(1) <= part_prod(2)(7) & part_prod(2);

  addend_adder(2) <= sum(1)(8) & sum(1)(8 downto 1);
  augend_adder(2) <= part_prod(3)(7) & part_prod(3);

  addend_adder(3) <= sum(2)(8) & sum(2)(8 downto 1);
  augend_adder(3) <= part_prod(4)(7) & part_prod(4);

  addend_adder(4) <= sum(3)(8) & sum(3)(8 downto 1);
  augend_adder(4) <= part_prod(5)(7) & part_prod(5);

  addend_adder(5) <= sum(4)(8) & sum(4)(8 downto 1);
  augend_adder(5) <= part_prod(6)(7) & part_prod(6);

  addend_adder(6) <= sum(5)(8) & sum(5)(8 downto 1);
  augend_adder(6) <= part_prod(7)(7) & part_prod(7);

  -- inverting the multiplicand and adding 1 (the carry in) transforms
  -- the multiplicand to its arithmetic negation in two's complement
  not_md <= not multiplicand(7) & not multiplicand(6) & not multiplicand(5) &
            not multiplicand(4) & not multiplicand(3) & not multiplicand(2) &
            not multiplicand(1) & not multiplicand(0);

  -- generate partial product generators
  gen_ppgs :
  for i in 0 to 6 generate
    ppg : partial_product_generator
      port map (
        input1 => multiplicand,
        input2 => multiplier(i),
        output => part_prod(i)
      );

  end generate gen_ppgs;

  last_ppg : partial_product_generator
    port map (
      input1 => not_md,
      input2 => multiplier(7),
      output => part_prod(7)
    );

  -- generate 9-bit adders
  gen_a9s :
  for i in 0 to 5 generate
    a9 : adder_9
      generic map (
        use_carry_in => false
      )
      port map (
        addend => addend_adder(i),
        augend => augend_adder(i),
        c_in   => '-',
        sum    => sum(i)
      );
  end generate gen_a9s;

  last_a9 : adder_9
    generic map (
      use_carry_in => true
    )
    port map (
      addend => addend_adder(6),
      augend => augend_adder(6),
      c_in   => multiplier(7),
      sum    => sum(6)
    );

  -- generate output (product)
  product(0) <= part_prod(0)(0);

  gen_prod :
  for i in 1 to 6 generate
    product(i) <= sum(i - 1)(0);
  end generate gen_prod;

  product(15 downto 7) <= sum(6);

  sm : sign_magnitude
    port map (
      clk    => clk,
      reset  => reset,
      input  => product,
      output => sm_output
    );

  -- instantiate display controller
  display : display_controller
    port map (
      clk        => clk,
      reset      => reset,
      data       => sm_output,
      segment    => segment,
      seg_select => seg_select
    );

end architecture behavioral;
