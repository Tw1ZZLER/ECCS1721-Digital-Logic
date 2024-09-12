library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity lab07c is
  port ( 
    input  : in    std_logic_vector(7 downto 0);
    output : out   std_logic_vector(2 downto 0);
    valid  : out   std_logic
  );
end lab07c;

architecture behavioral of lab07c is
begin    

  valid <= input(7) or input(6) or input(5) or input(4) or input(3) or input(2) or input(1) or input(0);

  encoder : process (input) begin
    for i in 0 to 7 loop
      if (input(i) = '1') then
        output <= std_logic_vector(to_unsigned(i, 3));
      end if;
    end loop;
  end process;

end;