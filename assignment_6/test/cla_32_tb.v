`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// carry look ahead test bench

module cla_32_tb;

    // A -> 16 bit input
    // B -> 16 bit input
    // cin -> 1 bit carry input 
    // out -> 16 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg[31:0] A = 32'd0;
    reg[31:0] B = 32'd0;
    reg cin = 0;

    // out -> 16 bit sum 
    // cout -> 1 bit carry output
    wire [31:0] out;
    wire cout;

    // instantiate carry look ahead adder module and pass in the data 
    cla_32_lcu cla32(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin
        // console the values 
        $monitor("A = %d, B = %d, cin = %d, sum = %d, carry = %d", A, B, cin, out, cout);
        
        // update input values for testing the module (10 unit time delay) 

        A = 32'd123; B = 32'd400;
        #10;
        A = 32'd32768; B = 32'd32768; 
        #10;
        A = 32'd65535; B = 32'd100; 
        #10; 
        A = 32'd1111; B = 32'd0111; 
        #10;

        // finish initial block
        $finish;
    end
endmodule