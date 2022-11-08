`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// A 2x1 mux with 32-bit output

module mux21_32b(
    input [31:0] in1, 
    input [31:0] in2, 
    input sel, 
    output [31:0] out
    );
    
    assign out = (sel) ? in2 : in1;

endmodule