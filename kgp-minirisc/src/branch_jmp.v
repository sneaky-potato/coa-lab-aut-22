/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// Branch Unit module

module branch_unit (
    input [31:0] nextPC,
    input [25:0] label0,
    input [15:0] label1,
    input [31:0] rsAddr,
    input lblSel,
    input jumpAddr,
    input branch,
    input validJump,
    output [31:0] nextAddr
);

    wire [31:0] extendLabel0, extendLabel1;
    wire [31:0] M1out, M2out;
    wire isJump;

    assign extendLabel0 = {{6{label0[25]}}, label0};
    assign extendLabel1 = {{16{label1[15]}}, label1};

    // isJump = branch & validJump, this wire goes in a mux to control pc 
    and AND1 (isJump, branch, validJump);

    mux_32b_2_1 M1 (.a0(extendLabel0), .a1(extendLabel1), .sel(lblSel), .out(M1out));
    mux_32b_2_1 M2 (.a0(M1out), .a1(rsAddr), .sel(jumpAddr), .out(M2out));
    mux_32b_2_1 M3 (.a0(nextPC), .a1(M2out), .sel(isJump), .out(nextAddr));
    
endmodule
