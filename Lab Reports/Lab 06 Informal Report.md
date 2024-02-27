## Part B - Hexadecimal to 7-Segment
- Screenshots of FPGA resource utilization (LUTs, FFs) 
- Screenshots of Elaborated Design 
- Pictures of FPGA development board with functional hardware running 
- Answers to selected discussion questions (see individual handouts) 

## Part C - The Two-High-Bit Challenge Strikes Back
Derived 4x4 K-Map and equations 

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

- Completed VHDL Code 
- Screenshot of FPGA resource utilization (LUTs, FFs) 
- Screenshot of Elaborated Design 
- Answers to handout questions

## Part D - K-Map Game
- Scan or picture of completed K-Map Game 
- Sum of Product and Product of Sum implementation drawings and analysis 
- Reflection from handout