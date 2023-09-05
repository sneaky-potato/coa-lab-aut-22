/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// Control unit module

module control_unit (
    input [5:0] opcode,
    input [4:0] func,
    output reg [16:0] control_sig
);
    always @(opcode or func) begin
        case (opcode)
            6'b000000 : begin
                case (func)
                    5'b00000 : begin        // add
                        control_sig = 17'b00000000101000100;
                    end 
                    5'b00001 : begin        // comp
                        control_sig = 17'b00010010101000100;
                    end
                    default: begin
                        control_sig = 17'b00000000000000000;
                    end
                endcase
            end
            6'b000001 : begin
                case (func)
                    5'b00000 : begin        // and
                        control_sig =17'b00000001001000100;
                    end 
                    5'b00001 : begin        // xor
                        control_sig =17'b00000001101000100;

                    end
                    default: begin
                        control_sig =17'b00000000000000000;

                    end
                endcase
            end
            6'b000010 : begin
                case (func)
                    5'b00000 : begin        // shll
                        control_sig =17'b00000101011000100;

                    end 
                    5'b00001 : begin        // shrl
                        control_sig =17'b00000100011000100;

                    end
                    5'b00010 : begin        // shllv
                        control_sig =17'b00000101001000100;

                    end 
                    5'b00011 : begin        // shrlv
                        control_sig =17'b00000100001000100;

                    end
                    5'b00100 : begin        // shra
                        control_sig =17'b00000100111000100;

                    end 
                    5'b00101 : begin        // shrav
                        control_sig =17'b00000100101000100;

                    end
                    default: begin
                        control_sig =17'b00000000000000000;

                    end
                endcase
            end
            6'b000011 : begin               // addi
                control_sig =17'b00000000111000100;

            end
            6'b000100 : begin               // compi
                control_sig =17'b00010010111000100;

            end
            6'b000101 : begin               // lw
                control_sig =17'b00001010110101101;

            end
            6'b000110 : begin               // sw
                control_sig =17'b00001010110010000;

            end
            6'b000111 : begin               // bltz
                control_sig =17'b10100000000000000;

            end
            6'b001000 : begin               // bz
                control_sig =17'b10100000000000000;

            end
            6'b001001 : begin               // bnz
                control_sig =17'b10100000000000000;

            end
            6'b001010 : begin               // br
                control_sig =17'b01100000000000000;

            end
            6'b001011 : begin               // b
                control_sig =17'b00100000000000000;

            end
            6'b001100 : begin               // bl
                control_sig =17'b00100000000000110;

            end
            6'b001101 : begin               // bcy
                control_sig =17'b00100000000000000;

            end
            6'b001110 : begin               // bncy
                control_sig =17'b00100000000000000;

            end
            6'b001111:                      //diff
                control_sig =17'b00001111101000100;
            default: begin
                control_sig =17'b00000000000000000;

            end
        endcase
    end
endmodule
