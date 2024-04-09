## Part B – 64 Bit Two-Level Priority Encoder
#### Elaborated Design Schematic
![[Pasted image 20240409160706.png]]
![[Pasted image 20240409160814.png]]
#### Resource Utilization
![[Pasted image 20240409160910.png]]
#### SerialTool Output
![[Pasted image 20240409161802.png]]
#### Brief Comment
- Our experimental results of the 2-level priority encoder matched the expected results perfectly.
## Part C – 64 Bit Two-Level Decoder
#### Resource Utilization
![[Pasted image 20240409163507.png]]
#### SerialTool Output
![[Pasted image 20240409164219.png]]
#### Brief Comment
- Our experimental results of the decoder matched the expected results from the handout. However, the outputs of our decoder did not match the inputs of our priority encoder.
#### Handout Questions
16. This tells us that the priority encoder is non-invertable. We cannot figure out what the original input to the priority encoder was, solely based on the decoder output. We would need a standard encoder if we wanted to get the multiplier from the decoder output. A priority encoder will not work.
## Part D – 64 Bit Two-Level Barrel Shifter
#### Elaborated Design Schematic
![[Pasted image 20240409165840.png]]
#### Resource Utilization
![[Pasted image 20240409170144.png]]
#### SerialTool Output
![[Pasted image 20240409170805.png]]
- The experimental results matched the expected results from the handout.
#### Handout Questions
16. We will split our 128-bit packet into 2 64-bit packets by using a multiplexor to decide which section of bits we will use. For the transciever, we send this data from the multiplexor to a shift register so when the receiver recieves the 64 bits, we will load the shift register with the first 64 bits and wait for the next 64 bits to fully load our shift register.