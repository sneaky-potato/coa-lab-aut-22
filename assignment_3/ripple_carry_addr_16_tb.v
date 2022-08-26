`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// 16 bit ripple carry adder test bench

module ripple_carry_addr_16_tb;

    // A -> 16 bit input
    // B -> 16 bit input
    // cin -> 1 bit carry input 
    // out -> 16 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg[15:0] A = 16'd0;
    reg[15:0] B = 16'd0;
    reg cin = 0;

    // out -> 16 bit sum 
    // cout -> 1 bit carry output
    wire[15:0] out;
    wire cout;

    // instantiate 16 bit ripple carry adder module and pass in the data 
    ripple_carry_addr_16 rca_16(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial
    begin
        // console the values 
        $monitor ("A = %d, B = %d, cin = %b, sum = %d, carry = %b", A, B, cin, out, cout);

        // update input values for testing the module (10 unit time delay)
        A = 16'd0; B = 16'd0; 
        #10;
        A = 16'd100; B = 16'd300;
        #10;
        A = 16'd65535; B = 16'd1;
        #10;
        A = 16'd32768; B = 16'd32767;
        #10;
        A = 16'd32768; B = 16'd32767; cin = 1; 
        #10;
        A = 16'd127; B = 16'd120; 
        #10;

        // finish initial block
        $finish;
    end
endmodule