/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// Program counter module
    
module program_cnt (
    input [31:0] nextI,
    input clk, 
    input rst,
    output reg [31:0] I
);

    always @(posedge clk or posedge rst) begin
        if (rst) I <= -32'd4;
        else I <= nextI;
    end

endmodule

