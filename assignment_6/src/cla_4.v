`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// carry look ahead adder 4 bits
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout (out is sum, cout is output carry)

module cla_4(input[3:0] in1,input[3:0] in2,input cin,output[3:0] out,output cout);

    // Behavioural design pattern

    // auxiliary wires for internal connections and carry bits
    wire[3:0] prop;
    wire[3:0] gen;
    wire c0, c1, c2, c3;

    // compute propagate and generate bits
    assign prop = in1 ^ in2;
    assign gen = in1 & in2;

    // compute carry bits using boolean algebra
    // c[i] = gen[i-1] + prop[i-1] * c[i-1]
    assign c0 = cin;
    assign c1 = gen[0] | (prop[0] & c0);
    assign c2 = gen[1] | (prop[1] & c1);
    assign c3 = gen[2] | (prop[2] & c2);

    // calculate final sum using propagate and carry bits
    assign out[0] = prop[0] ^ c0;
    assign out[1] = prop[1] ^ c1;
    assign out[2] = prop[2] ^ c2;
    assign out[3] = prop[3] ^ c3;
    
    // compute output carry bit 
    assign cout = gen[3] | (prop[3] & gen[2]) | (prop[3] & prop[2] & gen[1]) | (prop[3] & prop[2] & prop[1] & gen[0]) | (prop[3] & prop[2] & prop[1] & prop[0] & cin);

endmodule