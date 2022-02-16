/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb 16 14:44:57 2022
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  NOR2X1 U20 ( .A(n14), .B(n15), .Y(o) );
  NAND2X1 U21 ( .A(n16), .B(n17), .Y(n15) );
  NOR2X1 U22 ( .A(n16), .B(n18), .Y(next_state[2]) );
  NAND2X1 U23 ( .A(i), .B(n19), .Y(n18) );
  INVX1 U24 ( .A(state[0]), .Y(n16) );
  MUX2X1 U25 ( .B(n20), .A(n21), .S(state[0]), .Y(next_state[1]) );
  NAND3X1 U26 ( .A(n17), .B(n14), .C(i), .Y(n21) );
  NOR2X1 U27 ( .A(state[0]), .B(n22), .Y(next_state[0]) );
  MUX2X1 U28 ( .B(n19), .A(n17), .S(i), .Y(n22) );
  INVX1 U29 ( .A(state[1]), .Y(n17) );
  INVX1 U30 ( .A(n20), .Y(n19) );
  NAND2X1 U31 ( .A(state[1]), .B(n14), .Y(n20) );
  INVX1 U32 ( .A(state[2]), .Y(n14) );
endmodule

