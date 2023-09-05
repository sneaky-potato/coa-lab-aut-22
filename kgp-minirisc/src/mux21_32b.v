/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// A 2x1 mux with 32-bit output
module mux21_32b (
    input [31:0] a0, 
    input [31:0] a1, 
    input sel, 
    output [31:0] out
);
    
    assign out = (sel) ? a1 : a0;

endmodule
    