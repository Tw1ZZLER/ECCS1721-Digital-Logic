library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab09e is
  port (
    clk        : in    std_logic;
    reset      : in    std_logic;
    enable     : in    std_logic;
    segment    : out   std_logic_vector(7 downto 0);
    seg_select : out   std_logic_vector(3 downto 0)
  );
end lab09e;

architecture behavioral of lab09e is

  component display_controller is
    port (
      selected_seg: in   unsigned(1 downto 0);
      data       : in    std_logic_vector(15 downto 0);
      segment    : out   std_logic_vector(7 downto 0);
      seg_select : out   std_logic_vector(3 downto 0)
    );
  end component;

  component d_counter is
    port (
      clk       : in    std_logic;
      reset     : in    std_logic;
      enable    : in    std_logic;
      count_out : out   std_logic_vector(3 downto 0)
    );
  end component;

  signal clk_count   : unsigned(19 downto 0);
  signal n_clk_count : unsigned(19 downto 0);

  signal clk_count_max : std_logic;

  type count_t is array(0 to 3) of std_logic_vector(3 downto 0);

  signal count : count_t;

  signal count_max : std_logic_vector(2 downto 0);

  signal count_enable : std_logic_vector(3 downto 0);

begin

  process (clk, reset)
  begin
    if (reset = '1') then
      clk_count <= "00000000000000000000";

    elsif (clk'event and clk='1') then
        clk_count <= n_clk_count;
    end if;
  end process;

  n_clk_count   <= clk_count + 1 when clk_count<1000000 else "00000000000000000000";
  clk_count_max <= '1' when clk_count = 999999 else '0';
 
  gen_count_max :
  for i in 0 to 2 generate

    count_max(i) <= count(i)(3) and (not count(i)(2)) and (not count(i)(1)) and count(i)(0);

  end generate gen_count_max;

  count_enable(0) <= enable and clk_count_max;
  count_enable(1) <= enable and clk_count_max and count_max(0);
  count_enable(2) <= enable and clk_count_max and count_max(0) and count_max(1);
  count_enable(3) <= enable and clk_count_max and count_max(0) and count_max(1) and count_max(2);
  
  gen_counters :
  for i in 0 to 3 generate
    counter : d_counter
      port map (
        clk       => clk,
        reset     => reset,
        enable    => count_enable(i),
        count_out => count(i)
      );

  end generate gen_counters;

  -- instantiate display controller
  display : display_controller
    port map (
    selected_seg => clk_count(19 downto 18),
      data       => count(3) & count(2) & count(1) & count(0),
      segment    => segment,
      seg_select => seg_select
       );

end architecture behavioral;
