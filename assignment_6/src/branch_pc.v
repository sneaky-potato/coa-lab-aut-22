`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// branch PC module

module branch_pc (
    input [31:0] nextPC,
    input [25:0] label_addr,
    input [31:0] rs,
    input label,
    input jump_to_reg,
    input branch,
    input validJump,
    output [31:0] nextAddr
    );

    // Stores the 26-bit and 16-bit sign-extended labels
    wire [31:0] extendLabel0, extendLabel1;
    // Stores output of M1 and M2 respectively.
    wire [31:0] out1, out2;
    // Stores output of AND1
    wire isJump;

    assign extendLabel0 = {{6{label_addr[25]}}, label_addr};
    assign extendLabel1 = {{16{label_addr[15]}}, label_addr[15:0]};

    and AND1 (isJump, branch, validJump);

    mux21_32b M1 (.in1(extendLabel0), .in2(extendLabel1), .sel(label), .out(out1));
    mux21_32b M2 (.in1(out1), .in2(rs), .sel(jump_to_reg), .out(out2));
    mux21_32b M3 (.in1(nextPC), .in2(out2), .sel(isJump), .out(nextAddr));
    
endmodule
