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

module look_ahead_carry_unit(input[3:0] prop,input[3:0] gen,input cin,output[3:0] carry, output propout, output genout,output cout);

    // Behavioural design pattern

	assign carry[0] = cin;
    assign carry[1] = gen[0] | (prop[0] & carry[0]);
	assign carry[2] = gen[1] | (prop[1] & gen[0]) | (prop[1] & prop[0] & carry[0]);
	assign carry[3] = gen[2] | (prop[2] & gen[1]) | (prop[2] & prop[1] & gen[0]) | (prop[2] & prop[1] & prop[0] & carry[0]);
	assign cout = gen[3] | (prop[3] & gen[2]) | (prop[3] & prop[2] & gen[1]) | (prop[3] & prop[2] & prop[1] & gen[0]) | (prop[3] & prop[2] & prop[1] & prop[0] & carry[0]);
	
	// calculate the block propagate and generate
	assign propout = prop[3] & prop[2] & prop[1] & prop[0];
	assign genout = gen[3] | (prop[3] & gen[2]) | (prop[3] & prop[2] & gen[1]) | (prop[3] & prop[2] & prop[1] & gen[0]);

endmodule