## Part B – 64 Bit Two-Level Priority Encoder
#### Elaborated Design Schematic
![[lab11b-full_schematic.png]]
![[lab11b-subschematic.png]]
#### Resource Utilization
![[lab11b-resource-utilization.png]]
#### SerialTool Output
![[lab11b-serialtool_output.png]]
#### Brief Comment
- Our experimental results of the 2-level priority encoder matched the expected results perfectly.
## Part C – 64 Bit Two-Level Decoder
#### Resource Utilization
![[lab11c-resource_utilization.png]]
#### SerialTool Output
![[lab11c-serialtool_output.png]]
#### Brief Comment
- Our experimental results of the decoder matched the expected results from the handout. However, the outputs of our decoder did not match the inputs of our priority encoder.
#### Handout Questions
16. This tells us that the priority encoder is non-invertable. We cannot figure out what the original input to the priority encoder was, solely based on the decoder output. We would need a standard encoder if we wanted to get the multiplier from the decoder output. A priority encoder will not work.
## Part D – 64 Bit Two-Level Barrel Shifter
#### Elaborated Design Schematic
![[lab11d-barrel_shifter_schematic.png]]
#### Resource Utilization
![[lab11d-resource_utilization.png]]
#### SerialTool Output
![[lab11d-serialtool_output.png]]
- The experimental results matched the expected results from the handout.
#### Handout Questions
16. We will split our 128-bit packet into 2 64-bit packets by using a multiplexor to decide which section of bits we will use. For the transciever, we send this data from the multiplexor to a shift register so when the receiver recieves the 64 bits, we will load the shift register with the first 64 bits and wait for the next 64 bits to fully load our shift register.