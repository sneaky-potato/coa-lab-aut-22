`timescale 1ns / 1ps

module ripple_carry_addr_32_tb;

    reg [31:0] A = 32'd0, B = 32'd0;
    reg cin = 1'b1;

    wire [31:0] out;
    wire cout;

    ripple_carry_addr_32 rca_32(.in1(A), .in2(B), .cin(cin), .out(out), .cout(cout));

    initial
    begin
        $monitor ("A = %d, B = %d, cin = %b, sum = %d, carry = %b", A, B, cin, out, cout);
        // #5 A = 16'd414; B = 16'd1036;
        // #5 A = 16'd5045; B = 16'd45042;
        // #5 A = 16'd32768; B = 16'd32768;
        // #5 A = 16'd65535; B = 16'd65535;
        #5 $finish;
    end
endmodule