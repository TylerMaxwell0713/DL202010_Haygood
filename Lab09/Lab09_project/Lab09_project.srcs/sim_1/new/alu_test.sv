`timescale 1ns / 1ps

module alu_test();

reg [7:0] in0, in1;
reg [3:0] op;
wire [7:0] out;

alu #(.N(8)) alu0(.in0(in0), .in1(in1), .op(op), .out(out));

initial begin

    op = 4'b0000; in0 = 8'b00000101; in1 = 8'b00000101; #10;
    op = 4'b0001; in0 = 8'b00000101; in1 = 8'b00000101; #10;
    op = 4'b0010; in0 = 8'b00000001; in1 = 8'b00000000; #10;
    op = 4'b0011; in0 = 8'b00000001; in1 = 8'b00000000; #10;
    op = 4'b0100; in0 = 8'b00000001; in1 = 8'b00000000; #10;

$finish;
end

endmodule
