`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// half adder
// inputs: in1, in2
// outputs: out, cout (out is sum and cout is output carry)

module half_addr(input in1,input in2,output out,output cout);

    // behavioural design pattern
    assign out = in1 ^ in2;
    assign cout = in1 & in2;
    
endmodule
