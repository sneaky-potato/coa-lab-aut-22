`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// Main Processor module

module main(
    input clk,
    input rst
    );

    wire [1:0] reg_select;
    wire reg_w;
    wire mem_r;
    wire mem_w;
    wire [1:0] mem_to_reg;
    wire ALUsrc;
    wire [4:0] ALUop;
    wire comp_sel;
    wire branch;
    wire jump_to_reg;
    wire label;
    wire [5:0] opcode;
    wire [5:0] funct;

    datapath dp(clk, rst, reg_select,reg_w,mem_r,mem_w,mem_to_reg,ALUsrc,ALUop, comp_sel,branch,jump_to_reg,label, opcode, funct);
    control_unit cu(opcode, funct, reg_select, reg_w, mem_r, mem_w, mem_to_reg, ALUsrc, ALUop, comp_sel, branch, jump_to_reg, label );
    
endmodule