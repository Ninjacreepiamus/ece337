/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb 14 21:12:03 2022
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74;

  DFFSR \count_reg[0]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_reg[1]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_reg[2]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_reg[3]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U39 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n73) );
  OAI22X1 U40 ( .A(n46), .B(n43), .C(n47), .D(n45), .Y(n74) );
  INVX1 U41 ( .A(n48), .Y(n41) );
  AOI22X1 U42 ( .A(count_out[0]), .B(n49), .C(n50), .D(n51), .Y(n48) );
  OAI22X1 U43 ( .A(n52), .B(n43), .C(n53), .D(n45), .Y(n40) );
  INVX1 U44 ( .A(n51), .Y(n45) );
  INVX1 U45 ( .A(n49), .Y(n43) );
  OAI21X1 U46 ( .A(n54), .B(n55), .C(n56), .Y(n39) );
  NAND2X1 U47 ( .A(rollover_flag), .B(n49), .Y(n56) );
  NAND2X1 U48 ( .A(n57), .B(n58), .Y(n55) );
  XOR2X1 U49 ( .A(n47), .B(rollover_val[3]), .Y(n58) );
  XOR2X1 U50 ( .A(n59), .B(n60), .Y(n47) );
  NOR2X1 U51 ( .A(n61), .B(n46), .Y(n60) );
  INVX1 U52 ( .A(count_out[3]), .Y(n46) );
  NAND2X1 U53 ( .A(n62), .B(n63), .Y(n59) );
  XOR2X1 U54 ( .A(n53), .B(rollover_val[2]), .Y(n57) );
  XNOR2X1 U55 ( .A(n63), .B(n62), .Y(n53) );
  NOR2X1 U56 ( .A(n50), .B(n42), .Y(n62) );
  NOR2X1 U57 ( .A(n52), .B(n61), .Y(n63) );
  INVX1 U58 ( .A(count_out[2]), .Y(n52) );
  NAND3X1 U59 ( .A(n51), .B(n64), .C(n65), .Y(n54) );
  XOR2X1 U60 ( .A(rollover_val[1]), .B(n44), .Y(n65) );
  XOR2X1 U61 ( .A(n50), .B(n66), .Y(n44) );
  NOR2X1 U62 ( .A(n61), .B(n42), .Y(n66) );
  INVX1 U63 ( .A(n67), .Y(n61) );
  XNOR2X1 U64 ( .A(rollover_val[0]), .B(n50), .Y(n64) );
  NAND2X1 U65 ( .A(count_out[0]), .B(n67), .Y(n50) );
  NAND3X1 U66 ( .A(n68), .B(n69), .C(n70), .Y(n67) );
  NOR2X1 U67 ( .A(n71), .B(n72), .Y(n70) );
  XNOR2X1 U68 ( .A(rollover_val[1]), .B(n42), .Y(n72) );
  INVX1 U69 ( .A(count_out[1]), .Y(n42) );
  XOR2X1 U70 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n71) );
  XNOR2X1 U71 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n69) );
  XNOR2X1 U72 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n68) );
  NOR2X1 U73 ( .A(n49), .B(clear), .Y(n51) );
  NOR2X1 U74 ( .A(count_enable), .B(clear), .Y(n49) );
endmodule

