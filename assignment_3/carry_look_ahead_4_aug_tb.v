`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// carry look ahead augmented test bench

module carry_look_ahead_4_aug_tb;

    // A -> 4 bit input
    // B -> 4 bit input
    // cin -> 1 bit carry input 
    reg[3:0] A = 4'b0000;
    reg[3:0] B = 4'b0000;
    reg cin = 0;

    // out -> 4 bit sum 
    // cout -> 1 bit carry output
    // prop -> 1 bit propagate output bit
    // gen -> 1 bit generate output bit
    wire [3:0] out;
    wire cout, prop, gen;

    // instantiate carry look ahead augmented adder module and pass in the data 
    carry_look_ahead_4_aug cla4_aug(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout), .prop(prop), .gen(gen));

    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin
        // console the values 
        $monitor("A = %d, B = %d, cin = %d, sum = %d, carry = %d, propagte = %d, generate = %d", A, B, cin, out, cout, prop, gen);
        
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