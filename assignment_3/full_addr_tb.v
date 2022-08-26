`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// full adder test bench

module full_addr_tb;

    // A -> 1 bit input
    // B -> 1 bit input
    // cin -> 1 bit carry input 
    // out -> 1 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg A = 0;
    reg B = 0; 
    reg cin = 0;

    // out -> 1 bit sum 
    // cout -> 1 bit carry output
    wire out; 
    wire cout;

    // instantiate full adder module and pass in the data 
    full_addr fa(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin
        // console the values 
        $monitor("A = %d, B = %d, carry_in = %d, sum = %d, carry = %d", A, B, cin, out, cout);
        
        // update input values for testing the module (10 unit time delay)
        A = 0; B = 0; cin = 0;
        #10;
        A = 0; B = 0; cin = 1;
        #10;
        A = 0; B = 1; cin = 0; 
        #10;
        A = 0; B = 1; cin = 1;
        #10;
        A = 1; B = 0; cin = 0; 
        #10;
        A = 1; B = 0; cin = 1;
        #10;
        A = 1; B = 1; cin = 0; 
        #10;
        A = 1; B = 1; cin = 1;
        #10;

        // finish initial block
        $finish;
    end
endmodule
