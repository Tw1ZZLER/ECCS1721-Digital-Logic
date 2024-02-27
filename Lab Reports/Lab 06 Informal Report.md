## Part B - Hexadecimal to 7-Segment
#### Screenshots of FPGA resource utilization (LUTs, FFs) 
![[Pasted image 20240227174459.png]]
#### Screenshots of Elaborated Design 
![[Pasted image 20240227174818.png]]
#### Pictures of FPGA development board with functional hardware running 
![[Pasted image 20240227174907.png]]
![[Pasted image 20240227174914.png]]
![[Pasted image 20240227174921.png]]
#### Answers to selected discussion questions (see individual handouts) 
10. The most significant bit is switch 15 (R2)
11. Anything past 9 would need 2 digits in base 10 but we are in      base 15 

## Part C - The Two-High-Bit Challenge Strikes Back
#### Derived 4x4 K-Map and equations 

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
##### Sum-of-Products
$$ O = AB + AC + AD + BC + BD + CD $$
##### Product-of-Sums
$$ O = (A+B+C)(A+B+D)(A+C+D)(B+C+D)$$

#### Pictures of drawn gate implementation
![[Pasted image 20240227174348.png]]
#### Completed VHDL Code 
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
#### Screenshot of FPGA resource utilization (LUTs, FFs) 
![[Pasted image 20240227163424.png]]
#### Screenshot of Elaborated Design 
![[Pasted image 20240227162346.png]]
#### Answers to handout questions
- Is the resource utilization the same as the previous code?
	- Yes, it is the same.
- Verify the functionality. Is the functionality the same as the previous code?
	- The functionality is not the same.

## Part D - K-Map Game
#### Scan or picture of completed K-Map Game 
![[Feb 27, Doc 2 Page 0.jpeg]]
- Game 2 correction: $(\overline{C} \cdot B)$ should be $(\overline{C}+B)$ 
#### Sum of Product and Product of Sum implementation drawings and analysis 
##### Game 1
###### Sum-of-Products
$$ O = D $$
###### Product-of-Sums
$$ O = D $$
##### Game 2
###### Sum-of-Products
$$ O = \overline{C}AB + \overline{C}\overline{A}\overline{B} + D\overline{A}B + \overline{D}AB + A\overline{C}\overline{D}$$
###### Product-of-Sums
$$ O = (\overline{C}+B)(A+\overline{C}+D)(D+A+\overline{B})(\overline{C}+\overline{D}+\overline{A})(\overline{A}+B+\overline{D}) $$
##### Game 3
###### Sum-of-Products
$$ O = A\overline{D} + \overline{B}D + B\overline{C}\overline{D} $$
###### Product-of-Sums
$$ O = (\overline{B}+\overline{D})(A+B+D)(A+\overline{C}+D) $$
##### Game 4
###### Sum-of-Products
$$ O = \overline{A}D+\overline{B}\overline{C} +A\overline{B} $$
###### Product-of-Sums
$$ O = (\overline{A}+\overline{B})(D+\overline{B})(\overline{C}+D+A) $$
##### Game 5
###### Sum-of-Products
$$ O = A\overline{CD} + \overline{AC}D + ABCD + A\overline{BD} +\overline{A}B\overline{C} $$
###### Product-of-Sums
$$ O = (A+C+D)(A+\overline{C}+\overline{D})(\overline{A}+C+\overline{D})(\overline{A}+B+\overline{D})(\overline{A}+\overline{B}+\overline{C}+D) $$

#### Reflection from handout
By playing these 5 k-map games we have a better understanding of how to group the 1's and 0's and how to explain those groupings using the least amount of transistors.