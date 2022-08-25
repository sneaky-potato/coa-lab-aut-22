`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:28:16 08/25/2021
// Design Name:   
// Module Name:   full_adder_tb
// Project Name:  Ripple-Carry-Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// 
////////////////////////////////////////////////////////////////////////////////

// Testbench for full adder module
module full_addr_tb;

    // Inputs
    reg A = 1'b0;
    reg B = 1'b0; 
    reg cin = 1'b0;

    // Outputs
    wire out, cout;

    // Instantiate the unit under test
    full_addr fa(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    initial 
    begin
        // Monitor the changes
        $monitor("A = %b, B = %b, cin = %b, sum = %b, carry = %b", A, B, cin, out, cout);
        
        #5 A = 1'b0; B = 1'b0; cin = 1'b1;
        #5 A = 1'b0; B = 1'b1; cin = 1'b0;
        #5 A = 1'b0; B = 1'b1; cin = 1'b1;
        #5 A = 1'b1; B = 1'b0; cin = 1'b0;
        #5 A = 1'b1; B = 1'b0; cin = 1'b1;
        #5 A = 1'b1; B = 1'b1; cin = 1'b0;
        #5 A = 1'b1; B = 1'b1; cin = 1'b1;
        #5 $finish;
    end
endmodule
