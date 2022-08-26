`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// ripple carry adder (32 bit)
// inputs: in1 (32 bit), in2 (32 bit), cin (cin is input carry)
// outputs: out (32 bit), cout (out is sum, cout is output carry)

module ripple_carry_addr_32(
    input[31:0] in1, 
    input[31:0] in2, 
    input cin, 
    output[31:0] out, 
    output cout
    );

    // auxiliary wire for connecting two 8 bit ripple carry adders
    wire aux_cout;

    // concatenate two 16 bit ripple carry adders to make a ripple carry adder for 32 bits
    // connect output of previous ripple carry adder with input of current ripple carry adder using wire
    // Structural design pattern
    ripple_carry_addr_16 ripple_16_1(.in1(in1[15:0]), .in2(in2[15:0]), .cin(cin), .out(out[15:0]), .cout(aux_cout));
    ripple_carry_addr_16 ripple_16_2(.in1(in1[31:16]), .in2(in2[31:16]), .cin(aux_cout), .out(out[31:16]), .cout(cout));

endmodule
