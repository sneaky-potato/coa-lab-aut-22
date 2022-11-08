`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// A 2x1 mux with 1-bit output

module mux21(
    input in1, 
    input in2, 
    input sel, 
    output out
    );
    
    assign out = (sel) ? in2 : in1;

endmodule