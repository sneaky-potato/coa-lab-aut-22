`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// 8 bit ripple carry adder test bench

module ripple_carry_addr_8_tb;

    // A -> 8 bit input
    // B -> 8 bit input
    // cin -> 1 bit carry input 
    // out -> 8 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg [7:0] A = 8'd0;
    reg [7:0] B = 8'd0;
    reg cin = 0;

    // out -> 8 bit sum 
    // cout -> 1 bit carry output
    wire [7:0] out;
    wire cout;

    // instantiate 8 bit ripple carry adder module and pass in the data 
    ripple_carry_addr_8 rca_8(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial
    begin
        // console the values 
        $monitor ("A = %d, B = %d, cin = %d, sum = %d, carry = %d", A, B, cin, out, cout);

        // update input values for testing the module (10 unit time delay)
        A = 8'd0; B = 8'd0; 
        #10;
        A = 8'd45; B = 8'd45;
        #10;
        A = 8'd100; B = 8'd155;
        #10;
        A = 8'd100; B = 8'd155; cin = 1;
        #10;
        A = 8'd255; B = 8'd255; 
        #10;
        A = 8'd127; B = 8'd120; 
        #10;

        // finish initial block
        $finish;
    end
endmodule