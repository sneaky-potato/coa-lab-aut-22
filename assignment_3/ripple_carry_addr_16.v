`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// ripple carry adder (16 bit)
// inputs: in1 (16 bit), in2 (16 bit), cin (cin is input carry)
// outputs: out (16 bit), cout (out is sum, cout is output carry)

module ripple_carry_addr_16(
    input[15:0] in1, 
    input[15:0] in2, 
    input cin, 
    output[15:0] out, 
    output cout
    );

    // auxiliary wire for connecting two 8 bit ripple carry adders
    wire aux_cout;

    // concatenate two 8 bit ripple carry adders to make a ripple carry adder for 16 bits
    // connect output of previous ripple carry adder with input of current ripple carry adder using wire
    // Structural design pattern
    ripple_carry_addr_8 ripple_8_1(.in1(in1[7:0]), .in2(in2[7:0]), .cin(cin), .out(out[7:0]), .cout(aux_cout));
    ripple_carry_addr_8 ripple_8_2(.in1(in1[15:8]), .in2(in2[15:8]), .cin(aux_cout), .out(out[15:8]), .cout(cout));

endmodule
