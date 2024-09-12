library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity dataflow is
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
end dataflow;

architecture behavioral of dataflow is

  signal c   : std_logic_vector(7 downto 0);
  signal sum : std_logic_vector(7 downto 0);
  signal a   : std_logic_vector(7 downto 0);
  signal b   : std_logic_vector(7 downto 0);
  signal na  : std_logic_vector(7 downto 0);
  signal nb  : std_logic_vector(7 downto 0);

  component adder_8 is
    port (
      addend : in    std_logic_vector(7 downto 0);
      augend : in    std_logic_vector(7 downto 0);
      c_in   : in    std_logic;
      sum    : out   std_logic_vector(7 downto 0)
    );
  end component;

begin

  adder : adder_8
    port map (
      addend => c,
      augend => a,
      c_in   => cm,
      sum    => sum
    );

  c(7)  <= cm xor multiplicand(7);
  c(6)  <= cm xor multiplicand(6);
  c(5)  <= cm xor multiplicand(5);
  c(4)  <= cm xor multiplicand(4);
  c(3)  <= cm xor multiplicand(3);
  c(2)  <= cm xor multiplicand(2);
  c(1)  <= cm xor multiplicand(1);
  c(0)  <= cm xor multiplicand(0);

  na(7) <= (not load) and ((sh and a(7)) or (add_sh and c(7)));
  na(6) <= (not load) and ((sh and a(7)) or (add_sh and sum(7)));
  na(5) <= (not load) and ((sh and a(6)) or (add_sh and sum(6)));
  na(4) <= (not load) and ((sh and a(5)) or (add_sh and sum(5)));
  na(3) <= (not load) and ((sh and a(4)) or (add_sh and sum(4)));
  na(2) <= (not load) and ((sh and a(3)) or (add_sh and sum(3)));
  na(1) <= (not load) and ((sh and a(2)) or (add_sh and sum(2)));
  na(0) <= (not load) and ((sh and a(1)) or (add_sh and sum(1)));

  nb(7) <= (load and multiplier(7)) or ((not load) and ((sh and a(0)) or (add_sh and sum(0))));
  nb(6) <= (load and multiplier(6)) or ((not load) and b(7));
  nb(5) <= (load and multiplier(5)) or ((not load) and b(6));
  nb(4) <= (load and multiplier(4)) or ((not load) and b(5));
  nb(3) <= (load and multiplier(3)) or ((not load) and b(4));
  nb(2) <= (load and multiplier(2)) or ((not load) and b(3));
  nb(1) <= (load and multiplier(1)) or ((not load) and b(2));
  nb(0) <= (load and multiplier(0)) or ((not load) and b(1));

  process (clk, reset) begin
    if (reset = '1') then
      a <= "00000000";
      b <= "00000000";
    elsif (clk'event and clk = '1') then
      if (load = '1' or sh = '1' or add_sh = '1') then
        a <= na;
        b <= nb;
      end if;
    end if;
  end process;

  output <= a & b;
  m      <= b(0);

end architecture behavioral;
