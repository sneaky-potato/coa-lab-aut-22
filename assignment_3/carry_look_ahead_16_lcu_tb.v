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

module carry_look_ahead_16_lcu_tb;

    // A -> 16 bit input
    // B -> 16 bit input
    // cin -> 1 bit carry input 
    reg[15:0] A = 16'd0;
    reg[15:0] B = 16'd0;
    reg cin = 0;

    // out -> 16 bit sum 
    // cout -> 1 bit carry output
    // prop -> 1 bit output propagate bit
    // gen -> 1 bit output generate bit

    wire [15:0] out;
    wire cout, prop, gen;

    // instantiate carry look ahead adder module and pass in the data 
    carry_look_ahead_16_lcu cla16_lcu(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout), .propout(prop), .genout(gen));

    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin
        // console the values 
        $monitor("A = %d, B = %d, cin = %d, sum = %d, carry = %d, propagate = %d, generate = %d", A, B, cin, out, cout, prop, gen);
        
        // update input values for testing the module (10 unit time delay) 

        A = 16'd123; B = 16'd400;
        #10;
        A = 16'd32768; B = 16'd32768; 
        #10;
        A = 16'd65535; B = 16'd100; 
        #10; 
        A = 16'd1111; B = 16'd0111; 
        #10;

        // finish initial block
        $finish;
    end
endmodule