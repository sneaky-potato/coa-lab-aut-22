`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// ALU test bench

module alu_tb;

    // A -> 16 bit input
    // B -> 16 bit input
    // cin -> 1 bit carry input 
    // out -> 16 bit output (sum)
    // cout -> 1 bit output (carry output)
    reg signed [31:0] in1, 
    reg signed [31:0] in2, 
    reg ALUsel, 
    reg [4:0] ALUop, 
    wire carry,
    wire zero, 
    wire sign, 
    wire [31:0] result

    // instantiate carry look ahead adder module and pass in the data 
    alu alu_module(.in1(in1), .in2(in2), .ALUsel(ALUsel), .ALUop(ALUop), .carry(carry), .zero(zero), .sign(sign), .result(result));

    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin
        // console the values 
        $monitor("A = %d, B = %d, ALUsel = %d, ALUop = %d, carry = %d, zero = %d, sign = %d, result = %d", in1, in2, ALUsel, ALUop, carry, zero, sign, result);
        
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