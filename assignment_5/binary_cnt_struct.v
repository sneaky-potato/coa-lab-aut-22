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

    wire[3:0] sum_out;
    wire C;

    dff_struct d1(sum_out[0], clk, cnt[0], rst);
    dff_struct d2(sum_out[1], clk, cnt[1], rst);
    dff_struct d3(sum_out[2], clk, cnt[2], rst);
    dff_struct d4(sum_out[3], clk, cnt[3], rst);

    ripple_carry_addr_4 rca_4(cnt, 1'b0, sum_out, C);

endmodule