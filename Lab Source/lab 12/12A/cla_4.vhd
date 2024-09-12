library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity cla_4 is
  port (
    a      : in    std_logic_vector(3 downto 0);
    b      : in    std_logic_vector(3 downto 0);
    c_in   : in    std_logic; -- carry in
    sum    : out   std_logic_vector(3 downto 0);
    c_out  : out   std_logic; -- carry out
    prop_g : out   std_logic; -- group propagate
    gen_g  : out   std_logic  -- group generate
  );
end cla_4;

architecture behavioral of cla_4 is

  component partial_full_adder is
    port (
      a : in    std_logic;
      b : in    std_logic;
      c : in    std_logic;

      g : out   std_logic;
      p : out   std_logic;
      s : out   std_logic
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

  gen_pfas : 
  for i in 0 to 3 generate
    pfa : partial_full_adder
      port map (
        a => a(i),
        b => b(i),
        c => carry_i(i),

        g => gen_i(i),
        p => prop_i(i),
        s => sum(i)
      );
  end generate gen_pfas; 
 
end architecture behavioral;
 