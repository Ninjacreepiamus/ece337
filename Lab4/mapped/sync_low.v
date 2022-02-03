/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb  3 09:48:58 2022
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   intermediate;

  DFFSR intermediate_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        intermediate) );
  DFFSR sync_out_reg ( .D(intermediate), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out) );
endmodule

