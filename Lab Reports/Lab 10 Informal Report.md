## Part A - Stopwatch
1. It is the fact that the first counter - the clock divider - goes all the way to 2^20-1 instead of 1 million. We solve this by truncating it. We add a comparator and multiplexor that allow us to to truncate at a million.
2. There were 2 clock dividers one on the stopwatch side and one on the multi-segment display side. It only increments when you are press the enable button. 
3. We want all of the counters to reach their maximum value before we increment. We AND all the current enables with the next enable signals. 


## Part B - Multiplier
1.
2. 
3. 
4. To reduce of the complexity of those specific pieces of hardware. Those are the pieces of hardware that were added to the serial multiplier to make it take less clock cycles, so we want it to be as cheap as possible.
5. It's the part adding all of the partial products, and it's the only one that can enable shifted bits from the barrel shifters when needed, and disabled when there is a 0.