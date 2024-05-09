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
	From lab 10 to lab 12 we analyzed the design and functions of the parts that make up a two-level multiplier.  We separrated the two-level multiplier into its major components, the priority encoder, decoder, barrel shifter, and carry-look-ahead adder.  Using Vivado we learned the concepts and applications of serial communication

### Methodology


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
### Discussion/Analysis


### Conclusion


### References
[1] M. Phillips, F. Hassan, A. Ammar, and N. Hagerdorn, “Leveraging a Novel Two-Level Priority Encoder for High-Precision Integer Multiplication,” Aug. 2023, doi: https://doi.org/10.1109/mwscas57524.2023.10405960.

‌