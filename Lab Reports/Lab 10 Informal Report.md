Submit an informal report with answers to the following questions:

1. Why is the two-level multiplier more suitable for high precision as compared to the array multiplier that was covered previously in class? 
	- It is the fact that the first counter - the clock divider - goes all the way to 2^20-1 instead of 1 million. We solve this by truncating it. We add a comparator and multiplexor that allow us to to truncate at a million.
	- 
1. Why does the delay (in clock cycles) of the two-level multiplier depend on the input? 
	- There were 2 clock dividers one on the stopwatch side and one on the multi-segment display side. It only increments when you are press the enable button. 
2. Why it is important to have a "done" signal in the two-level multiplier? 
	- We keep ANDing the current enable with the next enable.
	- 
1. What is the advantage of using the "fine-coarse" concept in multiple components of the two-level multiplier, including the encoder, decoder, and barrel shifter? 
	- 
2. Why is the carry-look-ahead adder essential in this multiplier? Your answers will help you write your final project report.
	- 