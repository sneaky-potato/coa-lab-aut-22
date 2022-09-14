`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 5                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// binary counter structural
// inputs: clk, rst (clk is clock bit, rst is reset bit)
// outputs: cnt (4 bit) (cnt is counter value)

module binary_cnt_struct(input clk, input rst, output wire [3:0] cnt);

    wire[3:0] s_out;
    wire cout;

    // pass in values
    // in1 <- cnt
    // cin <- 1
    // s_out <- out
    // cout <- cout
    add_by_one_carry add1(.in1(cnt), .cin(1'b1), .out(s_out), .cout(cout));

    // use the dff to assign bit values of the counter sum (s_out) to original counter (cnt) 
    dff_struct d1(s_out[0], clk, rst, cnt[0]);
    dff_struct d2(s_out[1], clk, rst, cnt[1]);
    dff_struct d3(s_out[2], clk, rst, cnt[2]);
    dff_struct d4(s_out[3], clk, rst, cnt[3]);

endmodule