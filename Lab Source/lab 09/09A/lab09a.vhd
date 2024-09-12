library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab09a is
  port (
    clk     : in    std_logic;
    reset   : in    std_logic;
    input1  : in    std_logic_vector(7 downto 0);
    input2  : in    std_logic_vector(7 downto 0);
    add_out : out   std_logic_vector(8 downto 0);
    sub_out : out   std_logic_vector(8 downto 0)
  );
end lab09a;

architecture behavioral of lab09a is

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

  signal operand1 : std_logic_vector(7 downto 0);
  signal operand2 : std_logic_vector(7 downto 0);

  signal not_input2 : std_logic_vector(7 downto 0);

  signal subtr_carry_in : std_logic;

  signal adder_carry : std_logic_vector(7 downto 0);
  signal subtr_carry : std_logic_vector(7 downto 0);

  signal adder_out : std_logic_vector(7 downto 0);
  signal subtr_out : std_logic_vector(7 downto 0);

  signal adder_carry_out : std_logic;
  signal subtr_carry_out : std_logic;

begin

  process (clk) begin
    if (clk'event and clk = '1') then
      if (reset = '1') then
        operand1 <= "00000000";
        operand2 <= "00000000";
        add_out  <= "000000000";
        sub_out  <= "000000000";
      else
        operand1 <= input1;
        operand2 <= input2;
        add_out  <= adder_carry_out & adder_out;
        sub_out  <= subtr_carry_out & subtr_out;
      end if;
    end if;
  end process;

  -- 8-bit Ripple-Carry Adder
  ha : half_adder
    port map (
      a     => operand1(0),
      b     => operand2(0),
      sum   => adder_out(0),
      c_out => adder_carry(0)
    );

  adder :
  for i in 1 to 7 generate
    fa : full_adder
      port map (
        a     => operand1(i),
        b     => operand2(i),
        c_in  => adder_carry(i - 1),
        sum   => adder_out(i),
        c_out => adder_carry(i)
      );
  end generate adder;

  -- sign extension
  adder_carry_out <= adder_carry(7) xor operand1(7) xor operand2(7);


  -- 8-bit Ripple-Carry Subtractor

  subtr_carry_in <= '1';

  -- inverting the second input and adding 1 (the carry in) transforms
  -- the second input to its arithmetic negation in two's complement
  not_input2 <= not operand2(7) & not operand2(6) & not operand2(5) & not operand2(4) &
                not operand2(3) & not operand2(2) & not operand2(1) & not operand2(0);

  s_fa_in : full_adder
    port map (
      a     => operand1(0),
      b     => not_input2(0),
      c_in  => subtr_carry_in,
      sum   => subtr_out(0),
      c_out => subtr_carry(0)
    );

  subtractor :
  for i in 1 to 7 generate
    s_fa : full_adder
      port map (
        a     => operand1(i),
        b     => not_input2(i),
        c_in  => subtr_carry(i - 1),
        sum   => subtr_out(i),
        c_out => subtr_carry(i)
      );
  end generate subtractor;

  -- sign extension
  subtr_carry_out <= subtr_carry(7) xor operand1(7) xor not_input2(7);

end architecture behavioral;
