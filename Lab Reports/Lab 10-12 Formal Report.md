# ECCS 1721
## Lab 10-12 - INSERT TITLE
- Labs Conducted: 
	- Lab 10: 2024-04-02
	- Lab 11: 2024-04-09
	- Lab 12: 2024-04-23
- Lab Group Members:
	- Corbin Hibler
	- Dylan Hughes
### Introduction


### Procedure


### Results
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
After doing testing on the board using the switches, we can view the output of our additions via the seven-segment display. This is shown in Figure 17.

### Discussion/Analysis


### Conclusion


### Attachments / Appendix (optional)