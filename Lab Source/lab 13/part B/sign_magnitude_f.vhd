library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity sign_magnitude_f is
  port (
    input     : in    std_logic_vector(15 downto 0);
    sign      : out   std_logic;
    magnitude : out   std_logic_vector(14 downto 0)
  );
end sign_magnitude_f;

architecture behavioral of sign_magnitude_f is

  component f_abs is
    port (
      sign  : in    std_logic;
      a     : in    std_logic;
      c_in  : in    std_logic;
      a_out : out   std_logic;
      c_out : out   std_logic
    );
  end component;

  signal carry : std_logic_vector(14 downto 0);

begin

  magnitude(0) <= input(0);
  carry(0)     <= input(0);

  magx : for i in 1 to 14 generate
    f_abs_i : f_abs
      port map (
        sign  => input(15),
        a     => input(i),
        c_in  => carry(i - 1),
        a_out => magnitude(i),
        c_out => carry(i)
      );
  end generate magx;

  sign <= input(15);
  
end architecture behavioral;
