/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// The top module for CPU

module main (
    input clk,
    input rst,
    output [31:0] result
);
    wire [5:0] opcode;
    wire [4:0] func;
    wire [16:0] control_sig;

    control_unit cu (
        .opcode(opcode),
        .func(func),
        .control_sig(control_sig)
    );

    datapath dp (
        .opcode(opcode),
        .func(func),
        .control_sig(control_sig),
        .clk(clk),
        .rst(rst),
        .result_out(result)
    );
endmodule
