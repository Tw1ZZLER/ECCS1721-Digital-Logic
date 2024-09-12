library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab05c is
  port
  (
    switches : in std_logic_vector(15 downto 0);
    leds     : out std_logic_vector(15 downto 0)
  );
end lab05c;

architecture behavioral of lab05c is

  -- Leds:     | NOT |  X  | AND  |  X   | OR  |  X  |  X  | NAND  |   X   | NOR  |  X   |  X  | XOR  |  X   | XNOR  |   X   |
  -- Switches: | NOT |  X  | AND1 | AND2 | OR1 | OR2 |  X  | NAND1 | NAND2 | NOR1 | NOR2 |  X  | XOR1 | XOR2 | XNOR1 | XNOR2 |
  -- Index:    | 15  |  14 |  13  |  12  | 11  | 10  |  9  |   8   |   7   |  6   |  5   |  4  |  3   |  2   |   1   |   0   |

begin

  leds(15) <= not switches(15);

  leds(13) <= switches(13) and switches(12);
  leds(11) <= switches(11) or switches(10);

  leds(8) <= switches(8) nand switches(7);
  leds(6) <= switches(6) nor switches(5);

  leds(3) <= switches(3) xor switches(2);
  leds(1) <= switches(1) xnor switches(0);

end architecture behavioral;