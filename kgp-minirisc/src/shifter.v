/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// Module to implement shift operations for the ALU
module shifter(
    input signed [31:0] in, 
    input [31:0] shamt, 
    input direction, 
    input arithmetic,
    output reg [31:0] out
);
    // arithmetic = 1 indicates arithmetic shift
    // direction = 1 indicates left shift
    always @(*) begin
        if (arithmetic) begin
            if (!direction) out = in >>> shamt;     // Arithmetic right shift
            else out = in;
        end else begin
            if (!direction) out = in >> shamt;      // Logical right shift
            else out = in << shamt;      // Left shift
        end
    end

endmodule
