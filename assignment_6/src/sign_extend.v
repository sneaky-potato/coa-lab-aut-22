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

module sign_extend(
    input [5:0] opcode,
    input [4:0] funct,
    input [16:0] immediate,
    output reg [31:0] extend_immediate
    );

    always @(*) 
    begin
        // shamt in case of shift operation
        if (opcode == 6'b000100) extend_immediate = {{27{1'b0}}, immediate[15:11]};
        // I format instruction
        else extend_immediate = {{16{immediate[15]}}, immediate};
    end

endmodule