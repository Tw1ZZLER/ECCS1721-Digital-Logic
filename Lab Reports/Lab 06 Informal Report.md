## Part B - Hexadecimal to 7-Segment
- Screenshots of FPGA resource utilization (LUTs, FFs) 
- Screenshots of Elaborated Design 
- Pictures of FPGA development board with functional hardware running 
- Answers to selected discussion questions (see individual handouts) 

## Part C - The Two-High-Bit Challenge Strikes Back
### Derived 4x4 K-Map and equations 

| A   | B   | C   | D   | O   |
| --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   |
| 0   | 0   | 0   | 1   | 0   |
| 0   | 0   | 1   | 0   | 0   |
| 0   | 0   | 1   | 1   | 1   |
| 0   | 1   | 0   | 0   | 0   |
| 0   | 1   | 0   | 1   | 1   |
| 0   | 1   | 1   | 0   | 1   |
| 0   | 1   | 1   | 1   | 1   |
| 1   | 0   | 0   | 0   | 0   |
| 1   | 0   | 0   | 1   | 1   |
| 1   | 0   | 1   | 0   | 1   |
| 1   | 0   | 1   | 1   | 1   |
| 1   | 1   | 0   | 0   | 1   |
| 1   | 1   | 0   | 1   | 1   |
| 1   | 1   | 1   | 0   | 1   |
| 1   | 1   | 1   | 1   | 1   |

| AB/CD                      | $\overline{C}\overline{D}$ | $\overline{C}D$ | $CD$ | $C\overline{D}$ |
| -------------------------- | -------------------------- | --------------- | ---- | --------------- |
| $\overline{A}\overline{B}$ | 0                          | 0               | 1    | 0               |
| $\overline{A}B$            | 0                          | 1               | 1    | 1               |
| $AB$                       | 1                          | 1               | 1    | 1               |
| $A\overline{B}$            | 0                          | 1               | 1    | 1               |
###### Sum-of-Products
$$ O = AB + AC + AD + BC + BD + CD $$
###### Product-of-Sums
$$ O = (A+B+C)(A+B+D)(A+C+D)(B+C+D)$$

### Completed VHDL Code 
```vhdl
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
  
  output <= (input(0) or input(1) or input(2)) and
		    (input(0) or input(2) or input(3)) and 
		    (input(1) or input(2) or input(3)) and 
		    (input(0) or input(1) or input(3));
  
end architecture behavioral;
```
### Screenshot of FPGA resource utilization (LUTs, FFs) 
![[Pasted image 20240227163424.png]]
### Screenshot of Elaborated Design 
![[Pasted image 20240227162346.png]]
### Answers to handout questions
- Is the resource utilization the same as the previous code?
- Verify the functionality. Is the functionality the same as the previous code?

## Part D - K-Map Game
- Scan or picture of completed K-Map Game 
- Sum of Product and Product of Sum implementation drawings and analysis 
- Reflection from handout