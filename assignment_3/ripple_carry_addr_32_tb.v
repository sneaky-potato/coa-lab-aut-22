`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// 32 bit ripple carry adder test bench

module ripple_carry_addr_32_tb;

    // A -> 32 bit input
    // B -> 32 bit input
    // cin -> 1 bit carry input 
    // out -> 32 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg [31:0] A = 32'd0;
    reg [31:0] B = 32'd0;
    reg cin = 0;

    // out -> 32 bit sum 
    // cout -> 1 bit carry output
    wire [31:0] out;
    wire cout;

    // instantiate 32 bit ripple carry adder module and pass in the data 
    ripple_carry_addr_32 rca_32(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial
    begin
        // console the values 
        $monitor ("A = %d, B = %d, cin = %b, sum = %d, carry = %b", A, B, cin, out, cout);

        // update input values for testing the module (10 unit time delay)
        A = 32'd0; B = 32'd0; 
        #10;
        A = 32'd1000; B = 32'd999;
        #10;
        A = 32'd4294967295; B = 32'd0;
        #10;
        A = 32'd4294967295; B = 32'd0; cin = 1;
        #10;
        A = 32'd4294967295; B = 32'd4294967290; cin = 0; 
        #10;
        A = 32'd127; B = 32'd120; 
        #10;

        // finish initial block
        $finish;
    end
endmodule