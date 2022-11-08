`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// program counter module

module program_cnt(
    input clk,
    input rst,
    input [31:0] PC_in,
    output reg [31:0] PC_curr
    );
        
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            PC_curr <= 32'd0;
        end
        else
        begin
            PC_curr <= PC_in;
        end
    end
endmodule 