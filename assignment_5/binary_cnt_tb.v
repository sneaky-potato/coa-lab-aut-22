`timescale 1ns / 1ps

module binary_cnt_tb;

    reg clk,rst;
    wire [3:0] cnt;

    binary_cnt counter(.clk(clk), .rst(rst), .cnt(cnt));
    
    // block for clock
    // This clock will flip its value every 3ns  

    initial 
    begin 
        clk = 1'b0; 
        repeat(30) #3 clk= ~clk;
    end

    // block for reset input wire
    initial 
    begin 
        rst=1'b0;
        #7;
        rst=1'b1; 
        #35;
        rst=1'b0;
    end

    // block for printing on monitor
    initial 
    begin 
        $monitor("time=%0d, rst=%b, count=%b",$time,rst,cnt);
    end
    
endmodule