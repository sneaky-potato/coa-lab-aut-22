# Assignment 5 &middot;

>

Directory for the `fifth` assignment of Computer Organisation Laboratory course (CS39001) offered in Autumn semester 2022, Department of CSE, IIT Kharagpur.

## Getting started

Read the assignment problem statement from [Assignment_5.pdf](/assignment_5/Assignment_5.pdf)

- For building the binary for first part, use-

```shell
iverilog binary_cnt_tb.v binary_cnt.v -o a.out
```

- For building the binary for second part, use-

```shell
iverilog binary_cnt_struct_tb.v binary_cnt_struct.v dff_struct.v add_by_one.v -o b.out
```

Alternatively, run the make rule for compiling both binaries-

```shell
make
```

Make rule for cleaning the binaries after testing-

```shell
make clean
```

## Solution

### Testing on iverilog

iverilog version information-  

```shell
Icarus Verilog version 11.0 (stable) (v11_0)

Copyright 1998-2020 Stephen Williams

...
```

- [binary_cnt.v](/assignment_5/binary_cnt.v) is the verilog module for first part
- [binary_cnt_tb.v](/assignment_5/binary_cnt_tb.v) is the verilog testbench for `binary_cnt.v`
- [binary_cnt_struct.v](/assignment_5/binary_cnt_struct.v) is the verilog module for second part
- [binary_cnt_struct_tb.v](/assignment_5/binary_cnt_struct_tb.v) is the verilog testbench for `binary_cnt_struct.v`

### Simulating on FPGA using IMPACT 10.0

Simulation was done on the `Spatan3` FPGA board for `Grp 23` in Hardware Laboratory, CSE Department, IIT Kharagpur.

Specifications of hardware FPGA used for simulating the counter-

```shell
Spartan3
XC3S400
PQ208
-3
```

- [clk_divider.v](/assignment_5/clk_divider.v) is the verilog module implmenting a simple clock divider (to take care of vision persistence as mentioned in problem statement). It produces a clock bit which is much slower than the FPGA clock speed.

- [binary_cnt_clk.v](/assignment_5/binary_cnt_clk.v) is the wrapper verilog module for behavioural counter using clock from the clock divider.
- [binary_cnt_clk.ucf](/assignment_5/binary_cnt_clk.ucf) is the corresponding implementation constraints file.

- [binary_cnt_struct_clk.v](/assignment_5/binary_cnt_struct_clk.v) is the wrapper verilog module for structural counter using clock from the clock divider.
- [binary_cnt_struct_clk.ucf](/assignment_5/binary_cnt_struct_clk.ucf) is the corresponding implementation constraints file.
