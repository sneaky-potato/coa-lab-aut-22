`timescale 1ns / 1ps

module binary_cnt(input clk, input rst, output reg [3:0] cnt);

    //always block will be executed at each and every positive edge of the clock
    always@(posedge clk) 
    begin
        if(rst)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end

endmodule