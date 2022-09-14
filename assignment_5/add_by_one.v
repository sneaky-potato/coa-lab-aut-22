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

module full_addr_one_bit(
    input in1,
    input cin,
    output out,
    output cout
    );

    // Structural design pattern

    // out = in1 ^ in2 ^ cin
    // but in2 <- 0 by default
    // out = in1 ^ cin
    xor(out, in1, cin);

    // cout = (in1 & in2) | (in1 & cin) | (in2 & cin)
    // but in2 <- 0
    // cout = (in1 & cin)
    and(cout, in1, cin);

endmodule

// ripple carry adder (4 bit)
// inputs: in1 (4 bit), in2 (4 bit) (taken by default 0001 here), cin (cin is input carry)
// outputs: out (4 bit), cout (out is sum, cout is output carry)

module add_by_one(
    input[3:0] in1,
    input cin,
    output[3:0] out,
    output cout
    );

    // auxiliary wires for internal connections
    wire w1, w2, w3;
    
    // concatenating 4 full adders to make a ripple carry adder for 4 bits
    // connect output of previous full adder with input of current full adder using wires
    // Structural design pattern
    full_addr_one_bit addr1(.in1(in1[0]),.cin(cin),.out(out[0]),.cout(w1));
    full_addr_one_bit addr2(.in1(in1[1]),.cin(w1),.out(out[1]),.cout(w2));    
    full_addr_one_bit addr3(.in1(in1[2]),.cin(w2),.out(out[2]),.cout(w3));
    full_addr_one_bit addr4(.in1(in1[3]),.cin(w3),.out(out[3]),.cout(cout));

endmodule

module add_by_one_carry(
    input[3:0] in1,
    input cin,
    output[3:0] out,
    output cout
    );
    
    // auxiliary wires for internal connections and carry bits
    wire c0, c1, c2, c3;
    wire w0, w1, w2, w3;
    // compute propagate and generate bits
    // but prop <- in1;
    // and gen <- 4'b0;

    // compute carry bits using boolean algebra
    // c[i] = gen[i-1] + prop[i-1] * c[i-1]
    // c0 <- cin;
    // c1 <- (in1[0] & c0);
    // c2 <- (in1[1] & c1);
    // c3 <- (in1[2] & c2);

    and a1(c1, in1[0], cin);
    and a2(c2, in1[1], c1);
    and a3(c3, in1[2], c2);

    // calculate final sum using propagate and carry bits
    // out[0] <- in1[0] ^ cin;
    // out[1] <- in1[1] ^ c1;
    // out[2] <- in1[2] ^ c2;
    // out[3] <- in1[3] ^ c3;

    xor x1(out[0], in1[0], cin);
    xor x2(out[1], in1[1], c1);
    xor x3(out[2], in1[2], c2);
    xor x4(out[3], in1[3], c3);
    
    // compute output carry bit 
    // cout <- (in1[3] & in1[2] & in1[1] & in1[0] & cin);
    and a4(w0, in1[0], cin);
    and a5(w1, in1[1], w0);
    and a6(w2, in1[2], w1);
    and a7(cout, in1[3], w2);

endmodule

