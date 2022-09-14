`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 5                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// half adder
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout (out is sum, cout is output carry)

module half_addr(
    input in1,
    input in2,
    output out,
    output cout
    );

    assign out = in1 ^ in2;
    assign cout = in1 & in2;

endmodule

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

    wire sum1;       // output sum of 1 st half adder
    wire carry1;     // output carry of 1st half adder
    wire carry2;     // output carry of 2nd half adder 

    half_addr h1(in1,in2,sum1,carry1);
    half_addr h2(sum1,cin,out,carry2);

    xor(cout, carry1, carry2);
endmodule

// ripple carry adder (4 bit)
// inputs: in1 (4 bit), in2 (4 bit) (taken by default 0001 here), cin (cin is input carry)
// outputs: out (4 bit), cout (out is sum, cout is output carry)

module ripple_carry_addr_4(
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
    full_addr addr1(.in1(in1[0]),.in2(1'b1),.cin(cin),.out(out[0]),.cout(w1));
    full_addr addr2(.in1(in1[1]),.in2(1'b0),.cin(w1),.out(out[1]),.cout(w2));    
    full_addr addr3(.in1(in1[2]),.in2(1'b0),.cin(w2),.out(out[2]),.cout(w3));
    full_addr addr4(.in1(in1[3]),.in2(1'b0),.cin(w3),.out(out[3]),.cout(cout));

endmodule

