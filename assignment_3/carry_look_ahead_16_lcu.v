`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// carry look ahead adder 16 bits in using look ahead carry unit
// inputs: in1, in2, cin (cin is input carry)
// outputs: out, cout, propour, genout (out is out, cout is output carry, propout is propagate bit, genout is generate bit)

module carry_look_ahead_16_lcu(input[15:0] in1,input[15:0] in2,input cin,output[15:0] out,output cout, output propout, output genout);

    // auxiliary wires for internal connections, prop, gen and carry bits
	wire [3:0] prop_wire;
	wire [3:0] gen_wire;
    wire [3:0] c_wire; 
	 
	// concatenating 4 carry look ahead augmented adders along with look ahead carry unit to make carry look ahead adder for 16 bits
    // Structural design pattern

	// look ahead carry unit to output and store carry bits (c_wire)
	look_ahead_carry_unit lcu(.prop(prop_wire), .gen(gen_wire), .cin(cin), .carry(c_wire), .cout(cout), .propout(propout), .genout(genout));

	carry_look_ahead_4_aug cla1_aug(.in1(in1[3:0]), .in2(in2[3:0]), .cin(cin), .out(out[3:0]), .prop(prop_wire[0]), .gen(gen_wire[0]));
	carry_look_ahead_4_aug cla2_aug(.in1(in1[7:4]), .in2(in2[7:4]), .cin(c_wire[1]), .out(out[7:4]), .prop(prop_wire[1]), .gen(gen_wire[1]));
	carry_look_ahead_4_aug cla3_aug(.in1(in1[11:8]), .in2(in2[11:8]), .cin(c_wire[2]), .out(out[11:8]), .prop(prop_wire[2]), .gen(gen_wire[2]));
	carry_look_ahead_4_aug cla4_aug(.in1(in1[15:12]), .in2(in2[15:12]), .cin(c_wire[3]), .out(out[15:12]), .prop(prop_wire[3]), .gen(gen_wire[3]));
	

endmodule