## Part A - Adder / Subtractor Timing
#### Screenshots
##### First Failed Timing Run
![[Pasted image 20240326153743.png]]
##### Last Successful Timing Run
![[Pasted image 20240326154207.png]]
## Part B - Array Multiplier Timing
#### Screenshots
##### First Failed Timing Run
![[Pasted image 20240326154737.png]]
##### Last Sucessful Timing Run
![[Pasted image 20240326155211.png]]
## Part C - Two High-Bit Challenge x16 
#### Elaborated Design Schematic
![[Pasted image 20240326155346.png]]
#### Simulation Results
![[Pasted image 20240326163133.png]]
![[Screenshot 2024-03-26 165307.png]]
![[Pasted image 20240326165410.png]]
## Part D - Digital Stopwatch Accuracy
#### Elaborated Design Schematics
##### `d_counter.vhd`
![[Pasted image 20240326164407.png]]
##### Whole Stopwatch
![[Pasted image 20240326165436.png]]
##### Improved Stopwatch Component

#### Simulation Results for `d_counter.vhd`
![[Pasted image 20240326165102.png]]
#### FPGA Resource Utilization
![[Pasted image 20240326170032.png]]
#### FPGA Development Board
##### Standard

##### Improved

#### Handout Questionsp
28. The clock is slow on the FPGA board. This could be because it would very occasionally stop for short moments.
29. Cooking timers, ovens, microwaves, etc. a second is not very important in these applications.
30. increacing the tick speed of the clock could increace the accuracy of the stopwatch
31. answer
35. answer
36. answer
37. answer