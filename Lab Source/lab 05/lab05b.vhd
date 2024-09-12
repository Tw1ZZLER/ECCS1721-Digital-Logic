library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab05b is
  port
  (
    switches : in std_logic_vector(15 downto 0);
    leds     : out std_logic_vector(15 downto 0)
  );
end lab05b;

architecture behavioral of lab05b is

  signal input  : std_logic_vector(3 downto 0); -- input 4 bits
  signal output : std_logic; -- output 1 bit

begin

  input   <= switches(3 downto 0);
  leds(0) <= output;

  process (input)
  begin
    case (input) is
      when "0000" => output <= '0';
        -- ...
      when "0011" => output <= '1';
        -- fill in the rest from the truth table derived in lab!
      when others => output <= '-';
    end case;
  end process;

end architecture behavioral;