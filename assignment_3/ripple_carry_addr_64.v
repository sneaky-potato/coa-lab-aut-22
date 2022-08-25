`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:23 01/15/2021 
// Design Name: 
// Module Name:    adder_struct 
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
module ripple_carry_addr_64(
    input[63:0] in1, 
    input[63:0] in2, 
    input cin, 
    output[63:0] out, 
    output cout
    );

    wire aux_cout;
    
    ripple_carry_addr_32 ripple_32_1(.in1(in1[31:0]), .in2(in2[31:0]), .cin(c_in), .out(out[31:0]), .cout(aux_cout));
    ripple_carry_addr_32 ripple_32_2(.in1(in1[63:32]), .in2(in2[63:32]), .cin(aux_cout), .out(out[63:32]), .cout(cout));

endmodule
