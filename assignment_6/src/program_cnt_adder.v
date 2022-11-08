`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// program counter adder module

module program_cnt_adder(
    input [31:0] PC_in,
    output [31:0] PC_curr
    );
        
    cla_32_lcu adder(.in1(PC_in), .in2(32'd4), .cin(1'b0), .out(PC_curr));

endmodule 