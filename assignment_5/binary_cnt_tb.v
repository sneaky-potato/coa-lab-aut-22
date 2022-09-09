`timescale 1ns / 1ps

module binary_cnt_tb;

    reg clk,rst;
    reg [3:0] data;
    wire [3:0] cnt;

    binary_cnt counter(.clk(clk), .rst(rst), .cnt(cnt));
    
    // block for clock
    initial 
    begin 
        clk = 1'b0; 
        repeat(30) #3 clk= ~clk;
    end

    // block for reset input wire
    initial 
    begin 
        rst=1'b1;
        #7 rst=1'b0; 
        #35 rst=1'b1;
    end

    // block for printing on monitor
    initial 
    begin 
        $monitor("time=%0d, rst=%b, count=%d",$time,rst,cnt);
    end
    
endmodule