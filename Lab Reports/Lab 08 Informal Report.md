## Part A - Multiplexed 7-Segment Display
#### Elaborated Design Schematic
![[Pasted image 20240319153323.png]]

#### FPGA Resource Utilization
![[Pasted image 20240319153342.png]]

#### FPGA Development Board
![[Pasted image 20240319160943.png]]
![[Pasted image 20240319160949.png]]
![[Pasted image 20240319160954.png]]
![[Pasted image 20240319161120.png]]

#### Handout Questions
12. The `segment` output from the multiplexers matches the patterns on the board, but it is so fast that it appears there is no change.
13. Changing the limit from `2**18` to `2**10` makes it much faster, meaning that the display updates faster and so fast even that it bleeds into the other portions of the 7-segment display. This is most likely due to voltage leaking into other counters.
14. Changing the limit from `2**18` to `2**26` makes it much slower, meaning that the display updates slower and we can actually see the change.
15. The optimal value of the limit is `2**18` because it works very quickly, but not so quickly that it begins to bleed into the other 7-segment displays.

## Part B - Multiplexed Hexadecimal to 7-Segment
#### Elaborated Design Schematic
![[Pasted image 20240319161521.png]]
#### FPGA Resource Utilization
![[Pasted image 20240319161601.png]]
#### FPGA Development Board
![[Pasted image 20240319161706.png]]

#### Handout Questions
10. The first 4 switches are the input for the first 7-segment display, the second 4 switches are the input for the second 7-segment display, and so on. The left most switch of each set of 4 is the most significant bit, and the right most switch of each set is the least significant bit.

## Part C - 8-Bit Adder/Subtractor on 7-Segment Display
#### Elaborated Design Schematic
![[Pasted image 20240319162515.png]]
#### FPGA Resource Utilization
![[Pasted image 20240319162214.png]]
#### FPGA Development Board

#### Handout Questions

#### Testing Results

#### Manual Verification of Functionality


## Part D - 8-Bit Signed Array Multiplier
#### Elaborated Design Schematic


#### Simulation Results


#### FPGA Resource Utilization


#### FPGA Development Board


#### Handout Questions