`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 5                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// clock divider

module clk_divider(
    input clk, 
    input rst, 
    output reg customclk
    );

    integer counter;
    always@(posedge clk)
    begin
        if(rst)
            counter=0;
        counter=counter+1;
        if(counter==100000)
        begin
            customclk = ~customclk;
            c=0;
        end
    end

endmodule