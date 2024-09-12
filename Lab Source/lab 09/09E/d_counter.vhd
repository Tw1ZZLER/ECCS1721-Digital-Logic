library IEEE;
  use IEEE.std_logic_1164.all;

entity d_counter is
  port (
    clk       : in    std_logic;
    reset     : in    std_logic;
    enable    : in    std_logic;
    count_out : out   std_logic_vector(3 downto 0)
  );
end d_counter;

architecture structural of d_counter is

  signal q : std_logic_vector(3 downto 0);
  signal d : std_logic_vector(3 downto 0);

begin

  process (clk, reset) begin
    if (reset = '1') then
      q <= "0000";
    elsif (clk'event and clk = '1') then
      if (enable = '1') then
        q <= d;
      end if;
    end if;
  end process;

  d(3) <= (q(3) and not q(1) and not q(0)) or (q(2) and q(1) and q(0));
  d(2) <= (q(2) and not q(1)) or (q(2) and not q(0)) or (not q(2) and q(1) and q(0));
  d(1) <= (q(1) and not q(0)) or (not q(3) and not q(1) and q(0));
  d(0) <= not q(0);

  count_out <= q;
end architecture structural;
