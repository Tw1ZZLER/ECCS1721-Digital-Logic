library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab06c is
  port (
    switches : in    std_logic_vector(15 downto 0);
    leds     : out   std_logic_vector(15 downto 0)
  );
end lab06c;

architecture behavioral of lab06c is

  signal input  : std_logic_vector(3 downto 0); -- input 4 bits
  signal output : std_logic;                    -- output 1 bit

  --* Hint: it may help to declare one or more additional signals

begin

  --* Do not modify
  input   <= switches(3 downto 0);
  leds(0) <= output;

  --* Examples of using combinational logic:

  -- standard or. leds(14) will be high if either of the 2 leftmost switches are high.
  leds(15) <= switches(15) or switches(14); 

  -- standard and. leds(13) will be high if both the 2 next leftmost switches are high.
  leds(13) <= switches(13) and switches(12);

  -- unary or. leftmost LED will turn on if any switch is high.
  -- In order to use this, you will have to enable VHDL-2008. 
  -- See the lab handout for instructions on how to do this if you want to use this operator.
  -- This is not required to complete the lab.
  -- leds(11) <= or switches; 

  --* Insert your code here:
  -- Use 'input' and 'output'





  --* Example Solution to 05B for functionality comparison:
  --* For your convenience to compare functionality in the same project
  --* Uncomment after obtaining resource utilization results for your gate implementation
  --* Hint: Select all the lines covering the process statement, and press Ctrl + / 
  -- process (switches(7 downto 4)) begin
  --   case (switches(7 downto 4)) is
  --     when "0000" => leds(1) <= '0';
  --     when "0001" => leds(1) <= '0';
  --     when "0010" => leds(1) <= '0';
  --     when "0011" => leds(1) <= '1';
  --     when "0100" => leds(1) <= '0';
  --     when "0101" => leds(1) <= '1';
  --     when "0110" => leds(1) <= '1';
  --     when "0111" => leds(1) <= '1';
  --     when "1000" => leds(1) <= '0';
  --     when "1001" => leds(1) <= '1';
  --     when "1010" => leds(1) <= '1';
  --     when "1011" => leds(1) <= '1';
  --     when "1100" => leds(1) <= '1';
  --     when "1101" => leds(1) <= '1';
  --     when "1110" => leds(1) <= '1';
  --     when "1111" => leds(1) <= '1';
  --     when others => leds(1) <= '-';
  --   end case;
  -- end process;

end architecture behavioral;
