`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// full adder
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout (out is sum, cout is output carry)

module full_addr(input in1,input in2,input cin,output out,output cout);

    // Behavioural design pattern
    assign out = in1 ^ in2 ^ cin;
    assign cout = in1 & (in2 | cin) | (in2 & cin);

endmodule