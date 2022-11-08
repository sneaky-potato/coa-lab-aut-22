`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// datapath module

module datapath(
    input clk,
    input rst,
    input [1:0] reg_select,
    input reg_w,
    input mem_r,
    input mem_w,
    input [1:0] mem_to_reg,
    input ALUsrc,
    input [4:0] ALUop,
    input comp_sel,
    input branch,
    input jump_to_reg,
    input label,
    output [5:0] opcode,
    output [5:0] funct
    );

    wire mem_access;
    wire [31:0] offset;
    wire carry, prev_carry, zero, sign, valid_jmp;
    wire [25:0] label_addr;
    wire [15:0] immediate;
    
    wire [31:0] instruction_addr, next_instr, instruction;

    wire [31:0] writeData, readData1, instrAddr, result, nextPC, readData2, SE1out, b, dataMemReadData;
    wire [4:0] rs, rt, shamt, writeReg;
	 
    // 31st register (for storing jump register address)
    parameter ra = 5'b11111;

    or or1(mem_access, mem_r, mem_w);
    // Next instruction
    shifter sh1(.in(next_instr), .shamt(32'd2), .left_shift(1'b1), .arithmetic_shift(1'b1), .out(offset));

    dff dff1(.clk(clk), .rst(rst), .d(carry), .q(prev_carry));

    program_cnt pc(
        .clk(clk),
        .rst(rst),
        .PC_in(next_instr),
        .PC_curr(instruction_addr)
    );

    instruction_memory im (.clka(clk), .addra(offset[9:0]),.douta(instruction));

    ins_decode decoder (
        .instruction(instruction),
        .opcode(opcode),
        .funct(funct),
        .label_addr(label_addr),
        .rs(rs),
        .rt(rt),
        .shamt(shamt),
        .immediate(immediate)
    );

    mux31_5b m1(
        .in1(rs),
        .in2(rt),
        .in3(ra),
        .sel(reg_select),
        .out(writeReg)
    );

    register_file rf (
        .clk(clk),
        .rst(rst),
        .rs(rs),
        .rt(rt),
        .regWrite(regWrite),
        .writeReg(writeReg),
        .writeData(writeData),
        .rs_out(rs_out),
        .rt_out(rt_out)
    );

    sign_extend se1 (
        .opcode(opcode),
        .funct(funct),
        .immediate(immediate),
        .extend_immediate(extend_immediate)
    );

    mux21_32b m2 (
        .in1(rt_out),
        .in2(extend_immediate),
        .sel(ALUsrc), 
        .out(b)
    );

    alu alu1 (
        .in1(readData1),
        .in2(b),
        .ALUop(ALUop),
        .comp_sel(comp_sel),
        .carry(carry),
        .zero(zero), 
        .sign(sign),
        .result(result)
    );

    branch_jmp bj (
        .opcode(opcode),
        .sign(sign),
        .carry(prev_carry),
        .zero(zero),
        .valid_jmp(valid_jmp)
    );

    program_cnt_adder pc_addr (
        .PC_in(instruction_addr),
        .PC_curr(nextPC)
    );

    branch_pc bp (
        .nextPC(nextPC),
        .label_addr(label_addr),
        .rs(rs_out),
        .label(label),
        .jump_to_reg(jump_to_reg),
        .branch(branch),
        .validJump(validJump),
        .nextAddr(next_instr)
    );

    data_memory dm (.clka(~clk),.ena(mem_access),.wea(mem_w), .addra(result[9:0] >>> 2'b10),.dina(readData2), .douta(dataMemReadData));

    mux31_32b m3 (
        .in1(nextPC),
        .in2(dataMemReadData),
        .in3(result),
        .sel(mem_to_reg),
        .out(writeData)
    );

endmodule