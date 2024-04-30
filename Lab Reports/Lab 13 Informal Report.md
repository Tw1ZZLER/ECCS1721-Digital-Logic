## Part A - 8-Bit Array Multiplier
#### Elaborated Design Schematic
##### Full Multiplier
![[Pasted image 20240430160230.png]]
##### `sign_magnitude` Component
![[Pasted image 20240430160319.png]]
#### FPGA Resource Utilization
![[Pasted image 20240430160351.png]]
#### Board Test
![[20240430_161615.jpg]]
#### Questions
12. Why is the latency different than the throughput in this implementation?
	- 
## Part B-  8-Bit Serial Multiplier
#### Elaborated Design Schematic
##### Full Multiplier
![[Pasted image 20240430162451.png]]
##### `dataflow` Component
![[Pasted image 20240430162539.png]]
##### `controller` Component
![[Pasted image 20240430162736.png]]
##### `sign_magnitude_f` Component
![[Pasted image 20240430162847.png]]
#### FPGA Resource Utilization
![[Pasted image 20240430163823.png]]
#### Board Test
![[20240430_164521.jpg]]
#### Testing Spreadsheet
![[Pasted image 20240430165307.png]]
#### Questions
12. The only difference between the two was that a positive zero as a multiplicand multiplied with any negative multiplier gives us a negative zero. The array multiplier has the best throughput but has a latency 2 clocks. The two-level multiplier and serial multiplier 
13. The mealy state machine requires only 10 states compared to the moore machine requireing 27 states.  Less States = More cheaper. Multiplier is coming from a flip-flop and mealy requres less clock cycles
14. The moore machine gives an output every clock cycle where the mealy machine needs to wait to check the bit every state cycle making it give an output every 2 clock cycles.
#### Hardware Table

|                   | Array Multiplier | Serial Multiplier |
| ----------------- | ---------------- | ----------------- |
| Area (Complexity) |                  |                   |
| Speed             |                  |                   |
| Power             |                  |                   |
| Latency           |                  |                   |
| Throughput        |                  |                   |
| Modularity        |                  |                   |

## Part C - Prioritization Activity
