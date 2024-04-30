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
12. The only difference between the two was that a positive zero as a multiplicand multiplied with any negative multiplier gives us a negative zero. The array multiplier has the best throughput but has a latency 2 clocks. The two-level multiplier and serial multiplier both have the same throughput and latency because you give them an input and you have hit reset. The latency and throughput of them is $n + 2$ clock cycles, where $n$ is the number of bits of the multiplier. Our version is taking to $n + 3$, which 19 clock cycles. Two level multiplier is a little more expensive than serial, but it's latency and throughput are both $n/2$ clock cycles.
13. 
14. 
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
