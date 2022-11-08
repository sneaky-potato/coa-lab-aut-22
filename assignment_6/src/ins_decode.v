`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// instruction decoder

module ins_decode (
    input [31:0] instruction,
    output [5:0] opcode,
    output [4:0] funct,
    output [25:0] label_addr,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] shamt,
    output [15:0] immediate
    );

    assign opcode = instruction[31:26];     // Opcode
    assign funct = instruction[4:0];         // Function code
    assign label_addr = instruction[25:0];      // Jump address for 26-bit addresses
    assign rs = instruction[25:21];         // Register rs
    assign rt = instruction[20:16];         // Register rt
    assign shamt = instruction[15:11];      // Shift amount
    assign immediate = instruction[15:0];         // Immediate value

endmodule