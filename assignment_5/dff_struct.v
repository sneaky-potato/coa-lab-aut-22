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
    input rst,
    output q
    );

    reg t = 0;

    // output q <- t
    assign q = t;

    always@(posedge clk or posedge rst)
    begin
        // if reset bit is 1 then t <- 0
        if(rst) 
            t = 0;
        // else continue t <- d
        else 
            t = d;
    end

endmodule