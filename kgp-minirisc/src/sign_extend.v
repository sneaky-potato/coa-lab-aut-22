/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/
    
`timescale 1ns / 1ps

// Sign extend module for shift amount and immediate value

module immediate_sign_extend (
    input [5:0] opcode,
    input [4:0] func,       
    input [15:0] instr,
    output reg [31:0] extendImm
);
    always @(*) begin
        if (opcode == 6'b000010) begin  
            // for shift amount                
            extendImm = {{27{1'b0}}, instr[15:11]};
        end else begin      
            // immediate value
            extendImm = {{16{instr[15]}}, instr};
        end
    end
endmodule