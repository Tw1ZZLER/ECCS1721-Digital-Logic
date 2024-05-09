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
At a high-level, the multiplication algorithm works by taking the multiplier and multiplicand and placing them into registers, or $n$-bit flip-flops. The multiplier is sent to the two-level priority encoder, where the encoded data is then sent to a two-level decoder and a barrel shifter. The decoder will XOR its output with the output of the multiplier to give the CLR input to the multiplier register, which will only delete the most significant high-bit. The barrel-shifter takes the inputs of the priority encoder and the multiplicand register and will output to the carry-look ahead adder, which will then add it with the output of the product register, to produce the bits for the product register every cycle.

#### Two-Level Priority Encoder
To make high-precision integer multiplication more efficient, the main component of our 64-bit two-level multiplier is a two-level priority encoder. The priority encoder will then take the 64-bit input and convert it into a 6-bit string. This will then be outputted to the decoder and barrel shifter. A schematic of this encoder can be found in Figure 1, along with an expanded view in Figure 2. A $n$-input two-level priority encoder  requires many gates, as cost and complexity increases exponentially with large $n$ values [1]. We can see the example of this in Figure 3, where the encoder uses a large number of flip-flops and look-up tables. For this reason, normal priority encoders are not typically used for high-precision applications, such as a high input multipliers. However, by using a two-level priority encoder, we can make a new, more efficient design. 

#### Two-Level Decoder
The next component of our multiplier is a two-level decoder, which will decode the output of the priority encoder and send that data to an XOR gate with the output of the multiplier register. The decoder will take the value given by the priority encoder and turn it back into a 64-bit string of bits, which is then used to determine the high-bits that will be sent back into the multiplier register. We can see the results of this decoder in Figure 7.

#### Two-Level Barrel Shifter
The two-level priority encoder will also send data to the two-level barrel shifter. The barrel shifter will take the 6-bit string and shift its bits into a 128-bit string, effectively performing a $n/2$ or $n\cdot2$  operation on the bit string [1]. This is then outputted to the carry-look-ahead adder. The schematic of the barrel shifter is shown in Figure 8, with its resource utilization in Figure 9 and SerialTool outputs in Figure 10.

#### Carry-Look-Ahead Adder
The carry-look-ahead adder recieves the bit string from the barrel shifter and will add it to the output of the current product register. For the first term, the product register will be 0, meaning that the output of the CLA will just be the output of the barrel shifter, which will be a 128-bit output. After that, it will add the previous product register to the next term from the barrel shifter, and so on. The hardware diagram of this adder is shown in Figures 17-19. The resource utilization is shown in Figure 20, and the results are shown in Figures 21-23.

#### Logic Gates
To finish off the design of the multiplier, we tie everything together using XOR and NOR gates. An 64-input XOR gate is used to calculate the most-significant high bit we will remove from the multiplier register. A 2-input XOR gate is used to calculate the $S_{Prod}$ bit, which is just the sign bit of the product. A bitwise NOR gate will read the output of the multiplier register, and only outputs 1 when all of the multiplier register bits are 0. This signifies that the multiplier register has shifted all the way to 0, meaning that the multiplication is complete, and the NOR gate will give the DONE signal [1]. These gates can be seen in Figure 24.

#### Serial Transceiver
The serial transceiver, a hardware module written by Max, is an important piece for hardware for our application. Since the FPGA board only has a set of 16 switches and cannot take many more inputs, as there are less than 256 pins available on the board, we must instead use serial data transmitted via USB. The serial transceiver will read the bits one at a time and slice them up into the appropriate bit strings to load into the multiplicand and multiplier registers. This is why in SerialTool we are sending the multiplicand and multiplier as a single hexadecimal string.

#### Clock Cycle
In one clock cycle of this multiplier, we produce a single partial product of the multiplier and multiplicand. We use the decoder's output to consume the most significant high bit of the multiplier register, which lets the hardware continue to the next high bit on the next clock cycle [1]. We then use the barrel shifter to shift the bits of the multiplier register, moving our partial products over 1 bit each clock cycle. We can then add the output of the product register with the output of the barrel shifter and get a new product register each clock cycle. Once the multiplier register is 0, the multiplier is finished.

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
In this lab we discussed how the two level multiplier was more suitable for high precision multiplications than a previously covered array multiplier.  This was because the two-level multiplier had a more efficient clock that truncated the clock cycles only to what we need, saving time for these complicated multiplications that already take many clock cycles to complete.  It was also more efficient  due to using CLA adders to skip partial products of 0's.  It does this because if the partial product was a 0 it can be skipped and the barrel shifter can shift the bits left as needed.
Once the whole multiplier input has been read a "done" signal is needed because the time it takes for the multiplication to complete can vary.  If there was no "done" signal the multiplier would go through all 2048 bits which would waste a lot of time.  In order to further reduce the cost of the hardware we used a "fine-coarse" method in the barrel shifter to simplify the hardware and shrink the number of clock cycles needed, making the hardware as cheap as possible.  Lastly the carry-look-ahead adder was the final essential piece being the part that was adding all the partial products, and the only component that can enable and disable shifted bits from the barrel shifter when needed.

#### Lab 11
 In Lab 11, Our experimental results of the decoder matched the expected results from the handout. However, the outputs of our decoder did not match the inputs of our priority encoder as shown in Figure 7.  This told us that the priority encoder is non-invertible. We cannot figure out what the original input to the priority encoder was, solely based on the decoder output. We would need a standard encoder if we wanted to get the multiplier from the decoder output. A priority encoder will not work. 
  In order to make the hardware container view the most significant half of the output we would split our 128-bit packet into 2 64-bit packets by using a multiplexer to decide which section of bits we will use. For the transceiver, we send this data from the multiplexer to a shift register so when the receiver receives the 64 bits, we will load the shift register with the first 64 bits and wait for the next 64 bits to fully load our shift register.

#### Lab 12
In this lab we created and tested CLA's of increasing sizes to better understand their recursive nature as shown in Figure 19.  Every recursion had a similar structure of four CLA adder blocks and one CLA logic block with each adder block containing another iteration of this structure for however many recursions were necessary as shown in Figure 18. 

#### Final Thoughts
The whole multiplier cost 1023 LUT's and 416 FF's as shown in Figure 26.  this is slightly less

### Conclusion
To summarize, we produced a 64-bit two-level multiplier by utilizing multiple components of hardware, including the two-level priority encoder, an efficient encoder that saves area and complexity. The 64-bit two-level multiplier discussed in this lab  was designed by ONU's ECCS department, and was the subject of a research project.

The three labs, the writing of this report, and the reading of the paper all helped us to better understand the different pieces of hardware used and hardware in general. The project was very comprehensive of all topics covered in the course, including but not limited to: binary arithmetic, logic gates, encoders, decoders, adders, multiplexers, shift registers, barrel shifters, flip-flops, and especially VHDL. The three labs were useful in understanding the real-world applications of digital logic, which includes high-speed, high-precision arithmetic. Multiplication is a complex task, and optimizing the process for computers is important. 

We learned all the important outcomes of the labs, including understanding VHDL components and their creation, and connections to other pieces of hardware. Additionally, we have seen two multiplication methods, one that was hand-crafted by our own faculty, and can apply them in the future. We know that the FPGA board can only support so many inputs, as do many other devices, and why serial communication is important.

Overall, we enjoyed working on this project. Digital logic was the favorite class of the semester, and very much tied into our goals as electrical and computer engineers. Hardware is the building blocks of everything to come, and it's been very interesting so far. 

### References
[1] M. Phillips, F. Hassan, A. Ammar, and N. Hagerdorn, “Leveraging a Novel Two-Level Priority Encoder for High-Precision Integer Multiplication,” Aug. 2023, doi: https://doi.org/10.1109/mwscas57524.2023.10405960.

‌