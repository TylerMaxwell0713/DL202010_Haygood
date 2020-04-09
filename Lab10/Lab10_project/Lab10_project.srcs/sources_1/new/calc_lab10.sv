`timescale 1ns / 1ps

module calc_lab10(
    input [15:0] sw,
    input btnU, btnD, clk, btnC, rst, dp, an,
    output [15:0] led

);

//input [15:0] data, 
//    input hex_dec, sign,
//    input rst, clk,
//    output [6:0] seg, 
//    output dp,
//    output [3:0] an

sseg4_TDM disp_unit(.data(sw[15:0]), .sign(), .rst(rst), .clk(clk), .seg(), .dp(dp), .an());

//    input [15:0] sw,
//    input btnU, btnD, clk, btnC,
//    output [15:0] led
top_lab9 calc_unit(.sw(sw[15:0]), .btnU(btnU), .btnD(btnD), .clk(clk), .btnC(btnC), .led());

endmodule
