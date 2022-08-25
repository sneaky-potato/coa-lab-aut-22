`timescale 1ns / 1ps

module ripple_carry_addr_16_tb;

    reg[15:0] A;
    reg[15:0] B;
    reg cin = 1'b0;

    wire[15:0] out;
    wire cout;

    ripple_carry_addr_16 rca_16(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    initial
    begin
        $monitor ("A = %d, B = %d, cin = %b, sum = %d, carry = %b", A, B, cin, out, cout);
        #100 A = 16'd414; B = 16'd1036;
        #100 A = 16'd5045; B = 16'd45042;
        #100 A = 16'd32768; B = 16'd32768;
        #100 A = 16'd65535; B = 16'd65535;
        #100 $finish;
    end
endmodule