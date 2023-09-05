/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// ALU module to compute the result and flags

module ALU (
    input signed [31:0] a, 
    input signed [31:0] b, 
    input ALUsel, 
    input [4:0] ALUop, 
    output reg carry, 
    output reg zero, 
    output reg sign, 
    output reg [31:0] result
);
    wire carryTemp;

    wire [31:0] not1Out, adder1Out, shifterOut, and1Out, xor1Out, mux1Out, mux2Out;

    mux21_32b mux1 (.a0(a), .a1(32'd1), .sel(ALUsel), .out(mux1Out));
    mux21_32b mux2 (.a0(b), .a1(not1Out), .sel(ALUsel), .out(mux2Out));

    adder adder1 (.a(mux1Out), .b(mux2Out), .c_in(1'b0), .c_out(carryTemp), .sum(adder1Out));

    shifter shifter1 (.in(mux1Out), .shamt(mux2Out), .direction(ALUop[1]), .out(shifterOut), .arithmetic(ALUop[0]));

    assign not1Out = ~b;
    assign and1Out = mux1Out & mux2Out;
    assign xor1Out = mux1Out ^ mux2Out;
    assign diffandout = (xor1Out) & (xor1Out - 1);
    assign diffout = diffandout ^ xor1Out;

    // result changes on change of any input signal

    always @(*) begin
        if (ALUop == 5'b00000) result = mux1Out;
        else if (ALUop == 5'b00001) begin
            carry = carryTemp;
            result = adder1Out;
        end
        else if (ALUop == 5'b00101) result = adder1Out;
        else if (ALUop == 5'b10101) result = adder1Out;
        else if (ALUop == 5'b00010) result = and1Out;
        else if (ALUop == 5'b00011) result = xor1Out;
        else if (ALUop[4:2] == 3'b010) result = shifterOut;
        else if (ALUop == 5'b11111) result = diffout;
        else result = 32'd0;
    end

    always @(result) begin
        if (!result)
            zero = 1'b1;
        else zero = 1'b0;
        sign = result[31];
    end
    
endmodule