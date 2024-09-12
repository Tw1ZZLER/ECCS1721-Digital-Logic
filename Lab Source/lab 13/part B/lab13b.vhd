library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab13b is
  port (
    clk          : in    std_logic;
    reset        : in    std_logic;
    multiplicand : in    std_logic_vector(7 downto 0);
    multiplier   : in    std_logic_vector(7 downto 0);
    segment      : out   std_logic_vector(7 downto 0);
    seg_select   : out   std_logic_vector(3 downto 0);
    done         : out   std_logic
  );
end lab13b;

architecture structural of lab13b is

  component display_controller is
    port (
      clk        : in    std_logic;
      reset      : in    std_logic;
      data       : in    std_logic_vector(15 downto 0);
      segment    : out   std_logic_vector(7 downto 0);
      seg_select : out   std_logic_vector(3 downto 0)
    );
  end component;

  component dataflow is
    port (
      clk          : in    std_logic;
      reset        : in    std_logic;
      load         : in    std_logic;
      sh           : in    std_logic;
      add_sh       : in    std_logic;
      cm           : in    std_logic;
      multiplier   : in    std_logic_vector(7 downto 0);
      multiplicand : in    std_logic_vector(7 downto 0);
      output       : out   std_logic_vector(15 downto 0);
      m            : out   std_logic
    );
  end component;

  component controller is
    port (
      clk    : in    std_logic;
      rst_in : in    std_logic;
      m      : in    std_logic;
      done   : out   std_logic;
      rst_df : out   std_logic;
      load   : out   std_logic;
      sh     : out   std_logic;
      add_sh : out   std_logic;
      cm     : out   std_logic
    );
  end component;

  component sign_magnitude_f is
    port (
      input     : in    std_logic_vector(15 downto 0);
      sign      : out   std_logic;
      magnitude : out   std_logic_vector(14 downto 0)
    );
  end component;

  signal display_in : std_logic_vector(15 downto 0);
  signal sign       : std_logic;
  signal magnitude  : std_logic_vector(14 downto 0);
  signal m          : std_logic;
  signal rst_df     : std_logic;
  signal load       : std_logic;
  signal sh         : std_logic;
  signal add_sh     : std_logic;
  signal cm         : std_logic;
  signal df_out     : std_logic_vector(15 downto 0);

begin

  display_in <= sign & magnitude;

  c1 : controller
    port map (
      clk    => clk,
      rst_in => reset,
      m      => m,
      done   => done,
      rst_df => rst_df,
      load   => load,
      sh     => sh,
      add_sh => add_sh,
      cm     => cm
    );

  d1 : dataflow
    port map (
      clk          => clk,
      reset        => rst_df,
      load         => load,
      sh           => sh,
      add_sh       => add_sh,
      cm           => cm,
      multiplier   => multiplier,
      multiplicand => multiplicand,
      output       => df_out,
      m            => m
    );

  sm : sign_magnitude_f
    port map (
      input     => df_out,
      sign      => sign,
      magnitude => magnitude
    );

  -- instantiate display controller
  display : display_controller
    port map (
      clk        => clk,
      reset      => reset,
      data       => display_in,
      segment    => segment,
      seg_select => seg_select
    );

end architecture structural;
