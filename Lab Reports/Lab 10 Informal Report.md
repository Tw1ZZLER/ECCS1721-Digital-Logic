1. t is the fact that the first counter - the clock divider - goes all the way to 2^20-1 instead of 1 million. We solve this by truncating it. We add a comparator and multiplexor that allow us to to truncate at a million.
2. There were 2 clock dividers one on the stopwatch side and one on the multi-segment display side. It only increments when you are press the enable button. 
3. We want all of the counters to reach their maximum value before we increment. We AND all the current enables with the next enable signals. 
4. What is the advantage of using the "fine-coarse" concept in multiple components of the two-level multiplier, including the encoder, decoder, and barrel shifter? 
	1. 
5. Why is the carry-look-ahead adder essential in this multiplier? Your answers will help you write your final project report.
	1. 