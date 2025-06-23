# VLSI-design-of-FIR-filter

## Description
This project implements a 4-tap FIR (Finite Impulse Response) filter using Verilog. It is suitable for FPGA deployment and VLSI design simulations.


## Features
>> 4-tap filter.
>> Hardcoded coefficients (can be customized).
>> Works with 8-bit inputs and gives 16-bit output.
>> Testbench included for waveform analysis.


## Files
>> `fir_filter.v` - Main Verilog module
>> `fir_filter_tb.v` - Testbench for simulation


## Tools Used
>> Verilog HDL : Design and implementation of FIR filter.
>> Icarus Verilog (iverilog) : Verilog compiler and simulator.
>> EPWave : Online VCD waveform viewer.
>> MATLAB : To generate FIR filter coefficients.
>> VS Code : Code editor for Verilog development.
>> Vivado/ModelSim for hardware-level simulation or synthesis (not used in this version).



## Simulation Instructions
```sh
vlog fir_filter.v fir_filter_tb.v
vsim fir_filter_tb
add wave *
run 200
