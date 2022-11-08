`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// A 3x1 mux with 5-bit output

module mux31_5b (
    input [4:0] in1, 
    input [4:0] in2, 
    input [4:0] in3, 
    input [1:0] sel, 
    output reg [4:0] out
);

    always @(*) begin
        case (sel)
            2'b00 : out = in1;
            2'b01 : out = in2;
            2'b10 : out = in3;
            default : out = in3;
        endcase
    end
    
endmodule