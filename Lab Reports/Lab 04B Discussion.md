1. Is $N$ close to $N_{actual}$? 

For most of the answers, yes they are close, within about 10% error. However, in the middle row, $E$ resulted in overflow, meaning we did not get an $N$ or $N_{actual}$ 

2. **What could we do to improve the accuracy?**
    
We enhance the precision of the floating-point division operation, ensuring proper handling of rounding and truncation errors, and refine the normalization process to minimize numerical inaccuracies.

3. **How can we change the hardware description to support higher precision for the reciprocal?**
    
We increase the number of bits allocated for representing the fraction part of the floating-point numbers. This means more precise calculations and we reduce rounding errors in the reciprocal computation.