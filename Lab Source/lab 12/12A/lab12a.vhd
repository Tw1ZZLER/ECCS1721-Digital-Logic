library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab12a is
  generic (
    G_size : integer := 4
  );
  port (
    clk        : in    std_logic;
    reset      : in    std_logic;
    btn_left   : in    std_logic;
    btn_right  : in    std_logic;
    switches   : in    std_logic_vector(15 downto 0);
    leds       : out   std_logic_vector(15 downto 0);
    segment    : out   std_logic_vector(7 downto 0);
    seg_select : out   std_logic_vector(3 downto 0)
  );
end lab12a;

architecture behavioral of lab12a is

  component display_controller is
    port (
      clk        : in    std_logic;
      reset      : in    std_logic;
      data       : in    std_logic_vector(15 downto 0);
      segment    : out   std_logic_vector(7 downto 0);
      seg_select : out   std_logic_vector(3 downto 0)
    );
  end component;

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

  component cla_16 is
    port (
      a      : in    std_logic_vector(15 downto 0);
      b      : in    std_logic_vector(15 downto 0);
      c_in   : in    std_logic; -- carry in
      sum    : out   std_logic_vector(15 downto 0);
      c_out  : out   std_logic; -- carry out
      prop_g : out   std_logic; -- group propagate
      gen_g  : out   std_logic  -- group generate
    );
  end component;

  signal input1 : std_logic_vector(G_size - 1 downto 0) := (others => '0');
  signal input2 : std_logic_vector(G_size - 1 downto 0) := (others => '0');

  signal sum  : std_logic_vector(G_size - 1 downto 0);
  signal display_in : std_logic_vector(15 downto 0);

  signal c_out : std_logic;

begin

  -- 4-bit CLA
  input1 <= switches(7 downto 4);
  input2 <= switches(3 downto 0);
  display_in <= (4 => c_out, 3 => sum(3), 2 => sum(2), 1 => sum(1), 0 => sum(0), others => '0');
  leds <= (others => '0');

  adder_4 : cla_4
    port map (
      a      => input1,
      b      => input2,
      c_in   => '0',
      sum    => sum,
      c_out  => c_out,
      prop_g => open,
      gen_g  => open
    );


  -- 16-bit CLA
  -- process (clk, reset) begin
  --   if (reset = '1') then
  --     input1 <= (others => '0');
  --     input2 <= (others => '0');
  --   elsif (clk'event and clk = '1') then
  --     if (btn_left = '1') then
  --       input1 <= switches(15 downto 0);
  --     end if;
  --     if (btn_right = '1') then
  --       input2 <= switches(15 downto 0);
  --     end if;
  --   end if;
  -- end process;
  -- display_in <= sum;
  -- leds <= (15 => c_out, others => '0');

  -- adder_16 : cla_16
  --   port map (
  --     a      => input1,
  --     b      => input2,
  --     c_in   => '0',
  --     sum    => sum,
  --     c_out  => c_out,
  --     prop_g => open,
  --     gen_g  => open
  --   );

  -- display controller
  display : display_controller
    port map (
      clk        => clk,
      reset      => reset,
      data       => display_in,
      segment    => segment,
      seg_select => seg_select
    );

end architecture behavioral;
