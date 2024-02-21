# ECCS 1721
## Lab 02 - Introduction to VHDL
- Lab Conducted: 2024-01-30
- Lab Group Members:
	- Corbin Hibler
	- Dylan Hughes
### Introduction
- In this lab, we will use Vivado to simulate a simple comparator, and we will use and read through a VHDL file to learn how and why it works. VHDL is a type of hardware-descriptive language that we will understand how to use in Vivado.
### Procedure
- First we download the lab02.vhd file from Canvas. 
	- This file contains the VHDL code that we will use in Vivado
- We will add this file to a Vivado project.
- We will click `Run Simulation` and view our waveform afterwards.
- In order to give our own inputs, we will right click on each input and click `Force Constant` to add our own inputs.
	- We want to change from `Hexadecimal` to `Binary`
	- We will enter a 5-digit binary constant to each input
- After we have entered our own inputs, we press the `Run` button with a small `(T)` underneath of it to regenerate our simulation.
	- We can now look at our waveform simulation and see our changes and our new outputs! We should see 2 difference calculations and 2 outputs.
- We will finish messing with the waveform simulation by taking a screenshot and closing out of it.
	- Optionally, we could save our waveform to our project file for later use.
- Afterwards, we will run synthesis.
	- We will click `Run Synthesis` and watch the bottom right pane and wait for it to complete.

### Results
- In our simulation, we created a waveform of what our hardware is doing at each nanosecond, as shown in Figure 1:
![[waveform-02-01.png]]
Figure 1: Waveform Simulation of Comparator

- We can also view a hardware schematic of our simulation, with no changes to the VHDL, as shown in Figure 2:
![[02-schematic.png]]
Figure 2: Schematic of Hardware without any changes

- We can remove the signed 0 from the schematic as well, and we get the following schematic in Figure 3:
![[02-schematic-1.png]]
Figure 3: Schematic of Hardware with the signed 0 removed


### Discussion
- It was very interesting to see how simulated hardware can be visualized using waveforms, and the capabilities of Vivado to do so.
- This piece of hardware, known commonly as a comparator, is a simple device that takes two inputs, takes the difference, sends that as one output, then takes another difference, and sends that as the other output. This is an extremely common and useful piece of hardware that is very common. 
	- Some of our first experience with comparators is actually using them in Minecraft's redstone system, which is capable of making basic computers. 
- In Figure 1, we saw how changing the 2 inputs would affect the outputs, and we could see how the outputs operated with an additional bit using sign extension.
- In Figure 2 and Figure 3, we could see a visual representation of our simulation and the small but significant changes that signs have on our program.
- This lab was very enjoyable. It was interesting to see how Vivado is used firsthand and being able to experiment with it ourselves. We look forward to seeing how to use it more in-depth as the course continues.

### Conclusion
We have created a simulation that represents a simple comparator using principles such as signed 5 bit, sign extension, and unsigned 5 bit.  By using the various ways of displaying the simulation we can more easily interpret and explain the details of the simulation to learn all the parts of a digital comparator.