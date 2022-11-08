`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// register file module
// configuration: 32 x 32-bit registers

module register_file (
    input clk,
    input rst,
    input [4:0] rs,
    input [4:0] rt,
    input regWrite,
    input [4:0] writeReg,
    input [31:0] writeData,
    output [31:0] rs_out,
    output [31:0] rt_out
    );

    // 32 x 32 2D array
    reg signed [31:0] registers [31:0];
    integer i;

    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
        begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'd0;
        end 
        else if (regWrite) 
        begin
            registers[writeReg] <= writeData;
        end 
    end

    assign rs_out = registers[rs];
    assign rt_out = registers[rt]; 
    // always @(*) begin
    //     rs_out = registers[rs];
    //     rt_out = registers[rt];
    // end

endmodule