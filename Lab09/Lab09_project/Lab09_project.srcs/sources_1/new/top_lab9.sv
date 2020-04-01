`timescale 1ns / 1ps

module top_lab9(
    input [15:0] sw,
    input btnU, btnD, clk, btnC,
    output [15:0] led
);

wire [7:0] r1Out, alu1Out, r2Out;
wire [3:0] AluOp;
wire [7:0] Din0;

assign Din0 = sw[7:0];
assign AluOp = sw[11:8];

register #(.N(8)) r1 (.D(Din0) , .clk(clk) , .en(btnD) , .rst(btnC) , .Q(r1Out));  

alu #(.N(8)) alu1 (.in0(Din0), .in1(r1Out), .op(AluOp), .out(alu1Out)); 

register #(.N(8)) r2 (.D(alu1Out) , .clk(clk) , .en(btnU) , .rst(btnC) , .Q(r2Out));  

assign led [7:0] = r1Out;

assign led [15:8] = r2Out;

endmodule
