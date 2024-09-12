library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity priority_encoder_4 is
  port ( 
    input  : in    std_logic_vector(3 downto 0);
    output : out   std_logic_vector(1 downto 0)
  );
end priority_encoder_4;

architecture behavioral of priority_encoder_4 is
begin    

  encoder : process (input) begin
    for i in 0 to 3 loop
      if (input(i) = '1') then
        output <= std_logic_vector(to_unsigned(i, 2));
      end if;
    end loop;
  end process;

end;