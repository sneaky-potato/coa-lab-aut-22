`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 5                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// binary counter structural with clock divider

module binary_cnt_struct_clk(
    input clk,
    input rst,
    output[3:0] cnt
    );

    wire customclk;

    // clk -> 1 bit clock
    // rst -> 1 bit reset bit
    clk_divider clk_div(.clk(clk), .rst(rst), .customclk(customclk));
    binary_cnt_struct counter(.clk(customclk), .rst(rst), .cnt(cnt));
    
endmodule