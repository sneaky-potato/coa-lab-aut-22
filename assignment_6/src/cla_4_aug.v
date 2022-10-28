`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// carry look ahead augmented adder 4 bit
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout, prop, gen (out is sum, cout is output carry, prop is propagate bit, gen is generate bit)

module cla_4_aug(input[3:0] in1,input[3:0] in2,input cin,output[3:0] out,output cout,output prop, output gen);

    // Behavioural design pattern

    // auxiliary wires for internal connections, prop, gen and carry bits
    wire[3:0] prop_wire;
    wire[3:0] gen_wire;
    wire c0, c1, c2, c3;

    // compute propagate and generate bits
    assign prop_wire = in1 ^ in2;
    assign gen_wire = in1 & in2;

    // compute carry bits using boolean algebra
    // c[i] = gen[i-1] + prop[i-1] * c[i-1], c[0] = cin
    assign c0 = cin;
    assign c1 = gen_wire[0] | (prop_wire[0] & c0);
    assign c2 = gen_wire[1] | (prop_wire[1] & c1);
    assign c3 = gen_wire[2] | (prop_wire[2] & c2);

    // calculate final sum using propagate and carry bits
    assign out[0] = prop_wire[0] ^ c0;
    assign out[1] = prop_wire[1] ^ c1;
    assign out[2] = prop_wire[2] ^ c2;
    assign out[3] = prop_wire[3] ^ c3;

    // compute block propagate and block generate
    // P (prop) = P3&P2&P1&P0
    // G (gen) = G3 | P3&G2 | P3&P2&G1 | P3&P2&P1&G0  
    assign prop = prop_wire[3] & prop_wire[2] & prop_wire[1] & prop_wire[0];
    assign gen = gen_wire[3] | (prop_wire[3] & gen_wire[2]) | (prop_wire[3] & prop_wire[2] & gen_wire[1]) | (prop_wire[3] & prop_wire[2] & prop_wire[1] & gen_wire[0]);
    
    // assign carry output
    // carry_output = G + (P&cin)
    assign cout = gen + (prop & cin);

endmodule