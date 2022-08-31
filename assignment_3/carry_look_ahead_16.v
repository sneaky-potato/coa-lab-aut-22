`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// carry look ahead adder 16 bits in hierarchical fashion (ripple adder)
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout (out is out, cout is output carry)

module carry_look_ahead_16(input[15:0] in1,input[15:0] in2,input cin,output[15:0] out,output cout);
    
    // auxiliary wires for internal connections
    wire c1, c2, c3;

    // concatenating 4 carry look ahead adders to make carry look ahead adder for 16 bits
    // connect output of previous adder with input of current adder using wires
    // Structural design pattern
    carry_look_ahead_4 cla1(.in1(in1[3:0]), .in2(in2[3:0]), .cin(cin), .out(out[3:0]), .cout(c1));
    carry_look_ahead_4 cla2(.in1(in1[7:4]), .in2(in2[7:4]), .cin(c1), .out(out[7:4]), .cout(c2));
    carry_look_ahead_4 cla3(.in1(in1[11:8]), .in2(in2[11:8]), .cin(c2), .out(out[11:8]), .cout(c3));
    carry_look_ahead_4 cla4(.in1(in1[15:12]), .in2(in2[15:12]), .cin(c3), .out(out[15:12]), .cout(cout));

endmodule