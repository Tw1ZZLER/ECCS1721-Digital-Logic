library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity sign_magnitude is
  port (
    clk    : in    std_logic;
    reset  : in    std_logic;
    input  : in    std_logic_vector(15 downto 0);
    output : out   std_logic_vector(15 downto 0)
  );
end sign_magnitude;

architecture behavioral of sign_magnitude is

  signal sign      : std_logic;
  signal magnitude : std_logic_vector(14 downto 0);
  signal inputd    : std_logic_vector(15 downto 0);
  signal absolute  : std_logic_vector(14 downto 0);

begin

  process (clk, reset) begin
    if (reset = '1') then
      inputd <= "0000000000000000";
    elsif (clk'event and clk = '1') then
      inputd <= input;
    end if;
  end process;

  sign <= inputd(15);

  magnitude <= inputd(14 downto 0) when inputd(15)='0' else absolute;
              
  absolute <= not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              not inputd(7) & not inputd(6) & not inputd(5) & not inputd (4) & not inputd(3) & not inputd(2) & not inputd(1) & inputd(0)
              when inputd(0) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              not inputd(7) & not inputd(6) & not inputd(5) & not inputd (4) & not inputd(3) & not inputd(2) & inputd(1) & inputd(0) 
              when inputd(1) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              not inputd(7) & not inputd(6) & not inputd(5) & not inputd (4) & not inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(2) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              not inputd(7) & not inputd(6) & not inputd(5) & not inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(3) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              not inputd(7) & not inputd(6) & not inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(4) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              not inputd(7) & not inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(5) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              not inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(6) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & not inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(7) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & not inputd(9) & inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(8) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & not inputd (10) & inputd(9) & inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(9) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & not inputd(11) & inputd (10) & inputd(9) & inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(10) = '1' else
              not inputd(14) & not inputd(13) & not inputd(12) & inputd(11) & inputd (10) & inputd(9) & inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(11) = '1' else
              not inputd(14) & not inputd(13) & inputd(12) & inputd(11) & inputd (10) & inputd(9) & inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(12) = '1' else
              not inputd(14) & inputd(13) & inputd(12) & inputd(11) & inputd (10) & inputd(9) & inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0) 
              when inputd(13) = '1' else
              inputd(14) & inputd(13) & inputd(12) & inputd(11) & inputd (10) & inputd(9) & inputd(8) & 
              inputd(7) & inputd(6) & inputd(5) & inputd (4) & inputd(3) & inputd(2) & inputd(1) & inputd(0);

  output <= sign & magnitude;

end architecture behavioral;
