`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// 64 bit ripple carry adder test bench

module ripple_carry_addr_64_tb;

    // A -> 64 bit input
    // B -> 64 bit input
    // cin -> 1 bit carry input 
    // out -> 64 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg [63:0] A = 64'd0;
    reg [63:0] B = 64'd0;
    reg cin = 0;

    // out -> 64 bit sum 
    // cout -> 1 bit carry output
    wire [63:0] out;
    wire cout;

    // instantiate 64 bit ripple carry adder module and pass in the data 
    ripple_carry_addr_64 rca_64(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial
    begin
        // console the values 
        $monitor ("A = %d, B = %d, cin = %b, sum = %d, carry = %b", A, B, cin, out, cout);

        // update input values for testing the module (10 unit time delay)
        A = 64'd0; B = 64'd0; 
        #10;
        A = 64'd1845; B = 64'd8998;
        #10;
        A = 64'd4294967295; B = 64'd4294967290;
        #10;
        A = 64'd487845858; B = 64'd0; cin = 1;
        #10;
        A = 64'd100000000000; B = 64'd4294967290;
        #10;
        A = 64'd127; B = 64'd120; 
        #10;

        // finish initial block
        $finish;
    end
endmodule