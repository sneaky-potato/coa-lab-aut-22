`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// ripple carry adder (64 bit)
// inputs: in1 (64 bit), in2 (64 bit), cin (cin is input carry)
// outputs: out (64 bit), cout (out is sum, cout is output carry)

module ripple_carry_addr_64(
    input[63:0] in1, 
    input[63:0] in2, 
    input cin, 
    output[63:0] out, 
    output cout
    );

    // auxiliary wire for connecting two 8 bit ripple carry adders
    wire aux_cout;
    
    // concatenate two 32 bit ripple carry adders to make a ripple carry adder for 64 bits
    // connect output of previous ripple carry adder with input of current ripple carry adder using wire
    // Structural design pattern
    ripple_carry_addr_32 ripple_32_1(.in1(in1[31:0]), .in2(in2[31:0]), .cin(cin), .out(out[31:0]), .cout(aux_cout));
    ripple_carry_addr_32 ripple_32_2(.in1(in1[63:32]), .in2(in2[63:32]), .cin(aux_cout), .out(out[63:32]), .cout(cout));

endmodule
