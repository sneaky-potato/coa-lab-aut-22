/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// The jump control block

module jump_control (
    input [5:0] opcode,
    input sign,
    input carry,
    input zero,
    output reg validJump
);
    // validJump is controlled using ALU flags 
    always @(*) begin
        case (opcode)
            6'b000111 :           // bltz
                if (sign && !zero)
                    validJump = 1;
                else 
                    validJump = 0;
            6'b001000 :            // bz
                if (!sign && zero)
                    validJump = 1;
                else 
                    validJump = 0;
            6'b001001 :           // bnz
                if (!zero)
                    validJump = 1;
                else 
                    validJump = 0;
            6'b001010 :          // br
                    validJump = 1;
            6'b001011 :          // b
                    validJump = 1;
            6'b001100 :          // bl
                    validJump = 1;
            6'b001101 :          // bcy
                if (carry)
                    validJump = 1;
                else 
                    validJump = 0;
            6'b001110 :           // bncy
                if (!carry)
                    validJump = 1;
                else 
                    validJump = 0;
            default : validJump = 0;
        endcase
    end

endmodule
