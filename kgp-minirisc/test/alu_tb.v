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
    
    // Inputs
    reg signed [31:0] a;
    reg signed [31:0] b; 
    reg ALUsel;
    reg [4:0] ALUop; 

    wire carry;
    wire zero;
    wire sign; 
    wire [31:0] result;

    // Instantiate the unit under test
    alu alu1(.in1(a), .in2(b), .ALUsel(ALUsel), .ALUop(ALUop), .carry(carry), .zero(zero), .sign(sign), .result(result));
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, a = %d, b = %d, ALUsel = %b, ALUop = %b, carry = %b, zero = %b, sign = %b, result = %b", $time, a, b, ALUsel, ALUop, carry, zero, sign, result);
        
        // Stimulus to verify the working of the ALU
        b = 32'b00000000000000000000000000000111;
        a = 32'b11111111111111000001111111111111;
        ALUsel = 1'b0;
        ALUop = 5'b00000;
        #5 ALUop = 5'b00001;
        #5 ALUop = 5'b00101;
        #5 ALUop = 5'b10101;
        #5 ALUop = 5'b00010;
        #5 ALUop = 5'b00011;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01001;
        #5 ALUop = 5'b01001;

        #5 ALUsel = 1'b1; ALUop = 5'b00001;
        #5 ALUop = 5'b00101;
        #5 ALUop = 5'b10101;
        #5 ALUop = 5'b00010;
        #5 ALUop = 5'b00011;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01010;
        #5 ALUop = 5'b01000;
        #5 ALUop = 5'b01001;
        #5 ALUop = 5'b01001;  
        #5 $finish;
    end
endmodule
