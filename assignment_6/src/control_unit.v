`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// control unit module

// op -> 6 bit operation code in encoding
// funct -> 5 bit function code in encoding
// reg_select -> 2 bit destination register selector (00: $rs, 01: $rt, 10: $ra)
// reg_w -> 1 bit register write indicator selector (1: for writing into register file, 0: otherwise)
// mem_r -> 1 bit memory read indicator selector (1: for reading from memory, 0: otherwise)
// mem_w -> 1 bit memory write indicator selector (1: for writing to memory, 0: otherwise)
// mem_to_reg -> 2 bit memory to register write selector (00: mem -> $ra, 01: mem -> $rt, 10: mem -> $rs)

module control_unit (
    input [5:0] opcode,
    input [4:0] funct,
    output reg [1:0] reg_select,
    output reg reg_w,
    output reg mem_r,
    output reg mem_w,
    output reg [1:0] mem_to_reg,
    output reg ALUsrc,
    output reg [4:0] ALUop,
    output reg comp_sel,
    output reg branch,
    output reg jump_to_reg,
    output reg label
    );

    always @(opcode or funct)
    begin
        case(opcode)
        6'b000000:
            case(funct)
            // add
            5'b00000: begin
                reg_select = 2'b00;
                reg_w = 1'b1;
                mem_r = 1'b0;
                mem_w = 1'b0;
                mem_to_reg = 2'b10;
                ALUsrc = 1'b0;
                ALUop = 5'b00001;
                comp_sel = 1'b0;
                branch = 1'b0;
                jump_to_reg = 1'b0;
                label = 1'b0;
            end
            // comp
            5'b00001: begin
                reg_select = 2'b00;
                reg_w = 1'b1;
                mem_r = 1'b0;
                mem_w = 1'b0;
                mem_to_reg = 2'b10;
                ALUsrc = 1'b0;
                ALUop = 5'b00101;
                comp_sel = 1'b1;
                branch = 1'b0;
                jump_to_reg = 1'b0;
                label = 1'b0;
            end
            default: begin
                reg_select = 2'b00;
                reg_w = 1'b0;
                mem_r = 1'b0;
                mem_w = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                comp_sel = 1'b0;
                branch = 1'b0;
                jump_to_reg = 1'b0;
                label = 1'b0;
            end
            endcase
        // addi
        6'b000001 : begin
            reg_select = 2'b00;
            reg_w = 1'b1;
            mem_r = 1'b0;
            mem_w = 1'b0;
            mem_to_reg = 2'b10;
            ALUsrc = 1'b1;
            ALUop = 5'b00001;
            comp_sel = 1'b0;
            branch = 1'b0;
            jump_to_reg = 1'b0;
            label = 1'b0;
            end
        // compi
        6'b000010 : begin
            reg_select = 2'b00;
            reg_w = 1'b1;
            mem_r = 1'b0;
            mem_w = 1'b0;
            mem_to_reg = 2'b10;
            ALUsrc = 1'b1;
            ALUop = 5'b00101;
            comp_sel = 1'b1;
            branch = 1'b0;
            jump_to_reg = 1'b0;
            label = 1'b0;
        end
        6'b000011:
            case (funct)
            // and
            5'b00000 : begin
                reg_select = 2'b00;
                reg_w = 1'b1;
                mem_r = 1'b0;
                mem_w = 1'b0;
                mem_to_reg = 2'b10;
                ALUsrc = 1'b0;
                ALUop = 5'b00010;
                comp_sel = 1'b0;
                branch = 1'b0;
                jump_to_reg = 1'b0;
                label = 1'b0;
            end 
            // xor
            5'b00001 : begin
                reg_select = 2'b00;
                reg_w = 1'b1;
                mem_r = 1'b0;
                mem_w = 1'b0;
                mem_to_reg = 2'b10;
                ALUsrc = 1'b0;
                ALUop = 5'b00011;
                comp_sel = 1'b0;
                branch = 1'b0;
                jump_to_reg = 1'b0;
                label = 1'b0;
            end
            default: begin
                reg_select = 2'b00;
                reg_w = 1'b0;
                mem_r = 1'b0;
                mem_w = 1'b0;
                mem_to_reg = 2'b00;
                ALUsrc = 1'b0;
                ALUop = 5'b00000;
                comp_sel = 1'b0;
                branch = 1'b0;
                jump_to_reg = 1'b0;
                label = 1'b0;
            end
            endcase
        endcase
    end



endmodule