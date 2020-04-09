`timescale 1ns / 1ps

module sseg4_TDM(

input [15:0] data, 
    input hex_dec, sign,
    input rst, clk,
    output [6:0] seg, 
    output dp,
    output [3:0] an
);
    
  wire [15:0] elvbout, mux2out;
  wire [3:0] mux4out;
  wire [6:0] decout;
  wire c1tick;
  wire andecout;
  wire mTwosel;  
  wire [1:0] digit_sel;
  
   counter #(.N(18)) timer(.clk(clk), .rst(rst), .en(1), .tick(c1tick));
   
   counter #(.N(18)) counter2(.clk(c1tick), .rst(rst), .en(1), .count(digit_sel));
  
   ElevenBitBCD Elv0(.in(data[10:0]), .out(elvbout));
   
   mux2 #(.N(16)) mux_hexdec(.in0(data), .in1(elvbout), .sel(hex_dec), .out(mux2out));
    
   mux4 #(.N(4)) mux4in(.in0(mux2out[3:0]), .in1(mux2out[7:4]), .in2(mux2out[11:8]), 
                        .in3(mux2out[15:12]), .sel(digit_sel), .out(mux4out)); 
   
   sseg_decoder d1(.num(mux4out), .sseg(decout));
    
   an_decoder andec(.in(digit_sel), .out(an));
   
   assign mTwosel = ~an[3];
   
   and gate0(andecout, sign, mTwosel);
    
   mux2 #(.N(7)) muxpdec(.in0(decout), .in1(7'b0111111), .sel(andecout), .out(seg));  
   
   assign dp = 1;
  
endmodule
