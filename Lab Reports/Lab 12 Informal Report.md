## Part A – 4 Bit and 16 Bit CLA Adders
### 4-Bit CLA
#### Elaborated Design Schematic
![[Pasted image 20240423154604.png]]
#### Resource Utilization
![[Pasted image 20240423152417.png]]
#### Board Testing 
![[20240423_152603.jpg]]
### 16-Bit CLA
#### Elaborated Design Schematic
![[Pasted image 20240423160507.png]]
#### Resource Utilization
![[Pasted image 20240423160526.png]]
#### Board Testing
![[20240423_155216.jpg]]

## Part B – 64 Bit CLA Adder using Serial Communication
#### Elaborated Design Schematic
##### Full Schematic
![[Pasted image 20240423162159.png]]
##### Adder
![[Pasted image 20240423162241.png]]
##### Expanded CLAs
![[Pasted image 20240423164543.png]]
#### Resource Utilization
![[Pasted image 20240423162310.png]]
#### Serial Testing Results
![[Pasted image 20240423164110.png]]
![[Pasted image 20240423164052.png]]

| Input (127..0)   |                  | Expected Result (127..0) |                  | Actual Result (127..0) |                  |
| ---------------- | ---------------- | ------------------------ | ---------------- | ---------------------- | ---------------- |
| Addend (127..64) | Augend (63..0)   | Carry Out (64)           | Sum (63..0)      | Carry Out (64)         | Sum (63..0)      |
| 0001020304050607 | 08090A0B0C0D0E0F | 0                        | 080A0C0E10121416 | 0                      | 080A0C0E10121416 |
| 8D8B667EC0A9E8E2 | B378F62F36596213 | 1                        | 41045CADF7034AF5 | 1                      | 41045CADF7034AF5 |
| 0000000000000000 | 0000000000000001 | 0                        | 0000000000000001 | 0                      | 0000000000000001 |
| FFFFFFFFFFFFFFFF | 0000000000000001 | 1                        | 0000000000000000 | 1                      | 0000000000000000 |
| FFFFFFFFFFFFFFFF | FFFFFFFFFFFFFFFF | 1                        | FFFFFFFFFFFFFFFE | 1                      | FFFFFFFFFFFFFFFE |
| 8000000000000000 | 8000000000000000 | 1                        | 0000000000000000 | 1                      | 0000000000000000 |
| 5555555555555555 | AAAAAAAAAAAAAAAA | 0                        | FFFFFFFFFFFFFFFF | 0                      | FFFFFFFFFFFFFFFF |
#### Brief Comment
Our test results matched the results that we expected.
