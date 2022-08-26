`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// half adder test bench

module half_addr_tb;
    
    // reg: verilog data type that can be synthesized into either sequential or combinational logic

    // A -> 1 bit input
    // B -> 1 bit input
    // out -> 1 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg A = 0;
    reg B = 0;

    // out -> 1 bit sum 
    // cout -> 1 bit carry output
    wire out;
    wire cout;

    // instantiate half adder module and pass in the data 
    half_addr ha(.in1(A), .in2(B), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial
    begin
        // console the values
        $monitor ("A = %d, B = %d, sum = %d, carry = %d", A, B, out, cout);

        // update input values for testing the module (10 unit time delay)
        A = 0; B = 0;
        #10;
        A = 1; B = 0;
        #10;
        A = 0; B = 1;
        #10;
        A = 1; B = 1;
        #10;

        // finish initial block
        $finish; 
    end
endmodule