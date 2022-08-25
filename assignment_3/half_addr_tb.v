`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2020 22:06:13
// Design Name: 
// Module Name: eightBitAdderTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//////////////////////////////////////////////////////////////////////////////////

module half_addr_tb;
    
    reg A = 1'b0;
    reg B = 1'b1;
    reg cin = 1'b0;

    wire out;
    wire cout;

    half_addr ha(.in1(A), .in2(B), .out(out), .cout(cout));

    initial
    begin
        $monitor ("A = %d, B = %d, sum = %d, carry = %d", A, B, out, cout);
        #5 A = 0; B = 0;
		#5 A = 1; B = 1;
		#5 A = 1; B = 0;
		#5 A = 0; B = 1;
        #5 $finish;
    end
endmodule