library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity lab02 is
  generic (
    N : integer := 5
  );
  port (
    input1 : in signed(N - 1 downto 0);
    input2 : in signed(N - 1 downto 0);
    out1   : out std_logic;
    out2   : out std_logic
  );
end lab02;

architecture behavioral of lab02 is
  
  signal input1_ext   : signed(N downto 0);
  signal input2_ext   : signed(N downto 0);
  signal difference1  : signed(N downto 0);
  signal difference2  : signed(N downto 0);

begin

  input1_ext  <= input1(N - 1) & input1;
  input2_ext  <= input2(N - 1) & input2;

  difference1 <= input1_ext - input2_ext;
  difference2 <= to_signed(0, N + 1) - difference1;

  out1        <= difference1(N);
  out2        <= difference2(N);
  
end;