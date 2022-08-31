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

module carry_look_ahead_4_tb;

    // A -> 4 bit input
    // B -> 4 bit input
    // cin -> 1 bit carry input 
    reg[3:0] A = 4'b0000;
    reg[3:0] B = 4'b0000;
    reg cin = 0;

    // out -> 4 bit sum 
    // cout -> 1 bit carry output
    wire [3:0] out;
    wire cout;

    // instantiate carry look ahead adder module and pass in the data 
    carry_look_ahead_4 cla4(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin
        // console the values 
        $monitor("A = %d, B = %d, cin = %d, sum = %d, carry = %d", A, B, cin, out, cout);
        
        // update input values for testing the module (10 unit time delay) 

        A = 4'b0001; B = 4'b0001;
        #10;
        A = 4'b0111; B = 4'b1000; 
        #10;
        A = 4'b1110; B = 4'b0010; 
        #10; 
        A = 4'b1111; B = 4'b0111; 
        #10;

        // finish initial block
        $finish;
    end
endmodule