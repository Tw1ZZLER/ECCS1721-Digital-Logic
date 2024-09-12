library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab08a is
  generic (
    counter_limit : natural := 2**18
  );
  port (
    clk        : in    std_logic;
    reset      : in    std_logic;
    segment    : out   std_logic_vector(7 downto 0);
    seg_select : out   std_logic_vector(3 downto 0)
  );
end lab08a;

architecture behavioral of lab08a is

  signal counter           : natural range 0 to counter_limit-1;
  signal next_counter      : natural range 0 to counter_limit-1;
  signal selected_seg      : natural range 0 to 3;
  signal next_selected_seg : natural range 0 to 3;

begin

  process (clk) begin
    if (clk'event and clk = '1') then
      if (reset = '1') then
        counter      <= 0;
        selected_seg <= 0;
      else
        counter      <= next_counter;
        selected_seg <= next_selected_seg;
      end if;
    end if;
  end process;

  next_counter      <= counter + 1;
  next_selected_seg <= selected_seg + 1 when counter = 0 else selected_seg;

  segment <= "00111111" when selected_seg = 0 else
             "11001111" when selected_seg = 1 else
             "11110011" when selected_seg = 2 else
             "11111100";

  seg_select <= "0111" when selected_seg = 0 else
                "1011" when selected_seg = 1 else
                "1101" when selected_seg = 2 else
                "1110";

end architecture behavioral;
