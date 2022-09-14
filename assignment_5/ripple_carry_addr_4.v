`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 5                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// full adder
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout (out is sum, cout is output carry)

module full_addr(
    input in1,
    input in2,
    input cin,
    output out,
    output cout
    );

    wire w1, w2;
    wire v1, v2, v3, v4;

    // Structural design pattern

    // out = in1 ^ in2 ^ cin
    xor(w1, in1, in2);
    xor(out, w1, cin);

    // cout = (in1 & in2) | (in1 & cin) | (in2 & cin)
    and(v1, in1, in2);
    and(v2, in1, cin);
    and(v3, in2, cin);

    or(v4, v1, v2);
    or(cout, v4, v3);

endmodule

// ripple carry adder (4 bit)
// inputs: in1 (4 bit), in2 (4 bit) (taken by default 0001 here), cin (cin is input carry)
// outputs: out (4 bit), cout (out is sum, cout is output carry)

module ripple_carry_addr_4(
    input[3:0] in1, 
    input[3:0] in2,
    input cin, 
    output[3:0] out,
    output cout
    );

    // auxiliary wires for internal connections
    wire w1, w2, w3;
    
    // concatenating 4 full adders to make a ripple carry adder for 4 bits
    // connect output of previous full adder with input of current full adder using wires
    // Structural design pattern
    full_addr addr1(.in1(in1[0]),.in2(in2[0]),.cin(cin),.out(out[0]),.cout(w1));
    full_addr addr2(.in1(in1[1]),.in2(in2[1]),.cin(w1),.out(out[1]),.cout(w2));    
    full_addr addr3(.in1(in1[2]),.in2(in2[2]),.cin(w2),.out(out[2]),.cout(w3));
    full_addr addr4(.in1(in1[3]),.in2(in2[3]),.cin(w3),.out(out[3]),.cout(cout));

endmodule

