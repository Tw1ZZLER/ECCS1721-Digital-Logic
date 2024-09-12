library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab14 is
  port (
    clk      : in    std_logic;
    reset    : in    std_logic;
    switches : in    std_logic_vector(15 downto 0);
    leds     : out   std_logic_vector(15 downto 0);
    nsr      : out   std_logic;
    nsy      : out   std_logic;
    nsg      : out   std_logic;
    ewr      : out   std_logic;
    ewy      : out   std_logic;
    ewg      : out   std_logic
  );
end lab14;

architecture behavioral of lab14 is

  type state_type is (S0, S1, S2, S3);

  signal current_state : state_type;
  signal next_state    : state_type;

  signal slow_clk           : std_logic;
  signal clk_div_count      : unsigned(29 downto 0);
  signal next_clk_div_count : unsigned(29 downto 0);

  signal q : std_logic_vector(2 downto 0);
  signal d : std_logic_vector(2 downto 0);

  signal lights      : std_logic_vector(5 downto 0);
  signal auto_lights : std_logic_vector(5 downto 0);

begin

  nsr <= lights(5);
  nsy <= lights(4);
  nsg <= lights(3);
  ewr <= lights(2);
  ewy <= lights(1);
  ewg <= lights(0);

  process (switches) begin
    if (switches(2) = '1') then
      lights <= clk_div_count(26) & '0' & '0' & clk_div_count(26) & '0' & '0';
      leds(2 downto 0) <= "100";
    elsif (switches(1) = '1') then
      lights <= clk_div_count(26) & '0' & '0' & '0' & clk_div_count(26) & '0';
      leds(2 downto 0) <= "010";
    elsif (switches(0) = '1') then
      lights <= '0' & clk_div_count(26) & '0' & clk_div_count(26) & '0' & '0';
      leds(2 downto 0) <= "001";
    else
      lights <= auto_lights;
      leds(2 downto 0) <= "000";
    end if;
  end process;

  process (clk, reset) begin
    if (reset = '1') then
      clk_div_count <= (others => '0');
    elsif (clk'event and clk = '1') then
      clk_div_count <= next_clk_div_count;
    end if;
  end process;

  next_clk_div_count <= clk_div_count + 1;
  slow_clk           <= clk_div_count(29);

  process (slow_clk, reset) begin
    if (reset = '1') then
      q             <= "000";
      current_state <= S0;
    elsif (slow_clk'event and slow_clk = '1') then
      q             <= d;
      current_state <= next_state;
    end if;
  end process;

  d(0) <= q(2) nor q(0);
  d(1) <= q(1) xor q(0);
  d(2) <= q(1) and q(0);

  process (current_state, q) begin
    case current_state is
      when S0 =>
        if (q(2)='0') then
          next_state  <= S0;
          auto_lights <= "100001";
        else
          next_state  <= S1;
          auto_lights <= "100010";
        end if;
      when S1 =>
        next_state  <= S2;
        auto_lights <= "001100";
      when S2 =>
        if (q(2)='0') then
          next_state  <= S2;
          auto_lights <= "001100";
        else
          next_state  <= S3;
          auto_lights <= "010100";
        end if;
      when S3 =>
        next_state  <= S0;
        auto_lights <= "100001";
    end case;
  end process;
end architecture behavioral;
