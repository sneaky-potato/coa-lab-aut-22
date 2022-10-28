`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// carry look ahead adder 32 bits in using look ahead carry unit
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout, propour, genout (out is out, cout is output carry, propout is propagate bit, genout is generate bit)

module cla_32_lcu(input[31:0] in1,input[31:0] in2,input cin,output [31:0] out,output cout, output propout, output genout);

    // auxiliary wires for internal connections, prop, gen and carry bits
    wire [1:0] prop_wire;
    wire [1:0] gen_wire;
    wire [1:0] carry;
	 
	// concatenating 4 carry look ahead augmented adders along with look ahead carry unit to make carry look ahead adder for 16 bits
    // Structural design pattern

    lcu_16 lcu(.prop(prop_wire), .gen(gen_wire), .cin(cin), .carry(carry), .propout(propout), .genout(genout), .cout(cout));

	cla_16_lcu cla1(.in1(in1[15:0]), .in2(in2[15:0]), .cin(cin), .out(out[15:0]), .propout(prop_wire[0]), .genout(gen_wire[0]));
	cla_16_lcu cla2(.in1(in1[31:16]), .in2(in2[31:16]), .cin(carry[1]), .out(out[31:16]), .propout(prop_wire[1]), .genout(gen_wire[1]));

endmodule