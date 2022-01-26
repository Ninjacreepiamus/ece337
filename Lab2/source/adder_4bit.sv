// $Id: $
// File name:   adder_4bit.sv
// Created:     1/20/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a four bit adder using instantiations of four full adders

module adder_4bit(input logic [3:0] a, input logic [3:0] b, input logic carry_in, output logic [3:0] sum, output logic overflow);
  //logic [3:0] carrys;
  //adder_1bit ADD0(.a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(sum[0]), .carry_out(carrys[0]));
  //adder_1bit ADD1(.a(a[1]), .b(b[1]), .carry_in(carrys[0]), .sum(sum[1]), .carry_out(carrys[1]));
  //adder_1bit ADD2(.a(a[2]), .b(b[2]), .carry_in(carrys[1]), .sum(sum[2]), .carry_out(carrys[2]));
  //adder_1bit ADD3(.a(a[3]), .b(b[3]), .carry_in(carrys[2]), .sum(sum[3]), .carry_out(carrys[3]));
  //assign carry_out = carrys[3];
  logic [4:0] carrys;
  
  genvar i;

  assign carrys[0] = carry_in;

  generate
    for (i = 0; i <= 3; i = i + 1) begin
      adder_1bit IX(.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i + 1]));
    end
  endgenerate

  assign overflow = carrys[4];
endmodule