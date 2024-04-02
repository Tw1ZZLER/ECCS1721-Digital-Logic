## Part A - Stopwatch
1. It is the fact that the first counter - the clock divider - goes all the way to $2^{20}-1$ instead of 1 million. We solve this by truncating it. We add a comparator and multiplexor that allow us to to truncate at a million.
2. There were 2 clock dividers one on the stopwatch side and one on the multi-segment display side. It only increments when you are press the enable button. 
3. We want all of the counters to reach their maximum value before we increment. We AND all the current enables with the next enable signals. 


## Part B - Multiplier
1. As we saw with the stopwatch, it counted too far up to $2^{20}-1$ instead of 1 million. The new multiplier truncates the clock cycles only to what we need, and because high precision multiplications take so long, this multiplier is much more efficient because it makes use of CLA adders and skips partial products of 0.
2. If the partial product is a 0, it is skipped and the barrel shifter will shift all of our bits to the left as needed.
3. The done signal is important because the time it takes to multiply can vary. If there is no done signal, the clocks will keep running through all 2048 bits, wasting time.
4. To reduce of the complexity of those specific pieces of hardware. Those are the pieces of hardware that were added to the serial multiplier to make it take less clock cycles, so we want it to be as cheap as possible.
5. It's the part adding all of the partial products, and it's the only one that can enable shifted bits from the barrel shifters when needed, and disabled when there is a 0.