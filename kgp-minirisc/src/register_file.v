/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// register file module

module register_file (
    input [4:0] rs,
    input [4:0] rt,
    input regWrite,
    input [4:0] writeReg,
    input [31:0] writeData,
    input clk,
    input rst,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);

    reg signed [31:0] registerBank [31:0];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                registerBank[i] <= 32'd0;
        end else if (regWrite) begin
            registerBank[writeReg] <= writeData;
        end 
    end

    always @(registerBank[rs] or registerBank[rt]) begin
        readData1 = registerBank[rs];
        readData2 = registerBank[rt];
    end

endmodule
