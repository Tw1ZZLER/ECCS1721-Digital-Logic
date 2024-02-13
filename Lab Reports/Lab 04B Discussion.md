1. Is $N$ close to $N_{actual}$? 

For most of the answers, yes they are close, within about 10% error. However, in the middle row, $E$ resulted in overflow, meaning we did not get an $N$ or $N_{actual}$ 

2. **What could we do to improve the accuracy?**
    
We enhancing the precision of the floating-point division operation, ensuring proper handling of rounding and truncation errors, and refining the normalization process to minimize numerical inaccuracies.

3. **How can we change the hardware description to support higher precision for the reciprocal?**
    
To support higher precision for the reciprocal, we could increase the number of bits allocated for representing the fraction part of the floating-point numbers. This would enable more precise calculations and reduce rounding errors in the reciprocal computation.