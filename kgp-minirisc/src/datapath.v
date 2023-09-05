/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// The datapath module
    
module datapath (
    input [16:0] control_sig,
    input clk,
    input rst,
    output [5:0] opcode,
    output [4:0] func,
    output [31:0] result_out
);
    // $ra register used in br instruction 
    parameter ra = 5'b11111;    // Register ra

    wire enable;
    wire carry, zero, sign, validJump, lastCarry;
    wire [31:0] nextInstrAddr, instruction, writeData, readData1, instrAddr, result, nextPC, readData2, SE1out, b, dataMemReadData;
    wire [25:0] label0;
    wire [15:0] label1, imm;
    wire [4:0] rs, rt, shamt, writeReg;
    wire [31:0] offset;
    
    assign enable = control_sig[3] | control_sig[4];
    assign offset = nextInstrAddr >>> 2'b10;
    
    dff DFF (
        .clk(clk),
        .rst(rst),
        .d(carry),
        .q(lastCarry)
    );
    
    // Instantiating the program counter module
    program_cnt pc (
        .nextI(nextInstrAddr),
        .clk(clk),
        .rst(rst),
        .I(instrAddr)
    );

    // Instantiating the instruction memory module
    bram_instr_mem im1 (
        .clka(clk),
        .ena(1'b1),
        .addra(offset[9:0]),
        .douta(instruction)
    );

    // Instantiating the instruction decoder module
    instruction_decode id1 (
        .instruction(instruction),
        .opcode(opcode),
        .func(func),
        .label0(label0),
        .label1(label1),
        .rs(rs),
        .rt(rt),
        .shamt(shamt),
        .imm(imm)
    );

    // Mux to select the register to which data is to be written
    mux31_5b m1 (
        .a0(rs),
        .a1(rt),
        .a2(ra),
        .sel(control_sig[1:0]),
        .out(writeReg)
    );

    // Instantiating the register file module
    register_file rf1 (
        .rs(rs),
        .rt(rt),
        .regWrite(control_sig[2]),
        .writeReg(writeReg),
        .writeData(writeData),
        .clk(clk),
        .rst(rst),
        .readData1(readData1),
        .readData2(readData2)
    );

    // Instantiating the sign extend module
    immediate_sign_extend se1 (
        .opcode(opcode),
        .func(func),
        .instr(imm),
        .extendImm(SE1out)
    );

    // Mux to choose the second input of the ALU
    mux21_32b m2 (
        .a0(readData2),
        .a1(SE1out),
        .sel(control_sig[7]), 
        .out(b)
    );

    // Instantiating the ALU module
    ALU alu1 (
        .a(readData1),
        .b(b),
        .ALUsel(control_sig[13]),
        .ALUop(control_sig[12:8]),
        .carry(carry),
        .zero(zero), 
        .sign(sign),
        .result(result)
    );

    // Instantiating the jump control module
    jump_control jc1 (
        .opcode(opcode),
        .sign(sign),
        .carry(lastCarry),
        .zero(zero),
        .validJump(validJump)
    );

    // Instantiating the PC increment module
    PC_increment pc_inc1 (
        .instrAddr(instrAddr),
        .nextPC(nextPC)
    );

    // Instantiating the branch unit module
    branch_unit bu1 (
        .nextPC(nextPC),
        .label0(label0),
        .label1(label1),
        .rsAddr(readData1),
        .lblSel(control_sig[16]),
        .jumpAddr(control_sig[15]),
        .branch(control_sig[14]),
        .validJump(validJump),
        .nextAddr(nextInstrAddr)
    );

    // Instantiating the data memory module
    bram_data_mem dm1 (
        .clka(~clk),
        .ena(enable),
        .wea(control_sig[4]),
        .addra(result[9:0] >>> 2'b10),
        .dina(readData2),
        .douta(dataMemReadData)
    );

    // Mux to select the data to be written to the data memory
    mux31_32b m3 (
        .a0(nextPC),
        .a1(dataMemReadData),
        .a2(result),
        .sel(control_sig[6:5]),
        .out(writeData)
    );

    // output port for display
    assign result_out = writeData;

endmodule