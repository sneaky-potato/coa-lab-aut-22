`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 5                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// binary counter structural test bench

module binary_cnt_struct_tb;

    // clk -> 1 bit clock
    // rst -> 1 bit reset bit
    reg clk;
    reg rst;

    // cnt -> 4 bit output counter
    wire [3:0] cnt;

    // instantiate binary counter module and pass in the data
    binary_cnt_struct counter(.clk(clk), .rst(rst), .cnt(cnt));
    
    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin 
        clk = 1'b0; 
        repeat(30) #3 clk = ~clk;
    end

    // initial block to be executed at the start of the simulation (time 0)
    initial 
    begin 
        $monitor("time=%0d, rst=%b, count=%b",$time,rst,cnt);
        rst=1'b0;
        #7;
        rst=1'b1; 
        #35;
        rst=1'b0;
    end
    
endmodule