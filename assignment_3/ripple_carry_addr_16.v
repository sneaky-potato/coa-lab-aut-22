`timescale 1ns / 1ps

module ripple_carry_addr_16(
    input[15:0] in1, 
    input[15:0] in2, 
    input cin, 
    output[15:0] out, 
    output cout
    );

    wire aux_cout;

    ripple_carry_addr_8 ripple_8_1(.in1(in1[7:0]), .in2(in2[7:0]), .cin(c_in), .out(out[7:0]), .cout(aux_cout));
    ripple_carry_addr_8 ripple_8_2(.in1(in1[15:8]), .in2(in2[15:8]), .cin(aux_cout), .out(out[15:8]), .cout(cout));

endmodule
