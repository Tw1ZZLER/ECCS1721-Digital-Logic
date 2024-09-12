library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab08c is
  port (
    clk        : in    std_logic;
    reset      : in    std_logic;
    switches   : in    std_logic_vector(15 downto 0);
    leds       : out   std_logic_vector(15 downto 0);
    segment    : out   std_logic_vector(7 downto 0);
    seg_select : out   std_logic_vector(3 downto 0)
  );
end lab08c;

architecture behavioral of lab08c is

  component display_controller is
    port (
      clk        : in    std_logic;
      reset      : in    std_logic;
      data       : in    std_logic_vector(15 downto 0);
      segment    : out   std_logic_vector(7 downto 0);
      seg_select : out   std_logic_vector(3 downto 0)
    );
  end component;

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

  signal input1 : std_logic_vector(7 downto 0);
  signal input2 : std_logic_vector(7 downto 0);

  signal not_input2 : std_logic_vector(7 downto 0);

  signal subtr_carry_in : std_logic;

  signal adder_carry : std_logic_vector(7 downto 0);
  signal subtr_carry : std_logic_vector(7 downto 0);

  signal adder_out : std_logic_vector(7 downto 0);
  signal subtr_out : std_logic_vector(7 downto 0);

  signal adder_carry_out : std_logic;
  signal subtr_carry_out : std_logic;

begin

  -- GPIO
  input1 <= switches(15 downto 8);
  input2 <= switches(7 downto 0);

  leds(15) <= adder_carry_out;
  leds(12) <= subtr_carry_out;

  -- 8-bit Ripple-Carry Adder
  ha : half_adder
    port map (
      a     => input1(0),
      b     => input2(0),
      sum   => adder_out(0),
      c_out => adder_carry(0)
    );

  adder :
  for i in 1 to 7 generate
    fa : full_adder
      port map (
        a     => input1(i),
        b     => input2(i),
        c_in  => adder_carry(i - 1),
        sum   => adder_out(i),
        c_out => adder_carry(i)
      );
  end generate adder;

  adder_carry_out <= adder_carry(7) xor input1(7) xor input2(7);
  -- 8-bit Ripple-Carry Subtractor

  subtr_carry_in <= '1';

  -- inverting the second input and adding 1 (the carry in) transforms
  -- the second input to its arithmetic negation in two's complement
  not_input2 <= not input2(7) & not input2(6) & not input2(5) & not input2(4) &
                not input2(3) & not input2(2) & not input2(1) & not input2(0);

  s_fa_in : full_adder
    port map (
      a     => input1(0),
      b     => not_input2(0),
      c_in  => subtr_carry_in,
      sum   => subtr_out(0),
      c_out => subtr_carry(0)
    );

  subtractor :
  for i in 1 to 7 generate
    s_fa : full_adder
      port map (
        a     => input1(i),
        b     => not_input2(i),
        c_in  => subtr_carry(i - 1),
        sum   => subtr_out(i),
        c_out => subtr_carry(i)
      );
  end generate subtractor;

  subtr_carry_out <= subtr_carry(7) xor input1(7) xor not_input2(7);

  -- display controller
  display : display_controller
    port map (
      clk        => clk,
      reset      => reset,
      data       => (adder_out & subtr_out),
      segment    => segment,
      seg_select => seg_select
    );

end architecture behavioral;
