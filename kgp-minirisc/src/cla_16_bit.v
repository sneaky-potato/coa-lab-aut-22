/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

module cla_16_bit(
    input [15:0] a, 
    input [15:0] b, 
    input c_in, 
    output [15:0] sum, 
    output c_out
);
   
    parameter k = 1'b1;
    wire [3:0] p, g, c;

    cla_4_bit cla1(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(), .P(p[0]), .G(g[0]));
    cla_4_bit cla2(.a(a[7:4]), .b(b[7:4]), .c_in(c[1]), .sum(sum[7:4]), .c_out(), .P(p[1]), .G(g[1]));
    cla_4_bit cla3(.a(a[11:8]), .b(b[11:8]), .c_in(c[2]), .sum(sum[11:8]), .c_out(), .P(p[2]), .G(g[2]));
    cla_4_bit cla4(.a(a[15:12]), .b(b[15:12]), .c_in(c[3]), .sum(sum[15:12]), .c_out(), .P(p[3]), .G(g[3]));

    lookahead_carry_unit lcu(.p(p), .g(g), .c_in(c_in), .c(c), .c_out(c_out));
endmodule
