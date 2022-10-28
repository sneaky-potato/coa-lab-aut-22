`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// cout look adder
// inputs: prop, gen, cin (prop is input propagate bit, gen is input generate bit, cin is input cout)
// outputs: carry, propout, genout, cout (cout is output cout)

module lcu_16(input[1:0] prop,input[1:0] gen,input cin, output [1:0] carry, output propout, output genout,output cout);

    // Behavioural design pattern

	// compute carry bits using boolean algebra
	assign carry[0] = cin;
    assign carry[1] = gen[0] | (prop[0] & cin);

	assign cout = gen[1] | (prop[1] & gen[0]) | (prop[1] & prop[0] & cin);
	
endmodule