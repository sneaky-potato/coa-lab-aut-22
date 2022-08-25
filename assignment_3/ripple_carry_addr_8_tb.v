`timescale 1ns / 1ps

module ripple_carry_addr_8_tb;

    reg [7:0] A = 8'b00000001, B = 8'b00000001;
    reg cin = 1'b0;
    wire [7:0] out;
    wire cout;

    ripple_carry_addr_8 rca_8(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    initial
    begin
        $monitor ("A = %d, B = %d, cin = %d, sum = %d, carry = %d", A, B, cin, out, cout);
        #5 A = 8'b00100010; B = 8'b00000010;
        #5 A = 8'b10000000; B = 8'b10000000;
        #5 A = 8'b10000011; B = 8'b10001110;
        #5 A = 8'b00001101; B = 8'b01001010;
        #5 $finish;
    end
endmodule