`timescale 1ns / 1ps

module label(
    input [25:0] label,
    output [31:0] l1,
    output [31:0] l2
    );
    assign l1 = {{6{label[25]}}, label};
    assign l2 = {{16{label[15]}}, label[15:0]};
endmodule

module label_tb;
    reg [25:0] label;
    wire [31:0] l1;
    wire [31:0] l2;

    label l(label, l1, l2);

    initial 
    begin
        // console the values 
        $monitor("label = %b, l1 = %b, l2 = %b", label, l1, l2);
        
        label = 26'b01010101010101010101000101;
        #10;
        label = 26'b01110101010101010101000100;
        #10;

        // update input values for testing the module (10 unit time delay) 

        // finish initial block
        $finish;
    end
endmodule