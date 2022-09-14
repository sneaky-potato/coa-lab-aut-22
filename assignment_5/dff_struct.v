`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 5                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// d flip flop structural
// inputs: d, clk, rst (rst is reset bit)
// outputs: q

module dff_struct(
    input d,
    input clk,
    output q,
    input rst
    );

    reg t = 0;
    assign q = t;

    always@(posedge clk or posedge rst)
    begin
        if(rst) 
            t = 0;
        else 
            t = d;
    end

endmodule