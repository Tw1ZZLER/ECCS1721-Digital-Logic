library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab09c is
  port (
    clk    : in    std_logic;
    load   : in    std_logic;
    shift  : in    std_logic;
    input1 : in    std_logic_vector(31 downto 0);
    input2 : in    std_logic_vector(5 downto 0);
    output : out   std_logic
  );
end lab09c;

architecture behavioral of lab09c is

  component comparator_6 is
    port (
      a     : in    std_logic_vector(5 downto 0);
      b     : in    std_logic_vector(5 downto 0);
      eq    : out   std_logic;
      a_g_b : out   std_logic
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

  signal shift_reg        : std_logic_vector(31 downto 0);
  signal accumulator      : std_logic_vector(5 downto 0);
  signal next_accumulator : std_logic_vector(5 downto 0);
  signal c_int            : std_logic_vector(5 downto 1);
  signal eq               : std_logic;
  signal a_g_b            : std_logic;

begin

  process (clk) begin
    if (clk'event and clk = '1') then
      if (load = '1') then
        shift_reg   <= input1;
        accumulator <= "000000";
      elsif (shift = '1') then -- right shift
        shift_reg(31) <= '0';
        for i in 30 downto 0 loop
          shift_reg(i) <= shift_reg(i + 1);
        end loop;
        accumulator <= next_accumulator;
      end if;
    end if;
  end process;

  -- 6-bit Ripple-Carry Adder
  ha0 : half_adder
    port map (
      a     => shift_reg(0),
      b     => accumulator(0),
      sum   => next_accumulator(0),
      c_out => c_int(1)
    );

  adder :
  for i in 1 to 4 generate
    ha : half_adder
      port map (
        a     => c_int(i),
        b     => accumulator(i),
        sum   => next_accumulator(i),
        c_out => c_int(i + 1)
      );
  end generate adder;

  next_accumulator(5) <= accumulator(5) xor c_int(5);

  -- 6-bit Comparator

  comp : comparator_6
    port map (
      a     => accumulator,
      b     => input2,
      eq    => eq,
      a_g_b => a_g_b
    );

  output <= eq or a_g_b;

end architecture behavioral;
