library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity lab07b is
  port ( 
    input  : in    std_logic_vector(7 downto 0);
    output : out   std_logic_vector(2 downto 0);
    valid  : out   std_logic
  );
end lab07b;

architecture behavioral of lab07b is
begin    

  valid <= input(7) or input(6) or input(5) or input(4) or input(3) or input(2) or input(1) or input(0);

  output(2) <= input(7) or input(6) or input(5) or input(4);

  output(1) <= input(7)
            or input(6)
            or (
              not (input(5)
                or input(4)
              )
              and (input(3)
                or input(2)
              )
            );

  output(0) <= input(7) or (
                 not input(6) and (
                   input(5) or (
                     not input(4) and (
                       input(3) or (
                         not input(2) 
                         and input(1)
                       )
                     )
                   )
                 )
               );

end;