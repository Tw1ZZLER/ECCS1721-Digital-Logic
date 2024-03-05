# ECCS 1721
## Lab 07 - Priority Encoders
- Lab Conducted: 2024-03-05
- Lab Group Members:
	- Corbin Hibler
	- Dylan Hughes
### Introduction
- In this lab, we practiced creating logic gate diagrams from K-Maps of multiplexers and priority encoders. We worked more on solving the Two High-Bit challenge, from labs 5 and 6. We also tested gate-based 8:3 priority encoders, multiplexer-based 8:3 priority encoders, and two-level 16:4 priority encoders, on our field-programmable gate array (FPGA) development board.

### Procedure
#### Part A 
- First we download the 7A-handout
- The first goal of the lab is to understand the implementation of gates and how we can substitute them with each other to make the process use less transistors
- 
#### Part B
- We created a new Vivado project and imported `lab07b.vhd` and `lab07b.xdc` files from Canvas.
- We generated bitstream and uploaded to our FPGA board, to test our gate-based 8:3 priority encoder on the board.
- We tested the switches on the board and took 3 photos of our results with 3 different inputs, as seen in Figures 1, 2, and 3.
- We reviewed the elaborated design with the instructor and took a photo of the schematic, as seen in Figure 4.
- We also took a photo of our look-up table usage, as seen in Figure 5.
#### Part C
- We created a new Vivado project and imported `lab07c.vhd` and `lab07c.xdc` files from Canvas.
- We generated bitstream and uploaded to our FPGA board, to test our MUX-based 8:3 priority encoder on the board.
- The MUX-based priority encoder gave us the same results as the gate-based priority encoder.
- We took photos of our schematic after we reviewed it with the instructor, as seen in Figure 6. 
- We also took a photo of our look-up table usage, as seen in Figure 7.
#### Part D
 - We created a new Vivado project and imported `lab07d.vhd`, `priority_encoder_4.vhd`, and `lab07d.xdc` files from Canvas.
- We generated bitstream and uploaded to our FPGA board, to test the two-level 16:4 priority encoder.

### Results
![[Pasted image 20240305163941.png]]
<div style="text-align: center">Figure 1: Gate-Based 8:3 Priority Encoder (Input: 10000000)</div>

![[Pasted image 20240305163949.png]]
<div style="text-align: center">Figure 2: Gate-Based 8:3 Priority Encoder  (Input: 00011111)</div>

![[Pasted image 20240305163955.png]]
<div style="text-align: center">Figure 3: Gate-Based 8:3 Priority Encoder (Input: 00011011)</div>

![[Pasted image 20240305162156.png]]
<div style="text-align: center">Figure 4: Schematic of Gate-based 8:3 Priority Encoder</div>

![[Pasted image 20240305162242.png]]
<div style="text-align: center">Figure 5: LUT Usage of Gate-based 8:3 Priority Encoder</div>

![[Pasted image 20240305164909.png]]
<div style="text-align: center">Figure 6: Schematic of MUX-based 8:3 Priority Encoder</div>

![[Pasted image 20240305165417.png]]
<div style="text-align: center">Figure 7: LUT Usage of MUX-based 8:3 Priority Encoder</div>

![[Pasted image 20240305171317.png]]
<div style="text-align: center">Figure 8: Two-Level 16:4 Priority Encoder (Input: 0000010000000000)</div>

![[Pasted image 20240305173014.png]]
<div style="text-align: center">Figure 9: Two-Level 16:4 Priority Encoder (Input: 0000011111111111)</div>


![[Pasted image 20240305173021.png]]
<div style="text-align: center">Figure 10: Two-Level 16:4 Priority Encoder (Input: 0000000000001001)</div>

![[Pasted image 20240305172917.png]]
<div style="text-align: center">Figure 11: Annotated Schematic of 16:4 Priority Encoder</div>

![[Pasted image 20240305173516.png]]
<div style="text-align: center">Figure 12: LUT Usage of 16:4 Priority Encoder</div>

### Discussion/Analysis
#### Part B
- We learned that we can edit the constraints (`.xdc`) file in Vivado to change how the switches behave.
- The constraints file we downloaded makes the 8 rightmost switches the input bits, where the rightmost switch is the least significant bit, and the leftmost bit is the most significant bit.
	- In addition, the leftmost switch on the board is reserved for the valid bit, telling us that we have a valid input. It is off when there are no switches inputted.
- The valid bit in **insert answer here**
#### Part C
- The LATCH at the very right of Figure 6 was a mistake, and should not have been there.
- The functionality of the the MUX-based priority encoder is the exact same as the gate-based priority encoder.
- Gate-based priority encoders are cheaper in terms of LUTs, as we can see from Figures 5 and 7. Gate-based uses 1 more LUT than MUX-based.
#### Part D
- In Figure 11, we can see the 4 input OR gates on the left that are our friends. 

- *As discussed in the lecture, as the input width for a priority encoder grows, it rapidly becomes extremely difficult to find its boolean equations and implement it at the gate level.* 
	- *How does the two-level hardware structure help mitigate the problem of rapid growth in hardware complexity with input size?* 
		- **insert answer here**
	- *What size do you think the component encoders should be for a 64:6 two-level priority encoder? What about a 32:5 2LPE?*
		- For a 64:6 two-level priority encoder, the coarse encoder would be a 32:5 priority encoder and the fine encoder would be a 16:4 priority encoder.  For a 32:5 two-level priority encoder, the coarse encoder would be a 16:4 priority encoder and the fine encoder would be a 8:3 priority encoder. 
	- *Do you think there is a better way to structure the encoder than the two-level hardware structure introduced in this lab? There is no wrong answer, but be sure to explain your reasoning.*
		- **insert answer here**
### Conclusion
We covered 

### Attachments / Appendix
#### Drawn Gate Implementations


#### Gate Implementation Analysis
5. How many transistors do your AND / OR implementations from Step 3 cost? Do the SoP and PoS implementations differ in cost?

Sop contained 66Ts
Pos contained 66Ts
			They did not differ in cost.


6. How many transistors does your NAND / NOR implementations from Step 4 cost? Are they different from their corresponding implementations from Step 3? Are the different from each other? If so, by how many transistors?

nand/nor Sop contained 52Ts
nand/nor Pos contained 56Ts
			Both nand/nor contained less transistors than their counterparts but the nand/nor Sop contained the least with 14 less transistors than its counterpart. 


7. How long are the critical paths from your NAND / NOR implementations from Step 4? Are the critical paths from the NAND and NOR implementations different? If so, by how much?

nand/nor Sop critical path was 6 gates long
nand/nor Pos critical path was also 6 gates long
			They did not differ in length.


8. Which method (sum-of-product or product-of-sum) resulted in a more efficient hardware implementation from the perspective of complexity/power (number of transistors) and speed (critical path)? Why?

Both Sop and Pos had the same optimal critical path length of 6 Tg in nand/nor format.  However, the nand/nor Sop had the least transistors with 52 Ts.

			