`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// ALU module

// ALUop[4] -> memory vs R type
// ALUop[3] -> shift op
// ALUop[2] -> comp op
// ALUop[1] -> direction for shift (left_shift)
// ALUop[0] -> arithmetic_shift shift op

// comp_sel -> I type vs R type 

module alu(
    input signed [31:0] in1, 
    input signed [31:0] in2, 
    input [4:0] ALUop, 
    input comp_sel, 
    output reg carry,
    output reg zero, 
    output reg sign, 
    output reg [31:0] result
    );

    wire carry_wirep;

    // Stores 32-bit output of not, adder1, shifter, and, xor, mux1, mux2 respectively from left to right.
    wire [31:0] not1Out, adder1Out, shifterOut, and1Out, xor1Out, mux1Out, mux2Out;

    mux21_32b mux1 (.in1(in1), .in2(32'd1), .sel(comp_sel), .out(mux1Out));
    mux21_32b mux2 (.in1(in2), .in2(not1Out), .sel(comp_sel), .out(mux2Out));

    cla_32_lcu adder1(.in1(mux1Out), .in2(mux2Out), .cin(1'b0), .cout(carry_wire), .out(adder1Out));

    shifter shifter1 (.in(mux1Out), .shamt(mux2Out), .left_shift(ALUop[1]), .out(shifterOut), .arithmetic_shift(ALUop[0]));

    assign xor1Out = mux1Out ^ mux2Out;
    assign and1Out = mux1Out & mux2Out;
    assign not1Out = ~in2;

    // result changes on change of any input signal
    always @(*) 
    begin
        case(ALUop)
            5'b00000: 
                result = mux1Out;
            // Add operation
            5'b00001: 
            begin
                carry = carry_wire;
                result = adder1Out;
            end
            // Complement operation 
            5'b00101:
                result = adder1Out;
            // And operation
            5'b00010:
                result = and1Out;
            // Xor operation
            5'b00011:
                result = xor1Out;
            // Shift operation
            5'bxx010:
                result = shifterOut;
            default:
                result = 32'd0;
        endcase
    end

    // Flags change on change of result
    always @(result) 
    begin
        if (!result) zero = 1'b1;
        else zero = 1'b0;

        sign = result[31];
    end
    
endmodule
