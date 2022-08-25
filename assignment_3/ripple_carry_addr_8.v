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
module ripple_carry_addr_8(
    input[7:0] in1, 
    input[7:0] in2, 
    input cin, 
    output[7:0] out,
    output cout
    );

    wire w1, w2, w3;
    wire w4, w5, w6, w7;
    
    full_addr addr1(.in1(in1[0]),.in2(in2[0]),.cin(cin),.out(out[0]),.cout(w1));
    full_addr addr2(.in1(in1[1]),.in2(in2[1]),.cin(w1),.out(out[1]),.cout(w2));    
    full_addr addr3(.in1(in1[2]),.in2(in2[2]),.cin(w2),.out(out[2]),.cout(w3));
    full_addr addr4(.in1(in1[3]),.in2(in2[3]),.cin(w3),.out(out[3]),.cout(w4));
    full_addr addr5(.in1(in1[4]),.in2(in2[4]),.cin(w4),.out(out[4]),.cout(w5));
    full_addr addr6(.in1(in1[5]),.in2(in2[5]),.cin(w5),.out(out[5]),.cout(w6));
    full_addr addr7(.in1(in1[6]),.in2(in2[6]),.cin(w6),.out(out[6]),.cout(w7));
    full_addr addr8(.in1(in1[7]),.in2(in2[7]),.cin(w7),.out(out[7]),.cout(cout));

endmodule

