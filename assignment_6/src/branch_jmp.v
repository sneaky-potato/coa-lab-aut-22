`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// branch jump module

module branch_jmp (
    input [5:0] opcode,
    input sign,
    input carry,    
    input zero,
    output reg valid_jmp
    );
    
    always @(*) begin
        case (opcode)
            6'b001001 : begin           // bltz
                if (sign && !zero)
                    valid_jmp = 1;
                else 
                    valid_jmp = 0;
            end
            6'b001010 : begin           // bz
                if (!sign && zero)
                    valid_jmp = 1;
                else 
                    valid_jmp = 0;
            end
            6'b001011 : begin           // bnz
                if (!zero)
                    valid_jmp = 1;
                else 
                    valid_jmp = 0;
            end
            6'b001000 : begin           // br
                    valid_jmp = 1;
                end
            6'b000111 : begin           // b
                    valid_jmp = 1;
                end
            6'b001100 : begin           // bl
                    valid_jmp = 1;
                end
            6'b001101 : begin           // bcy
                if (carry)
                    valid_jmp = 1;
                else 
                    valid_jmp = 0;
            end
            6'b001110 : begin           // bncy
                if (!carry)
                    valid_jmp = 1;
                else 
                    valid_jmp = 0;
            end
            default : valid_jmp = 0;
        endcase
    end

endmodule
