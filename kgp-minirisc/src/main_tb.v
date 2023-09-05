/*
/////////////////////////////////////////////
//// COA LAB Assignment 6                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

`timescale 1ns / 1ps

// Testbench for the KGPRISC top module
module main_tb;

	// Inputs
	reg clk;
	reg rst;
    wire [31:0] result;
	
	main cpu (
		.clk(clk), 
		.rst(rst),
        .result(result)
	);

	initial begin
		clk = 0;
		rst = 1;
        #5 rst = 0;
		
		// result of cpu
       	#2905 
        $display ("result = %d", result);
        $finish; 
    end

    always begin
        #10 clk = ~clk;
    end
      
endmodule

