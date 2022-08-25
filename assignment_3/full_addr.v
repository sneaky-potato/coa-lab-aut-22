`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:56 01/15/2021 
// Design Name: 
// Module Name:    full_addr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module full_addr(input in1,input in2,input cin,output out,output cout);

    // Behavioural design pattern
    assign out = in1 ^ in2 ^ cin;
    assign cout = in1 & (in2 | cin) | (in2 & cin);

endmodule