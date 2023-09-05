/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// A 2x1 mux with 1-bit output
module mux_1b_2_1 (
    input a0, 
    input a1, 
    input sel, 
    output out
);
    assign out = (sel) ? a1 : a0;

endmodule
