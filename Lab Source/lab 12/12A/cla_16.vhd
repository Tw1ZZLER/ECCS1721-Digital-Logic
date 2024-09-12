library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity cla_16 is
  port (
    a      : in    std_logic_vector(15 downto 0);
    b      : in    std_logic_vector(15 downto 0);
    c_in   : in    std_logic; -- carry in
    sum    : out   std_logic_vector(15 downto 0);
    c_out  : out   std_logic; -- carry out
    prop_g : out   std_logic; -- group propagate
    gen_g  : out   std_logic  -- group generate
  );
end cla_16;

architecture behavioral of cla_16 is

  component cla_4 is
    port (
      a      : in    std_logic_vector(3 downto 0);
      b      : in    std_logic_vector(3 downto 0);
      c_in   : in    std_logic; -- carry in
      sum    : out   std_logic_vector(3 downto 0);
      c_out  : out   std_logic; -- carry out
      prop_g : out   std_logic; -- group propagate
      gen_g  : out   std_logic  -- group generate
    );
  end component;

  component cla_group_logic is
    port (
      gen_i  : in    std_logic_vector(3 downto 0);
      prop_i : in    std_logic_vector(3 downto 0);
      c_in   : in    std_logic;
      c_i    : out   std_logic_vector(3 downto 1);
      c_out  : out   std_logic;
      prop_g : out   std_logic;
      gen_g  : out   std_logic
    );
  end component;

  signal gen_i, prop_i : std_logic_vector(3 downto 0); -- carry internal signals
  signal carry_i       : std_logic_vector(3 downto 0);

begin

  cla_gl_block : cla_group_logic
    port map (
      gen_i  => gen_i,
      prop_i => prop_i,
      c_in   => c_in,
      c_i    => carry_i(3 downto 1),
      c_out  => c_out,
      prop_g => prop_g,
      gen_g  => gen_g
    );

  carry_i(0) <= c_in;

  gen_child_clas :
  for i in 0 to 3 generate
    adder : cla_4
      port map (
        a      => a(((4 * i) + 3) downto (4 * i)),
        b      => b(((4 * i) + 3) downto (4 * i)),
        c_in   => carry_i(i),
        sum    => sum(((4 * i) + 3) downto (4 * i)),
        c_out  => open,
        prop_g => prop_i(i),
        gen_g  => gen_i(i)
      );
  end generate gen_child_clas; 

end architecture behavioral;
 