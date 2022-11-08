`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/


// Shift operation module

module shifter(
    input signed [31:0] in, 
    input [31:0] shamt, 
    input left_shift, 
    input arithmetic_shift,
    output reg [31:0] out
    );

    // Combinational always block
    always @(*) 
    begin
        if (arithmetic_shift)
        // Arithmetic right shift -> shifting the bits to the right while retaining MSB 
        begin
            if (left_shift) 
            begin
                out = in;
            end else 
            begin
                out = in >>> shamt;
            end
        end else 
        begin
            if (left_shift) 
            begin
                out = in << shamt;
            end else 
            begin
                out = in >> shamt;
            end
        end
    end
endmodule