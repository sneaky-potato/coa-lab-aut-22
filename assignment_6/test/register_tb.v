`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// register file test bench

module register_tb;

	// clk -> 1 bit clock
    // rst -> 1 bit reset bit
	reg clk;
	reg rst;
	reg [4:0] ra_addr;
	reg [4:0] rb_addr;
	reg regWrite;
	reg [4:0] writeReg;
	reg [31:0] writeData;

	// ra_out -> register a output
    // rb_out -> register b output
	wire [31:0] ra_out;
	wire [31:0] rb_out;

	register_file rf(
        .clk(clk), 
        .rst(rst), 
        .rs(ra_addr), 
        .rt(rb_addr), 
		.regWrite(regWrite),
        .writeReg(writeReg), 
        .writeData(writeData), 
		.rs_out(ra_out), 
		.rt_out(rb_out)
	);

    initial begin
        // Monitor the changes
        $monitor("time = %0d, ra_addr = %d, rb_addr = d, ra_out = %d, rb_out = %d", $time, ra_addr, rb_addr, ra_out, rb_out);
        
        // Stimulus to verify the working of the register file
        clk = 1'b0; regWrite = 1'b0; writeData = 75;
        #2 rst = 1'b1;
        #1 rst = 1'b0;
        #5 ra_addr = 5'b10101; rb_addr = 5'b00101; regWrite = 1'b1; writeData = 45; writeReg = 5'b10101;
        #10 regWrite = 1'b0; writeData = 45; writeReg = 5'b10101;
        #10 regWrite = 1'b1; writeData = 45; writeReg = 5'b10111;
        #10 ra_addr = 5'b10111; writeData = 45; writeReg = 5'b10111;
        #5 $finish;
    end
    
    // Change the clock signal after every 5 time units
    always begin
        #3 clk = ~clk;
    end
      
endmodule