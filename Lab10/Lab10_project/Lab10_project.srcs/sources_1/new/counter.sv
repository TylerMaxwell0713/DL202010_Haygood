`timescale 1ns / 1ps

module  counter  #( parameter N=1)
(
    input clk , rst , en ,
    output [N -1:0]  count ,
    output  tick
);

reg [N -1:0]  Q_reg , Q_next;

always @(posedge clk , posedge  rst)
begin
    if (rst)
        Q_reg  <= 0;
    else 
        Q_reg  <= Q_next;
end

always @*
begin
    if (en)
        Q_next = Q_reg + 1;
    else
    Q_next = Q_reg;    // no  change
end

assign count = Q_reg;

assign tick = (Q_reg =={N{1'b1}}) ? 1'b1 : 1'b0;
    
endmodule