# ECCS 1721
## Labs 10-12 - Two-Level Multiplier
- Labs Conducted: 
	- Lab 10: 2024-04-02
	- Lab 11: 2024-04-09
	- Lab 12: 2024-04-23
- Lab Group Members:
	- Corbin Hibler
	- Dylan Hughes
### Introduction
From lab 10 to lab 12 we analyzed the design and functions of the parts that make up a two-level multiplier. This two-level multiplier is one that was designed by ECCS faculty in the paper, "Leveraging a Novel Two-Level Priority Encoder for High-Precision Integer Multiplication." We separated the two-level multiplier into it's major components, the priority encoder, decoder, barrel shifter, and carry-look-ahead adder [1].  Using Vivado we learned the concepts and applications of serial communication and how it can be used to communicate with an FPGA board. Finally, we implemented and tested CLA's of increasing size to complete the whole 64-bit two-level multiplier.

### Methodology
At a high-level, the multiplication algorithm works by taking the multiplier and multiplicand and placing them into registers, or $n$-bit flip-flops. The multiplier is sent to the two-level priority encoder, where the encoded data is then sent to a two-level decoder and a barrel shifter. The decoder will XOR its output with the output of the multiplier to give the CLR input to the multiplier register, which will only delete the bit.

#### Two-Level Priority Encoder
To make high-precision integer multiplication more efficient, the main component of our 64-bit two-level multiplier is a two-level priority encoder. A schematic of this encoder can be found in Figure 1. A $n$-input two-level priority encoder  requires many gates, as cost and complexity increases exponentially with large $n$ values [1]. For this reason, normal priority encoders are not typically used for high-precision applications, such as a high input multipliers. However, by using a two-level priority encoder, we can make a new, more efficient design.

#### Two-Level Decoder
The next component of our multiplier is a two-level decoder, which will decode the output of the priority encoder and send that data to an XOR gate with the output of the multiplier register. A schematic of this decoder can be found in 

#### Two-Level Barrel Shifter
The two-level priority encoder will also send data to the two-level barrel shifter. 

#### Carry-Look-Ahead Adder


#### Logic Gates
To finish off the design of the multiplier, we tie everything together using XOR and NOR gates. An $n$-input XOR gate is used to calculate the 

### Results
#### Lab 11
Figure 1 is the elaborated design schematic of the 64-bit two-level priority encoder:
![[lab11b-full_schematic.png]]
<div style="text-align: center">Figure 1: 64-Bit Two-Level Priority Encoder Design Schematic</div>
We can expand the encoder section of this schematic to view the hardware of the encoder, as seen in Figure 2:
![[lab11b-subschematic.png]]
<div style="text-align: center">Figure 2: Encoder Design Schematic</div>
Opening design runs in elaborated design, we can view the number of look-up tables and flip-flops used by the 64-bit two-level priority encoder, as seen in Figure 3:
![[lab11b-resource-utilization.png]]
<div style="text-align: center">Figure 3: Resource Utilization of 64-bit Two-Level Priority Encoder</div>
After running through various tests using SerialTool's HEX terminal, we get outputs from the FPGA device in hexadecimal. These are shown in Figure 4:
![[lab11b-serialtool_output.png]]
<div style="text-align: center">Figure 4: SerialTool Output of 64-bit Two-Level Priority Encoder</div>
Looking in the elaborated design of the 64-bit two-level decoder, we can view the look-up tables and flip-flops it uses, as seen in Figure 5:
![[lab11c-resource_utilization.png]]
<div style="text-align: center">Figure 5: Resource Utilization of 64-bit Two-Level Decoder</div>
After running through more tests, this time using the decoder, using SerialTool's HEX terminal, we get outputs from the FPGA device in hexadecimal. These are shown in Figure 6:
![[lab11c-serialtool_output.png]]
<div style="text-align: center">Figure 7: SerialTool Output of 64-bit Two-Level Decoder</div>
Now that we have introduced a 64-bit two-level barrel shifter, we can open it's elaborated design schematic and expand the barrel shifter section, as the other sections are not important. This schematic is shown in Figure 8:
![[lab11d-barrel_shifter_schematic.png]]
<div style="text-align: center">Figure 8: Design Schematic of 64-bit Two-Level Barrel Shifter</div>
Opening design runs, we can view the number of look-up tables and flip-flops this barrel shifter uses, as shown in Figure 9:
![[lab11d-resource_utilization.png]]
<div style="text-align: center">Figure 9: Resource Utilization of 64-bit Two-Level Barrel Shifter</div>
After testing the 64-bit two-level barrel shifter, using SerialTool's HEX terminal, we can get outputs from the FPGA device in hexadecimal. These are shown in Figure 10:
![[lab11d-serialtool_output.png]]
<div style="text-align: center">Figure 10: SerialTool Output of 64-bit Two-Level Barrel Shifter</div>
#### Lab 12
After opening the elaborated design schematic of the 4-bit carry-look-ahead adder, we can expand the adder and other portions of it to view all the hardware, as seen in Figure 11.
![[lab12a-4bit_schematic.png]]
<div style="text-align: center">Figure 11: Elaborated Design Schematic of 4-bit CLA</div>
Opening design runs, we can view the number of look-up tables and flip-flops this CLA uses, as shown in Figure 12:
![[lab12a-4bit_resource_utilization.png]]
<div style="text-align: center">Figure 12: Resource Utilization of 4-bit CLA</div>
After doing testing on the board using the switches, we can view the output of our additions via the seven-segment display. This is shown in Figure 13.
![[lab12a-4bit_board_test.jpg]]
<div style="text-align: center">Figure 13: FPGA Board Testing of 4-bit CLA</div>
After opening the elaborated design schematic of the 16-bit carry-look-ahead adder, we can expand the adder and other portions of it to view all the hardware, as seen in Figure 14.
![[lab12a-16bit_schematic.png]]
<div style="text-align: center">Figure 14: Elaborated Design Schematic of 16-bit CLA</div>
Opening design runs, we can view the number of look-up tables and flip-flops this CLA uses, as shown in Figure 15:
![[lab12a-16bit_resource_utilization.png]]
<div style="text-align: center">Figure 15: Resource Utilization of 16-bit CLA</div>
After doing testing on the board using the switches, we can view the output of our additions via the seven-segment display, this time in hexadecimal. This is shown in Figure 16.
![[lab12a-16bit_board_test_5AFE.jpg]]
<div style="text-align: center">Figure 16: FPGA Board Testing of 16-bit CLA</div>
Introducing the 64-bit CLA adder and opening it's elaborated design schematic, we can view it's overall hardware, as seen in Figure 17.
![[lab12b-full_schematic.png]]
<div style="text-align: center">Figure 17: 64-bit CLA Adder Design Schematic</div>
Expanding the adder section, we can view the general hardware of the adder, as seen in Figure 18.
![[lab12b-adder_schematic.png]]
<div style="text-align: center">Figure 18: Expanded 64-bit CLA Adder Design Schematic</div>
After expanding all CLAs, we can get an even more detailed look at the full hardware of the adder, as seen in Figure 19.
![[lab12b-expanded_CLA_schematic.png]]
<div style="text-align: center">Figure 19: Fully Expanded 64-bit CLA Adder Design Schematic</div>
Opening design runs in elaborated design, we can view the total number of look-up tables and flip-flops that this adder uses in Figure 20.
![[lab12b-resource_utilization.png]]
<div style="text-align: center">Figure 20: 64-bit CLA Adder Resource Utilization</div>
After using SerialTool to send data to the board over serial communication, we can view the output of the FPGA board in SerialTool's HEX terminal in Figures 21 and 22.
![[lab12b-serialtool_output_1.png]]
<div style="text-align: center">Figure 21: SerialTool Output of 64-bit CLA Adder (1)</div>
![[lab12b-serialtool_output_2.png]]
<div style="text-align: center">Figure 22: SerialTool Output of 64-bit CLA Adder (2)</div>
Using the given spreadsheet, we can organize these values and compare them to their respected expected values in Figure 23. All of the values we received matched the expected values given.
![[lab12b-excel_spreadsheet.png]]
<div style="text-align: center">Figure 23: Spreadsheet of 64-bit CLA Adder Results</div>
After introducing the 64-bit two-level multiplier, we can view it's elaborated design schematic and expand portions of the hardware as seen in Figure 24.
![[lab12c-schematic-multiplier.png]]
<div style="text-align: center">Figure 24: 64-Bit Two-Level Multiplier Design Schematic</div>
We can zoom in on the CLA portion that only contains 2 CLAs and take a screenshot, as viewed in Figure 25.
![[lab12c-schematic-cla.png]]
<div style="text-align: center">Figure 25: Expanded View of CLAs in 64-Bit Two-Level Multiplier Design Schematic</div>
Opening design runs in elaborated design allows us to view the look-up tables and flip-flops in Vivado 2023 Edition. We can look at this in Figure 26.
![[lab12c-fpgaresources.png]]
<div style="text-align: center">Figure 26: 64-Bit Two-Level Multiplier Resource Utilization</div>
After using SerialTool to send data to the board and receive outputs, we can view these outputs in the HEX terminal and take screenshots of them. These are shown in Figures 27 and 28.
![[lab12c-serialtool-1.png]]
<div style="text-align: center">Figure 27: SerialTool Output of 64-bit Two-Level Multiplier (1)</div>
![[lab12c-serialtool-2.png]]
<div style="text-align: center">Figure 28: SerialTool Output of 64-bit Two-Level Multiplier (2)</div>
We can compile this data into the given spreadsheet, which is shown in Figure 29.
![[lab12c-spreadsheet.png]]
<div style="text-align: center">Figure 29: Spreadsheet of 64-bit Two-Level Multiplier Results</div>
### Discussion
In general this multiplier seems quite expensive compared to other hardware we've covered previously in this course. In Figure 26, we saw that it uses 1023 look-up tables and 416 flip-flops. 
#### Lab 10
In this lab 
##### Part A - Stopwatch
1. It is the fact that the first counter - the clock divider - goes all the way to $2^{20}-1$ instead of 1 million. We solve this by truncating it. We add a comparator and multiplexor that allow us to to truncate at a million.
2. There were 2 clock dividers one on the stopwatch side and one on the multi-segment display side. It only increments when you are press the enable button. 
3. We want all of the counters to reach their maximum value before we increment. We AND all the current enables with the next enable signals. 


##### Part B - Multiplier
1. As we saw with the stopwatch, it counted too far up to $2^{20}-1$ instead of 1 million. The new multiplier truncates the clock cycles only to what we need, and because high precision multiplications take so long, this multiplier is much more efficient because it makes use of CLA adders and skips partial products of 0.
2. If the partial product is a 0, it is skipped and the barrel shifter will shift all of our bits to the left as needed.
3. The done signal is important because the time it takes to multiply can vary. If there is no done signal, the clocks will keep running through all 2048 bits, wasting time.
4. To reduce of the complexity of those specific pieces of hardware. Those are the pieces of hardware that were added to the serial multiplier to make it take less clock cycles, so we want it to be as cheap as possible.
5. It's the part adding all of the partial products, and it's the only one that can enable shifted bits from the barrel shifters when needed, and disabled when there is a 0.

#### Lab 11
 In Lab 11,Our experimental results of the decoder matched the expected results from the handout. However, the outputs of our decoder did not match the inputs of our priority encoder.

16. This tells us that the priority encoder is non-invertable. We cannot figure out what the original input to the priority encoder was, solely based on the decoder output. We would need a standard encoder if we wanted to get the multiplier from the decoder output. A priority encoder will not work.

16. We will split our 128-bit packet into 2 64-bit packets by using a multiplexer to decide which section of bits we will use. For the transceiver, we send this data from the multiplexer to a shift register so when the receiver receives the 64 bits, we will load the shift register with the first 64 bits and wait for the next 64 bits to fully load our shift register.

### Conclusion


### References
[1] M. Phillips, F. Hassan, A. Ammar, and N. Hagerdorn, “Leveraging a Novel Two-Level Priority Encoder for High-Precision Integer Multiplication,” Aug. 2023, doi: https://doi.org/10.1109/mwscas57524.2023.10405960.

‌