`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// D Flip Flop module
module dff (
    input clk, 
    input rst, 
    input d, 
    output reg q
);
    
    always @(posedge clk or posedge rst) 
    begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
    
endmodule
