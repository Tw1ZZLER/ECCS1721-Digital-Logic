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
After running through more tests, this time using the decoder, using SerialTool's HEX terminal, we get outputs from the FPGA device in hexadecimal. These are shown in Figure 5:

### Discussion/Analysis


### Conclusion


### Attachments / Appendix (optional)