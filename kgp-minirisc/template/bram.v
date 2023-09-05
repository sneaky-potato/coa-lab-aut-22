`timescale 1ns / 1ps

/*
/////////////////////////////////////////////
//// COA LAB Assignment 3                ////
//// Group Number 23                     ////
//// Ashwani Kumar Kamal (20CS10011)     ////
//// Astitva (20CS30007)                 ////
/////////////////////////////////////////////
*/

// block RAM module template

module bram_module;

    // clk -> 1 bit clock
    input clk;
    input wea;
    input [3:0] addra;
    input [15:0] dina;
    output [15:0] douta;

    bram block_mem(
        .clka(clk), // input clka
        .wea(wea), // input [0 : 0] wea
        .addra(addra), // input [3 : 0] addra
        .dina(dina), // input [15 : 0] dina
        .douta(douta) // output [15 : 0] douta
    );

endmodule