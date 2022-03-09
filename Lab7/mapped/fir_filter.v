/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Mar  9 01:13:43 2022
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   intermediate;

  DFFSR intermediate_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        intermediate) );
  DFFSR sync_out_reg ( .D(intermediate), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out) );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   intermediate;

  DFFSR intermediate_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        intermediate) );
  DFFSR sync_out_reg ( .D(intermediate), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   lc, n142, next_modwait, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138;
  wire   [4:0] state;
  wire   [4:0] next_state;
  assign src1[3] = 1'b0;
  assign clear = lc;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  DFFSR modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        modwait) );
  INVX2 U9 ( .A(n22), .Y(src2[2]) );
  INVX2 U10 ( .A(n55), .Y(n59) );
  AND2X2 U11 ( .A(n51), .B(n53), .Y(n36) );
  INVX4 U12 ( .A(n53), .Y(n79) );
  INVX2 U13 ( .A(n70), .Y(n7) );
  INVX1 U14 ( .A(n98), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n9) );
  BUFX2 U16 ( .A(n54), .Y(n10) );
  NAND2X1 U17 ( .A(n11), .B(n94), .Y(next_state[1]) );
  NOR2X1 U18 ( .A(n71), .B(n18), .Y(n11) );
  INVX1 U19 ( .A(n88), .Y(n94) );
  INVX2 U20 ( .A(overflow), .Y(n17) );
  AND2X2 U21 ( .A(n41), .B(n30), .Y(n12) );
  AND2X1 U22 ( .A(n41), .B(n30), .Y(n50) );
  INVX2 U23 ( .A(n82), .Y(n13) );
  AND2X2 U24 ( .A(n81), .B(n110), .Y(n14) );
  INVX1 U25 ( .A(n14), .Y(n108) );
  NAND2X1 U26 ( .A(n20), .B(n15), .Y(n111) );
  AND2X2 U27 ( .A(n100), .B(n54), .Y(n15) );
  AND2X2 U28 ( .A(n45), .B(n13), .Y(n16) );
  INVX2 U29 ( .A(overflow), .Y(n92) );
  AND2X2 U30 ( .A(n38), .B(n111), .Y(n112) );
  NAND2X1 U31 ( .A(n16), .B(n70), .Y(n18) );
  AND2X2 U32 ( .A(n101), .B(n26), .Y(n19) );
  AND2X2 U33 ( .A(n79), .B(n30), .Y(n20) );
  AND2X2 U34 ( .A(n119), .B(n118), .Y(n21) );
  AND2X2 U35 ( .A(n78), .B(n118), .Y(n22) );
  INVX2 U36 ( .A(n87), .Y(n23) );
  INVX4 U37 ( .A(n37), .Y(n45) );
  BUFX2 U38 ( .A(state[0]), .Y(n55) );
  NAND2X1 U39 ( .A(n20), .B(n24), .Y(n78) );
  AND2X2 U40 ( .A(n100), .B(n59), .Y(n24) );
  NAND2X1 U41 ( .A(n94), .B(n25), .Y(next_state[4]) );
  NOR2X1 U42 ( .A(n35), .B(n95), .Y(n25) );
  INVX4 U43 ( .A(n30), .Y(n80) );
  AND2X2 U44 ( .A(n49), .B(n80), .Y(n26) );
  INVX1 U45 ( .A(n26), .Y(n105) );
  INVX2 U46 ( .A(n106), .Y(n27) );
  INVX2 U47 ( .A(n43), .Y(n28) );
  INVX2 U48 ( .A(state[3]), .Y(n43) );
  INVX2 U49 ( .A(state[4]), .Y(n29) );
  INVX4 U50 ( .A(n29), .Y(n30) );
  INVX1 U51 ( .A(n33), .Y(n31) );
  INVX2 U52 ( .A(n19), .Y(n33) );
  BUFX2 U53 ( .A(src1[2]), .Y(n32) );
  AND2X1 U54 ( .A(n78), .B(n38), .Y(n91) );
  INVX1 U55 ( .A(n115), .Y(n122) );
  AND2X2 U56 ( .A(n119), .B(n78), .Y(n34) );
  INVX1 U57 ( .A(n34), .Y(n114) );
  NAND2X1 U58 ( .A(n113), .B(n22), .Y(n35) );
  AND2X2 U59 ( .A(n36), .B(n58), .Y(n37) );
  AND2X2 U60 ( .A(n28), .B(n23), .Y(n51) );
  BUFX2 U61 ( .A(n110), .Y(n38) );
  BUFX2 U62 ( .A(n80), .Y(n39) );
  AND2X2 U63 ( .A(n101), .B(n42), .Y(n40) );
  INVX1 U64 ( .A(n40), .Y(n116) );
  AND2X2 U65 ( .A(n87), .B(n43), .Y(n41) );
  INVX1 U66 ( .A(n41), .Y(n106) );
  AND2X2 U67 ( .A(n58), .B(n53), .Y(n42) );
  INVX1 U68 ( .A(n42), .Y(n70) );
  BUFX2 U69 ( .A(n84), .Y(n44) );
  NAND2X1 U70 ( .A(n117), .B(n21), .Y(src1[1]) );
  BUFX2 U71 ( .A(n28), .Y(n52) );
  AND2X2 U72 ( .A(n78), .B(n118), .Y(n46) );
  AND2X2 U73 ( .A(n109), .B(n111), .Y(n47) );
  AND2X2 U74 ( .A(n103), .B(n116), .Y(n48) );
  AND2X2 U75 ( .A(n54), .B(n53), .Y(n49) );
  BUFX4 U76 ( .A(state[1]), .Y(n53) );
  BUFX2 U77 ( .A(state[0]), .Y(n54) );
  BUFX4 U78 ( .A(n142), .Y(src1[2]) );
  INVX1 U79 ( .A(n118), .Y(n82) );
  AND2X2 U80 ( .A(n80), .B(n59), .Y(n58) );
  INVX1 U81 ( .A(n45), .Y(n74) );
  INVX2 U82 ( .A(state[2]), .Y(n87) );
  NAND3X1 U83 ( .A(n53), .B(n50), .C(n59), .Y(n118) );
  NAND2X1 U84 ( .A(state[2]), .B(n43), .Y(n84) );
  INVX2 U85 ( .A(n84), .Y(n100) );
  NAND3X1 U86 ( .A(n12), .B(n59), .C(n79), .Y(n119) );
  NAND3X1 U87 ( .A(n45), .B(n22), .C(n119), .Y(n60) );
  INVX2 U88 ( .A(n60), .Y(n134) );
  NOR2X1 U89 ( .A(n10), .B(n44), .Y(n61) );
  NAND3X1 U90 ( .A(n53), .B(n30), .C(n61), .Y(n96) );
  AOI21X1 U91 ( .A(dr), .B(n79), .C(n52), .Y(n62) );
  OAI21X1 U92 ( .A(n100), .B(n62), .C(n58), .Y(n63) );
  OAI21X1 U93 ( .A(dr), .B(n96), .C(n63), .Y(n64) );
  NAND2X1 U94 ( .A(n87), .B(n28), .Y(n132) );
  INVX2 U95 ( .A(n132), .Y(n101) );
  NAND3X1 U96 ( .A(n101), .B(n58), .C(n79), .Y(n137) );
  INVX2 U97 ( .A(dr), .Y(n67) );
  NAND3X1 U98 ( .A(n51), .B(n58), .C(n79), .Y(n103) );
  OAI21X1 U99 ( .A(n137), .B(n67), .C(n48), .Y(n72) );
  AOI21X1 U100 ( .A(lc), .B(n64), .C(n72), .Y(n65) );
  OAI21X1 U101 ( .A(overflow), .B(n134), .C(n65), .Y(next_state[0]) );
  NAND2X1 U102 ( .A(n45), .B(n118), .Y(src2[0]) );
  NAND3X1 U103 ( .A(n10), .B(n12), .C(n79), .Y(n109) );
  NAND3X1 U104 ( .A(n54), .B(n80), .C(n79), .Y(n131) );
  NAND2X1 U105 ( .A(n26), .B(n51), .Y(n81) );
  NAND2X1 U106 ( .A(n49), .B(n12), .Y(n110) );
  OAI21X1 U107 ( .A(n108), .B(n114), .C(overflow), .Y(n66) );
  NAND3X1 U108 ( .A(n109), .B(n131), .C(n66), .Y(n71) );
  OAI21X1 U109 ( .A(lc), .B(n96), .C(n137), .Y(n68) );
  NAND2X1 U110 ( .A(n68), .B(n67), .Y(n69) );
  OAI21X1 U111 ( .A(n92), .B(n111), .C(n69), .Y(n88) );
  INVX2 U112 ( .A(n131), .Y(n98) );
  NAND2X1 U113 ( .A(n98), .B(n51), .Y(n115) );
  NOR2X1 U114 ( .A(n122), .B(n72), .Y(n77) );
  NAND3X1 U115 ( .A(n101), .B(n10), .C(n39), .Y(n76) );
  NAND2X1 U116 ( .A(n58), .B(n27), .Y(n73) );
  OAI21X1 U117 ( .A(n53), .B(n73), .C(n96), .Y(n133) );
  AOI22X1 U118 ( .A(dr), .B(n133), .C(n74), .D(n17), .Y(n75) );
  NAND3X1 U119 ( .A(n77), .B(n76), .C(n75), .Y(next_state[3]) );
  NAND3X1 U120 ( .A(n103), .B(n45), .C(n115), .Y(n142) );
  AOI21X1 U121 ( .A(n39), .B(n79), .C(n7), .Y(n85) );
  NAND3X1 U122 ( .A(n81), .B(n119), .C(n109), .Y(n93) );
  OAI21X1 U123 ( .A(n93), .B(n82), .C(overflow), .Y(n83) );
  OAI21X1 U124 ( .A(n85), .B(n44), .C(n83), .Y(n86) );
  AOI21X1 U125 ( .A(n26), .B(n87), .C(n86), .Y(n90) );
  NOR2X1 U126 ( .A(n32), .B(n88), .Y(n89) );
  NAND3X1 U127 ( .A(n91), .B(n90), .C(n89), .Y(next_state[2]) );
  OAI21X1 U128 ( .A(n17), .B(n45), .C(n38), .Y(n95) );
  INVX2 U129 ( .A(n93), .Y(n113) );
  INVX2 U130 ( .A(n96), .Y(err) );
  NAND2X1 U131 ( .A(n9), .B(n27), .Y(n104) );
  INVX2 U132 ( .A(n104), .Y(n97) );
  AOI21X1 U133 ( .A(n9), .B(n100), .C(n97), .Y(n99) );
  NAND3X1 U134 ( .A(n48), .B(n137), .C(n99), .Y(dest[0]) );
  NAND2X1 U135 ( .A(n131), .B(n105), .Y(n120) );
  NAND2X1 U136 ( .A(n100), .B(n120), .Y(n128) );
  INVX2 U137 ( .A(n128), .Y(n121) );
  NOR2X1 U138 ( .A(n121), .B(n31), .Y(n102) );
  NAND3X1 U139 ( .A(n134), .B(n103), .C(n102), .Y(dest[1]) );
  NAND3X1 U140 ( .A(n137), .B(n115), .C(n128), .Y(dest[2]) );
  OAI21X1 U141 ( .A(n106), .B(n105), .C(n104), .Y(n107) );
  INVX2 U142 ( .A(n107), .Y(n125) );
  NAND2X1 U143 ( .A(n125), .B(n134), .Y(dest[3]) );
  NAND3X1 U144 ( .A(n14), .B(n46), .C(n47), .Y(src2[1]) );
  NAND3X1 U145 ( .A(n113), .B(n45), .C(n112), .Y(src2[3]) );
  NAND3X1 U146 ( .A(n33), .B(n115), .C(n34), .Y(src1[0]) );
  NOR2X1 U147 ( .A(n40), .B(n19), .Y(n117) );
  INVX2 U148 ( .A(n120), .Y(n124) );
  NOR2X1 U149 ( .A(n122), .B(n121), .Y(n123) );
  OAI21X1 U150 ( .A(n124), .B(n132), .C(n123), .Y(n127) );
  NAND3X1 U151 ( .A(n48), .B(n125), .C(n47), .Y(n126) );
  OR2X1 U152 ( .A(n127), .B(n126), .Y(op[0]) );
  INVX2 U153 ( .A(dest[3]), .Y(n129) );
  NAND3X1 U154 ( .A(n137), .B(n129), .C(n128), .Y(op[1]) );
  NOR2X1 U155 ( .A(src2[3]), .B(src2[2]), .Y(n130) );
  OAI21X1 U156 ( .A(n132), .B(n131), .C(n130), .Y(op[2]) );
  INVX2 U157 ( .A(n137), .Y(cnt_up) );
  OAI21X1 U158 ( .A(lc), .B(dr), .C(n133), .Y(n138) );
  NAND2X1 U159 ( .A(n134), .B(n14), .Y(n135) );
  NOR2X1 U160 ( .A(op[0]), .B(n135), .Y(n136) );
  NAND3X1 U161 ( .A(n138), .B(n137), .C(n136), .Y(next_modwait) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N4, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, n30, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, N29,
         N28, N27, N26, N25, N24, N23, N22, N21, N20, n1, n2, n3, n4, n5, n6,
         n7, n8, n20, n21, n22;

  DFFSR rollover_flag_reg ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_reg[9]  ( .D(n2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_reg[8]  ( .D(n3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_reg[7]  ( .D(n4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_reg[6]  ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_reg[5]  ( .D(n6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_reg[4]  ( .D(n7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_reg[3]  ( .D(n8), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_reg[2]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_reg[1]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_reg[0]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  AOI22X1 U24 ( .A(n1), .B(count_out[0]), .C(n32), .D(N6), .Y(n30) );
  AOI22X1 U25 ( .A(n1), .B(count_out[1]), .C(n32), .D(N7), .Y(n33) );
  AOI22X1 U26 ( .A(n1), .B(count_out[2]), .C(n32), .D(N8), .Y(n34) );
  AOI22X1 U27 ( .A(n1), .B(count_out[3]), .C(n32), .D(N9), .Y(n35) );
  AOI22X1 U28 ( .A(n1), .B(count_out[4]), .C(n32), .D(N10), .Y(n36) );
  AOI22X1 U29 ( .A(n1), .B(count_out[5]), .C(n32), .D(N11), .Y(n37) );
  AOI22X1 U30 ( .A(n1), .B(count_out[6]), .C(n32), .D(N12), .Y(n38) );
  AOI22X1 U31 ( .A(n1), .B(count_out[7]), .C(n32), .D(N13), .Y(n39) );
  AOI22X1 U32 ( .A(n1), .B(count_out[8]), .C(n32), .D(N14), .Y(n40) );
  AOI22X1 U33 ( .A(n1), .B(count_out[9]), .C(n32), .D(N15), .Y(n41) );
  OAI21X1 U34 ( .A(n42), .B(n43), .C(n44), .Y(n75) );
  NAND2X1 U35 ( .A(rollover_flag), .B(n1), .Y(n44) );
  NAND3X1 U36 ( .A(n45), .B(n46), .C(n47), .Y(n43) );
  NOR2X1 U37 ( .A(n48), .B(n49), .Y(n47) );
  XOR2X1 U38 ( .A(rollover_val[0]), .B(N6), .Y(n49) );
  XOR2X1 U39 ( .A(rollover_val[1]), .B(N7), .Y(n48) );
  XNOR2X1 U40 ( .A(N8), .B(rollover_val[2]), .Y(n46) );
  NOR2X1 U41 ( .A(n50), .B(n51), .Y(n45) );
  XOR2X1 U42 ( .A(rollover_val[5]), .B(N11), .Y(n51) );
  XOR2X1 U43 ( .A(rollover_val[4]), .B(N10), .Y(n50) );
  OR2X1 U44 ( .A(n52), .B(n53), .Y(n42) );
  NAND3X1 U45 ( .A(n54), .B(n55), .C(n56), .Y(n53) );
  XNOR2X1 U46 ( .A(N15), .B(rollover_val[9]), .Y(n56) );
  XNOR2X1 U47 ( .A(N12), .B(rollover_val[6]), .Y(n55) );
  XNOR2X1 U48 ( .A(N13), .B(rollover_val[7]), .Y(n54) );
  NAND3X1 U49 ( .A(n57), .B(n32), .C(n58), .Y(n52) );
  XNOR2X1 U50 ( .A(N14), .B(rollover_val[8]), .Y(n58) );
  NOR2X1 U51 ( .A(n1), .B(clear), .Y(n32) );
  XNOR2X1 U53 ( .A(N9), .B(rollover_val[3]), .Y(n57) );
  NAND3X1 U54 ( .A(n59), .B(n60), .C(n61), .Y(N4) );
  NOR2X1 U55 ( .A(n62), .B(n63), .Y(n61) );
  NAND2X1 U56 ( .A(n64), .B(n65), .Y(n63) );
  XNOR2X1 U57 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n65) );
  XNOR2X1 U58 ( .A(count_out[6]), .B(rollover_val[6]), .Y(n64) );
  NAND3X1 U59 ( .A(n66), .B(n67), .C(n68), .Y(n62) );
  XNOR2X1 U60 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n68) );
  XNOR2X1 U61 ( .A(count_out[7]), .B(rollover_val[7]), .Y(n67) );
  XNOR2X1 U62 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n66) );
  NOR2X1 U63 ( .A(n69), .B(n70), .Y(n60) );
  NAND2X1 U64 ( .A(n71), .B(n72), .Y(n70) );
  XNOR2X1 U65 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n72) );
  XNOR2X1 U66 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n71) );
  XOR2X1 U67 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n69) );
  NOR2X1 U68 ( .A(n73), .B(n74), .Y(n59) );
  XOR2X1 U69 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n74) );
  XOR2X1 U70 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n73) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_50_aco ( .A({N29, N28, N27, N26, 
        N25, N24, N23, N22, N21, N20}), .SUM({N15, N14, N13, N12, N11, N10, N9, 
        N8, N7, N6}) );
  NOR2X1 U14 ( .A(clear), .B(count_enable), .Y(n1) );
  AND2X1 U15 ( .A(count_out[0]), .B(N4), .Y(N20) );
  AND2X1 U16 ( .A(count_out[1]), .B(N4), .Y(N21) );
  AND2X1 U17 ( .A(count_out[2]), .B(N4), .Y(N22) );
  AND2X1 U18 ( .A(count_out[3]), .B(N4), .Y(N23) );
  AND2X1 U19 ( .A(count_out[4]), .B(N4), .Y(N24) );
  AND2X1 U20 ( .A(count_out[5]), .B(N4), .Y(N25) );
  AND2X1 U21 ( .A(count_out[6]), .B(N4), .Y(N26) );
  AND2X1 U22 ( .A(count_out[7]), .B(N4), .Y(N27) );
  AND2X1 U23 ( .A(count_out[8]), .B(N4), .Y(N28) );
  AND2X1 U52 ( .A(N4), .B(count_out[9]), .Y(N29) );
  INVX2 U71 ( .A(n41), .Y(n2) );
  INVX2 U72 ( .A(n40), .Y(n3) );
  INVX2 U73 ( .A(n39), .Y(n4) );
  INVX2 U74 ( .A(n38), .Y(n5) );
  INVX2 U75 ( .A(n37), .Y(n6) );
  INVX2 U76 ( .A(n36), .Y(n7) );
  INVX2 U77 ( .A(n35), .Y(n8) );
  INVX2 U78 ( .A(n34), .Y(n20) );
  INVX2 U79 ( .A(n33), .Y(n21) );
  INVX2 U80 ( .A(n30), .Y(n22) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 count_to_a_thousand ( .clk(clk), .n_rst(n_rst), 
        .clear(clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        one_k_samples) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n1), .B(n3), .C(n2), .Y(w_en) );
  NOR2X1 U7 ( .A(n2), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n1), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n2), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[1]), .Y(n1) );
  INVX2 U4 ( .A(op[0]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n16, n17,
         n18, n19, n20, n21, n23, n25, n26, n27, n28, n29, n31, n33, n34, n35,
         n36, n37, n39, n41, n42, n43, n44, n45, n47, n49, n50, n51, n52, n53,
         n55, n57, n58, n59, n60, n61, n63, n65, n66, n67, n68, n70, n71, n73,
         n75, n77, n79, n81, n83, n85, n86, n145, n146, n147, n148, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170;

  XOR2X1 U5 ( .A(n21), .B(n1), .Y(SUM[13]) );
  OAI21X1 U6 ( .A(n21), .B(n19), .C(n20), .Y(n18) );
  NAND2X1 U7 ( .A(n20), .B(n71), .Y(n1) );
  NOR2X1 U9 ( .A(A[13]), .B(B[13]), .Y(n19) );
  NAND2X1 U10 ( .A(A[13]), .B(B[13]), .Y(n20) );
  XNOR2X1 U11 ( .A(n26), .B(n2), .Y(SUM[12]) );
  AOI21X1 U12 ( .A(n169), .B(n26), .C(n23), .Y(n21) );
  NAND2X1 U15 ( .A(n25), .B(n169), .Y(n2) );
  NAND2X1 U18 ( .A(A[12]), .B(B[12]), .Y(n25) );
  XOR2X1 U19 ( .A(n29), .B(n3), .Y(SUM[11]) );
  OAI21X1 U20 ( .A(n29), .B(n27), .C(n28), .Y(n26) );
  NAND2X1 U21 ( .A(n28), .B(n73), .Y(n3) );
  NOR2X1 U23 ( .A(A[11]), .B(B[11]), .Y(n27) );
  NAND2X1 U24 ( .A(A[11]), .B(B[11]), .Y(n28) );
  XNOR2X1 U25 ( .A(n145), .B(n4), .Y(SUM[10]) );
  AOI21X1 U26 ( .A(n166), .B(n34), .C(n31), .Y(n29) );
  NAND2X1 U29 ( .A(n33), .B(n166), .Y(n4) );
  NAND2X1 U32 ( .A(A[10]), .B(B[10]), .Y(n33) );
  XOR2X1 U33 ( .A(n37), .B(n5), .Y(SUM[9]) );
  OAI21X1 U34 ( .A(n37), .B(n35), .C(n36), .Y(n34) );
  NAND2X1 U35 ( .A(n36), .B(n75), .Y(n5) );
  NOR2X1 U37 ( .A(A[9]), .B(B[9]), .Y(n35) );
  NAND2X1 U38 ( .A(A[9]), .B(B[9]), .Y(n36) );
  XNOR2X1 U39 ( .A(n42), .B(n6), .Y(SUM[8]) );
  AOI21X1 U40 ( .A(n165), .B(n42), .C(n39), .Y(n37) );
  NAND2X1 U43 ( .A(n41), .B(n165), .Y(n6) );
  NAND2X1 U46 ( .A(A[8]), .B(B[8]), .Y(n41) );
  XOR2X1 U47 ( .A(n45), .B(n7), .Y(SUM[7]) );
  OAI21X1 U48 ( .A(n45), .B(n43), .C(n44), .Y(n42) );
  NAND2X1 U49 ( .A(n44), .B(n77), .Y(n7) );
  NOR2X1 U51 ( .A(A[7]), .B(B[7]), .Y(n43) );
  NAND2X1 U52 ( .A(A[7]), .B(B[7]), .Y(n44) );
  XNOR2X1 U53 ( .A(n147), .B(n8), .Y(SUM[6]) );
  AOI21X1 U54 ( .A(n167), .B(n50), .C(n47), .Y(n45) );
  NAND2X1 U57 ( .A(n49), .B(n167), .Y(n8) );
  NAND2X1 U60 ( .A(A[6]), .B(B[6]), .Y(n49) );
  XOR2X1 U61 ( .A(n53), .B(n9), .Y(SUM[5]) );
  OAI21X1 U62 ( .A(n53), .B(n51), .C(n52), .Y(n50) );
  NAND2X1 U63 ( .A(n52), .B(n79), .Y(n9) );
  NOR2X1 U65 ( .A(A[5]), .B(B[5]), .Y(n51) );
  NAND2X1 U66 ( .A(A[5]), .B(B[5]), .Y(n52) );
  XNOR2X1 U67 ( .A(n146), .B(n10), .Y(SUM[4]) );
  AOI21X1 U68 ( .A(n168), .B(n58), .C(n55), .Y(n53) );
  NAND2X1 U71 ( .A(n57), .B(n168), .Y(n10) );
  NAND2X1 U74 ( .A(A[4]), .B(B[4]), .Y(n57) );
  XOR2X1 U75 ( .A(n61), .B(n11), .Y(SUM[3]) );
  OAI21X1 U76 ( .A(n61), .B(n59), .C(n60), .Y(n58) );
  NAND2X1 U77 ( .A(n60), .B(n81), .Y(n11) );
  NOR2X1 U79 ( .A(A[3]), .B(B[3]), .Y(n59) );
  NAND2X1 U80 ( .A(A[3]), .B(B[3]), .Y(n60) );
  XNOR2X1 U81 ( .A(n66), .B(n12), .Y(SUM[2]) );
  AOI21X1 U82 ( .A(n164), .B(n66), .C(n63), .Y(n61) );
  NAND2X1 U85 ( .A(n65), .B(n164), .Y(n12) );
  NAND2X1 U88 ( .A(A[2]), .B(B[2]), .Y(n65) );
  XOR2X1 U89 ( .A(n13), .B(n163), .Y(SUM[1]) );
  OAI21X1 U90 ( .A(n67), .B(n70), .C(n68), .Y(n66) );
  NAND2X1 U91 ( .A(n68), .B(n83), .Y(n13) );
  NOR2X1 U93 ( .A(A[1]), .B(B[1]), .Y(n67) );
  NAND2X1 U94 ( .A(A[1]), .B(B[1]), .Y(n68) );
  NAND2X1 U99 ( .A(A[0]), .B(B[0]), .Y(n70) );
  BUFX2 U105 ( .A(n34), .Y(n145) );
  BUFX2 U106 ( .A(n58), .Y(n146) );
  BUFX2 U107 ( .A(n50), .Y(n147) );
  BUFX2 U108 ( .A(n18), .Y(n148) );
  OR2X1 U109 ( .A(A[10]), .B(B[10]), .Y(n166) );
  OR2X2 U110 ( .A(A[0]), .B(B[0]), .Y(n170) );
  INVX1 U111 ( .A(n67), .Y(n83) );
  AND2X2 U112 ( .A(n163), .B(n170), .Y(SUM[0]) );
  OR2X1 U113 ( .A(A[8]), .B(B[8]), .Y(n165) );
  OR2X1 U114 ( .A(A[4]), .B(B[4]), .Y(n168) );
  OR2X1 U115 ( .A(A[12]), .B(B[12]), .Y(n169) );
  XOR2X1 U116 ( .A(B[14]), .B(A[14]), .Y(n150) );
  XOR2X1 U117 ( .A(n148), .B(n150), .Y(SUM[14]) );
  NAND2X1 U118 ( .A(n18), .B(B[14]), .Y(n151) );
  NAND2X1 U119 ( .A(n18), .B(A[14]), .Y(n152) );
  NAND2X1 U120 ( .A(B[14]), .B(A[14]), .Y(n153) );
  NAND3X1 U121 ( .A(n152), .B(n151), .C(n153), .Y(n17) );
  NAND3X1 U122 ( .A(n156), .B(n157), .C(n158), .Y(n154) );
  XOR2X1 U123 ( .A(A[15]), .B(B[15]), .Y(n155) );
  XOR2X1 U124 ( .A(n155), .B(n17), .Y(SUM[15]) );
  NAND2X1 U125 ( .A(A[15]), .B(B[15]), .Y(n156) );
  NAND2X1 U126 ( .A(A[15]), .B(n17), .Y(n157) );
  NAND2X1 U127 ( .A(B[15]), .B(n17), .Y(n158) );
  NAND3X1 U128 ( .A(n156), .B(n158), .C(n157), .Y(n16) );
  XOR2X1 U129 ( .A(n86), .B(n85), .Y(n159) );
  XOR2X1 U130 ( .A(n154), .B(n159), .Y(SUM[16]) );
  NAND2X1 U131 ( .A(n86), .B(n85), .Y(n160) );
  NAND2X1 U132 ( .A(n86), .B(n16), .Y(n161) );
  NAND2X1 U133 ( .A(n85), .B(n16), .Y(n162) );
  NAND3X1 U134 ( .A(n160), .B(n161), .C(n162), .Y(n15) );
  NAND2X1 U135 ( .A(A[0]), .B(B[0]), .Y(n163) );
  OR2X2 U136 ( .A(A[6]), .B(B[6]), .Y(n167) );
  OR2X2 U137 ( .A(A[2]), .B(B[2]), .Y(n164) );
  INVX2 U138 ( .A(A[17]), .Y(n86) );
  INVX2 U139 ( .A(B[17]), .Y(n85) );
  INVX2 U140 ( .A(n59), .Y(n81) );
  INVX2 U141 ( .A(n51), .Y(n79) );
  INVX2 U142 ( .A(n43), .Y(n77) );
  INVX2 U143 ( .A(n35), .Y(n75) );
  INVX2 U144 ( .A(n27), .Y(n73) );
  INVX2 U145 ( .A(n19), .Y(n71) );
  INVX2 U146 ( .A(n65), .Y(n63) );
  INVX2 U147 ( .A(n57), .Y(n55) );
  INVX2 U148 ( .A(n49), .Y(n47) );
  INVX2 U149 ( .A(n41), .Y(n39) );
  INVX2 U150 ( .A(n33), .Y(n31) );
  INVX2 U151 ( .A(n25), .Y(n23) );
  INVX2 U152 ( .A(n15), .Y(SUM[17]) );
endmodule


module alu_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n31, n32, n33,
         n34, n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51,
         n52, n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n75, n76, n77, n79, n81, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n103, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180;

  XOR2X1 U4 ( .A(n20), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n179), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n179), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n164), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n76), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n76), .Y(n4) );
  NOR2X1 U30 ( .A(A[11]), .B(n91), .Y(n31) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n36), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n162), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n178), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n178), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n165), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n177), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n177), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n52), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n163), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n176), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n176), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n166), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n72), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n180), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U102 ( .A(A[0]), .B(n180), .Y(n72) );
  INVX1 U123 ( .A(B[10]), .Y(n92) );
  INVX2 U124 ( .A(B[0]), .Y(n180) );
  INVX1 U125 ( .A(n63), .Y(n84) );
  INVX1 U126 ( .A(B[12]), .Y(n90) );
  INVX1 U127 ( .A(B[13]), .Y(n89) );
  INVX1 U128 ( .A(B[8]), .Y(n94) );
  INVX1 U129 ( .A(B[9]), .Y(n93) );
  INVX1 U130 ( .A(B[7]), .Y(n95) );
  BUFX2 U131 ( .A(n41), .Y(n162) );
  BUFX2 U132 ( .A(n57), .Y(n163) );
  INVX1 U133 ( .A(B[15]), .Y(n87) );
  BUFX2 U134 ( .A(n28), .Y(n164) );
  BUFX2 U135 ( .A(n44), .Y(n165) );
  BUFX2 U136 ( .A(n60), .Y(n166) );
  INVX1 U137 ( .A(n69), .Y(n68) );
  XOR2X1 U138 ( .A(n167), .B(n16), .Y(DIFF[16]) );
  XOR2X1 U139 ( .A(n103), .B(B[16]), .Y(n167) );
  INVX1 U140 ( .A(B[14]), .Y(n88) );
  XOR2X1 U141 ( .A(A[15]), .B(n87), .Y(n168) );
  XOR2X1 U142 ( .A(n168), .B(n175), .Y(DIFF[15]) );
  NAND2X1 U143 ( .A(A[15]), .B(n87), .Y(n169) );
  NAND2X1 U144 ( .A(A[15]), .B(n17), .Y(n170) );
  NAND2X1 U145 ( .A(n87), .B(n17), .Y(n171) );
  NAND3X1 U146 ( .A(n169), .B(n171), .C(n170), .Y(n16) );
  NAND2X1 U147 ( .A(n103), .B(B[16]), .Y(n172) );
  NAND2X1 U148 ( .A(n103), .B(n16), .Y(n173) );
  NAND2X1 U149 ( .A(B[16]), .B(n16), .Y(n174) );
  NAND3X1 U150 ( .A(n172), .B(n173), .C(n174), .Y(n15) );
  BUFX2 U151 ( .A(n17), .Y(n175) );
  OR2X2 U152 ( .A(A[5]), .B(n97), .Y(n176) );
  OR2X2 U153 ( .A(A[7]), .B(n95), .Y(n177) );
  OR2X2 U154 ( .A(A[9]), .B(n93), .Y(n178) );
  OR2X2 U155 ( .A(A[13]), .B(n89), .Y(n179) );
  INVX1 U156 ( .A(B[4]), .Y(n98) );
  INVX1 U157 ( .A(B[6]), .Y(n96) );
  INVX1 U158 ( .A(B[1]), .Y(n101) );
  INVX2 U159 ( .A(B[3]), .Y(n99) );
  INVX2 U160 ( .A(B[5]), .Y(n97) );
  INVX2 U161 ( .A(B[11]), .Y(n91) );
  INVX2 U162 ( .A(n70), .Y(n86) );
  INVX2 U163 ( .A(n66), .Y(n85) );
  INVX2 U164 ( .A(n58), .Y(n83) );
  INVX2 U165 ( .A(n50), .Y(n81) );
  INVX2 U166 ( .A(n42), .Y(n79) );
  INVX2 U167 ( .A(n34), .Y(n77) );
  INVX2 U168 ( .A(n26), .Y(n75) );
  INVX2 U169 ( .A(n18), .Y(n73) );
  INVX2 U170 ( .A(n56), .Y(n54) );
  INVX2 U171 ( .A(n48), .Y(n46) );
  INVX2 U172 ( .A(n40), .Y(n38) );
  INVX2 U173 ( .A(n32), .Y(n30) );
  INVX2 U174 ( .A(n31), .Y(n76) );
  INVX2 U175 ( .A(n24), .Y(n22) );
  INVX2 U176 ( .A(A[17]), .Y(n103) );
  INVX2 U177 ( .A(B[2]), .Y(n100) );
  INVX2 U178 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW_mult_uns_3 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n13, n19, n22, n24, n25, n31, n34, n36, n37, n40, n46,
         n49, n51, n52, n53, n58, n59, n60, n61, n63, n64, n65, n66, n67, n68,
         n69, n70, n72, n73, n74, n75, n77, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n109, n111, n112,
         n113, n114, n115, n116, n120, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n133, n134, n135, n136, n137, n140, n142, n144,
         n145, n146, n147, n148, n149, n151, n154, n155, n156, n159, n160,
         n161, n162, n163, n164, n165, n166, n169, n170, n171, n172, n173,
         n174, n177, n178, n179, n181, n182, n183, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n197, n198, n199, n200, n201,
         n202, n205, n206, n207, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n248, n249,
         n250, n251, n256, n257, n258, n259, n264, n265, n266, n267, n275,
         n279, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n545, n548, n551,
         n554, n557, n560, n563, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n731,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n893, n894, n895,
         n896, n897, n898, n899, n900, n917, n918, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268,
         n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278,
         n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288,
         n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298,
         n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328,
         n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358,
         n1359, n1360, n1361, n1362, n1363, n1364, n1365;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n74), .B(n1043), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1231), .B(n53), .Y(n74) );
  OAI21X1 U62 ( .A(n52), .B(n1231), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1007), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n53), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1258), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1317), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n53), .Y(n96) );
  OAI21X1 U90 ( .A(n52), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1253), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1233), .B(n1029), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1233), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1261), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n53), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1136), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1029), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1029), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1029), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1317), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n53), .Y(n124) );
  OAI21X1 U124 ( .A(n52), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n1253), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1317), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1253), .B(n53), .Y(n135) );
  OAI21X1 U138 ( .A(n1136), .B(n1253), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1030), .B(n1262), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1030), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1030), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1007), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n53), .Y(n146) );
  OAI21X1 U152 ( .A(n1258), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1262), .Y(n61) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  AOI21X1 U162 ( .A(n155), .B(n1006), .C(n156), .Y(n154) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n166), .B(n161), .Y(n159) );
  OAI21X1 U168 ( .A(n1044), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n349), .B(n340), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  AOI21X1 U174 ( .A(n164), .B(n1007), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1222), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1222), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n361), .B(n350), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1129), .B(n1006), .C(n1135), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1261), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1006), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1062), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n388), .B(n401), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1224), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1224), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n1046), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n430), .B(n443), .Y(n210) );
  NAND2X1 U242 ( .A(n430), .B(n443), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n216), .B(n219), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n1163), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1236), .B(n1031), .Y(n223) );
  AOI21X1 U258 ( .A(n1031), .B(n1235), .C(n1232), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1234), .B(n248), .C(n1237), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1241), .C(n1244), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1242), .C(n1245), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1246), .B(n1240), .C(n1243), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n587), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n603), .YC(n311), .YS(n312) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U326 ( .A(n605), .B(n589), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U334 ( .A(n355), .B(n346), .C(n353), .YC(n341), .YS(n342) );
  FAX1 U335 ( .A(n639), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n591), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n623), .YC(n347), .YS(n348) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n1111), .B(n592), .C(n656), .YC(n357), .YS(n358) );
  FAX1 U345 ( .A(n368), .B(n379), .C(n377), .YC(n363), .YS(n364) );
  FAX1 U346 ( .A(n381), .B(n383), .C(n370), .YC(n365), .YS(n366) );
  FAX1 U348 ( .A(n609), .B(n593), .C(n673), .YC(n369), .YS(n370) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U355 ( .A(n594), .B(n674), .C(n386), .YC(n383), .YS(n384) );
  FAX1 U358 ( .A(n407), .B(n394), .C(n405), .YC(n389), .YS(n390) );
  FAX1 U361 ( .A(n709), .B(n643), .C(n675), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n611), .B(n595), .C(n691), .YC(n397), .YS(n398) );
  FAX1 U363 ( .A(n579), .B(n627), .C(n659), .YC(n399), .YS(n400) );
  FAX1 U366 ( .A(n423), .B(n412), .C(n410), .YC(n405), .YS(n406) );
  FAX1 U373 ( .A(n439), .B(n1254), .C(n426), .YC(n419), .YS(n420) );
  FAX1 U375 ( .A(n677), .B(n645), .C(n661), .YC(n423), .YS(n424) );
  FAX1 U376 ( .A(n629), .B(n613), .C(n597), .YC(n425), .YS(n426) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U382 ( .A(n662), .B(n630), .C(n646), .YC(n437), .YS(n438) );
  FAX1 U384 ( .A(n582), .B(n710), .C(n694), .YC(n441), .YS(n442) );
  FAX1 U389 ( .A(n565), .B(n631), .C(n679), .YC(n451), .YS(n452) );
  HAX1 U391 ( .A(n711), .B(n615), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U394 ( .A(n1256), .B(n1010), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n680), .B(n664), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U397 ( .A(n712), .B(n616), .C(n600), .YC(n467), .YS(n468) );
  FAX1 U398 ( .A(n474), .B(n472), .C(n483), .YC(n469), .YS(n470) );
  FAX1 U400 ( .A(n489), .B(n480), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U407 ( .A(n698), .B(n650), .C(n666), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n634), .B(n714), .C(n618), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n667), .B(n635), .C(n683), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n700), .B(n668), .C(n684), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n716), .B(n652), .C(n636), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n702), .B(n686), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n718), .B(n670), .C(n654), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n703), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n719), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n720), .B(n688), .C(n672), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n721), .B(n705), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n722), .B(n706), .C(n690), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1346), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1344), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n1342), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1340), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n1338), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n731), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1334), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1332), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1330), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n1326), .Y(n578) );
  NOR2X1 U445 ( .A(n918), .B(n1042), .Y(n385) );
  NOR2X1 U446 ( .A(n918), .B(n1322), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n1320), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1318), .Y(n581) );
  OAI22X1 U466 ( .A(n918), .B(n1315), .C(n1312), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1313), .C(n741), .D(n1314), .Y(n584) );
  OAI22X1 U470 ( .A(n1313), .B(n741), .C(n742), .D(n1315), .Y(n585) );
  OAI22X1 U471 ( .A(n1313), .B(n742), .C(n743), .D(n1314), .Y(n586) );
  OAI22X1 U472 ( .A(n1313), .B(n743), .C(n744), .D(n1315), .Y(n587) );
  OAI22X1 U473 ( .A(n1313), .B(n744), .C(n745), .D(n1314), .Y(n588) );
  OAI22X1 U474 ( .A(n1313), .B(n745), .C(n746), .D(n1315), .Y(n589) );
  OAI22X1 U475 ( .A(n1313), .B(n746), .C(n747), .D(n1314), .Y(n590) );
  OAI22X1 U476 ( .A(n1313), .B(n747), .C(n748), .D(n1314), .Y(n591) );
  OAI22X1 U477 ( .A(n1312), .B(n748), .C(n749), .D(n1315), .Y(n592) );
  OAI22X1 U478 ( .A(n1312), .B(n749), .C(n750), .D(n1314), .Y(n593) );
  OAI22X1 U479 ( .A(n1312), .B(n750), .C(n751), .D(n1315), .Y(n594) );
  OAI22X1 U480 ( .A(n1313), .B(n751), .C(n752), .D(n1314), .Y(n595) );
  OAI22X1 U481 ( .A(n1313), .B(n752), .C(n753), .D(n1315), .Y(n596) );
  OAI22X1 U482 ( .A(n1313), .B(n753), .C(n754), .D(n1314), .Y(n597) );
  OAI22X1 U483 ( .A(n1313), .B(n754), .C(n755), .D(n1315), .Y(n598) );
  AND2X1 U485 ( .A(n1351), .B(n1311), .Y(n600) );
  XNOR2X1 U487 ( .A(n1347), .B(n1350), .Y(n741) );
  XNOR2X1 U488 ( .A(n1345), .B(n1350), .Y(n742) );
  XNOR2X1 U489 ( .A(n1343), .B(n1350), .Y(n743) );
  XNOR2X1 U490 ( .A(n1341), .B(n1350), .Y(n744) );
  XNOR2X1 U491 ( .A(n1339), .B(n1350), .Y(n745) );
  XNOR2X1 U492 ( .A(n1337), .B(n1350), .Y(n746) );
  XNOR2X1 U493 ( .A(n1335), .B(n1350), .Y(n747) );
  XNOR2X1 U494 ( .A(n1333), .B(n1350), .Y(n748) );
  XNOR2X1 U495 ( .A(n1331), .B(n1350), .Y(n749) );
  XNOR2X1 U496 ( .A(n1329), .B(n1350), .Y(n750) );
  XNOR2X1 U497 ( .A(n1327), .B(n1350), .Y(n751) );
  XNOR2X1 U498 ( .A(n1325), .B(n1350), .Y(n752) );
  XNOR2X1 U499 ( .A(n1323), .B(n1350), .Y(n753) );
  XNOR2X1 U500 ( .A(n1321), .B(n1350), .Y(n754) );
  XNOR2X1 U501 ( .A(n1319), .B(n1350), .Y(n755) );
  XNOR2X1 U502 ( .A(n49), .B(n1350), .Y(n756) );
  OAI22X1 U505 ( .A(n1365), .B(n1310), .C(n1307), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1365), .B(n1307), .C(n758), .D(n1309), .Y(n602) );
  OAI22X1 U509 ( .A(n1308), .B(n758), .C(n759), .D(n1310), .Y(n603) );
  OAI22X1 U510 ( .A(n1308), .B(n759), .C(n760), .D(n1000), .Y(n604) );
  OAI22X1 U511 ( .A(n1308), .B(n760), .C(n761), .D(n1000), .Y(n605) );
  OAI22X1 U512 ( .A(n1307), .B(n761), .C(n762), .D(n1309), .Y(n606) );
  OAI22X1 U513 ( .A(n1307), .B(n762), .C(n763), .D(n1000), .Y(n607) );
  OAI22X1 U514 ( .A(n1308), .B(n763), .C(n764), .D(n1309), .Y(n608) );
  OAI22X1 U515 ( .A(n1307), .B(n764), .C(n765), .D(n1309), .Y(n609) );
  OAI22X1 U516 ( .A(n1308), .B(n765), .C(n766), .D(n1310), .Y(n610) );
  OAI22X1 U517 ( .A(n1308), .B(n766), .C(n767), .D(n1309), .Y(n611) );
  OAI22X1 U518 ( .A(n1307), .B(n767), .C(n768), .D(n1310), .Y(n612) );
  OAI22X1 U519 ( .A(n1308), .B(n768), .C(n769), .D(n1309), .Y(n613) );
  OAI22X1 U520 ( .A(n1307), .B(n769), .C(n770), .D(n1310), .Y(n614) );
  OAI22X1 U521 ( .A(n1307), .B(n770), .C(n771), .D(n1309), .Y(n615) );
  OAI22X1 U522 ( .A(n1308), .B(n771), .C(n772), .D(n1310), .Y(n616) );
  OAI22X1 U523 ( .A(n1308), .B(n772), .C(n1309), .D(n773), .Y(n617) );
  XNOR2X1 U527 ( .A(n1345), .B(n1223), .Y(n759) );
  XNOR2X1 U528 ( .A(n1343), .B(n1223), .Y(n760) );
  XNOR2X1 U529 ( .A(n1341), .B(n1223), .Y(n761) );
  XNOR2X1 U530 ( .A(n1339), .B(n1223), .Y(n762) );
  XNOR2X1 U531 ( .A(n1337), .B(n1223), .Y(n763) );
  XNOR2X1 U532 ( .A(n1335), .B(n1364), .Y(n764) );
  XNOR2X1 U533 ( .A(n1333), .B(n1364), .Y(n765) );
  XNOR2X1 U534 ( .A(n1331), .B(n1364), .Y(n766) );
  XNOR2X1 U535 ( .A(n1329), .B(n1364), .Y(n767) );
  XNOR2X1 U536 ( .A(n1327), .B(n1364), .Y(n768) );
  XNOR2X1 U537 ( .A(n1325), .B(n1364), .Y(n769) );
  XNOR2X1 U538 ( .A(n1323), .B(n1364), .Y(n770) );
  XNOR2X1 U539 ( .A(n1321), .B(n1223), .Y(n771) );
  XNOR2X1 U540 ( .A(n1319), .B(n1364), .Y(n772) );
  XNOR2X1 U541 ( .A(n1351), .B(n1364), .Y(n773) );
  OR2X1 U542 ( .A(n49), .B(n1365), .Y(n774) );
  OAI22X1 U544 ( .A(n1161), .B(n1128), .C(n1305), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1161), .B(n1305), .C(n775), .D(n1128), .Y(n620) );
  OAI22X1 U548 ( .A(n1305), .B(n775), .C(n776), .D(n1155), .Y(n621) );
  OAI22X1 U549 ( .A(n1305), .B(n776), .C(n777), .D(n1155), .Y(n622) );
  OAI22X1 U550 ( .A(n1305), .B(n777), .C(n778), .D(n1155), .Y(n623) );
  OAI22X1 U551 ( .A(n1305), .B(n778), .C(n779), .D(n1155), .Y(n624) );
  OAI22X1 U552 ( .A(n1305), .B(n779), .C(n780), .D(n1155), .Y(n625) );
  OAI22X1 U553 ( .A(n1305), .B(n780), .C(n781), .D(n1155), .Y(n626) );
  OAI22X1 U554 ( .A(n1305), .B(n781), .C(n782), .D(n1155), .Y(n627) );
  OAI22X1 U555 ( .A(n1305), .B(n782), .C(n783), .D(n1225), .Y(n628) );
  OAI22X1 U556 ( .A(n1305), .B(n783), .C(n1225), .D(n784), .Y(n629) );
  OAI22X1 U557 ( .A(n784), .B(n1305), .C(n785), .D(n1155), .Y(n630) );
  OAI22X1 U558 ( .A(n1305), .B(n785), .C(n786), .D(n1225), .Y(n631) );
  OAI22X1 U559 ( .A(n1305), .B(n786), .C(n787), .D(n1155), .Y(n632) );
  OAI22X1 U560 ( .A(n1305), .B(n787), .C(n788), .D(n1155), .Y(n633) );
  OAI22X1 U561 ( .A(n1305), .B(n788), .C(n789), .D(n1155), .Y(n634) );
  OAI22X1 U562 ( .A(n1305), .B(n789), .C(n1155), .D(n790), .Y(n635) );
  XNOR2X1 U565 ( .A(n1347), .B(n1134), .Y(n775) );
  XNOR2X1 U566 ( .A(n1345), .B(n1134), .Y(n776) );
  XNOR2X1 U567 ( .A(n1343), .B(n1134), .Y(n777) );
  XNOR2X1 U568 ( .A(n1341), .B(n1134), .Y(n778) );
  XNOR2X1 U569 ( .A(n1339), .B(n1362), .Y(n779) );
  XNOR2X1 U570 ( .A(n1337), .B(n1362), .Y(n780) );
  XNOR2X1 U571 ( .A(n1335), .B(n1362), .Y(n781) );
  XNOR2X1 U572 ( .A(n1333), .B(n1362), .Y(n782) );
  XNOR2X1 U573 ( .A(n1331), .B(n1362), .Y(n783) );
  XNOR2X1 U574 ( .A(n1329), .B(n1362), .Y(n784) );
  XNOR2X1 U577 ( .A(n1323), .B(n1362), .Y(n787) );
  XNOR2X1 U578 ( .A(n1321), .B(n1362), .Y(n788) );
  XNOR2X1 U579 ( .A(n1319), .B(n1362), .Y(n789) );
  XNOR2X1 U580 ( .A(n49), .B(n1134), .Y(n790) );
  OR2X1 U581 ( .A(n1351), .B(n1161), .Y(n791) );
  OAI22X1 U583 ( .A(n1361), .B(n1303), .C(n1302), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1361), .B(n1302), .C(n792), .D(n1212), .Y(n638) );
  OAI22X1 U587 ( .A(n1302), .B(n792), .C(n793), .D(n1303), .Y(n639) );
  OAI22X1 U588 ( .A(n1302), .B(n793), .C(n794), .D(n1303), .Y(n640) );
  OAI22X1 U589 ( .A(n1302), .B(n794), .C(n795), .D(n1212), .Y(n641) );
  OAI22X1 U590 ( .A(n795), .B(n1302), .C(n796), .D(n1212), .Y(n642) );
  OAI22X1 U591 ( .A(n1302), .B(n796), .C(n797), .D(n1212), .Y(n643) );
  OAI22X1 U592 ( .A(n1302), .B(n797), .C(n798), .D(n1212), .Y(n644) );
  OAI22X1 U593 ( .A(n1302), .B(n798), .C(n799), .D(n1303), .Y(n645) );
  OAI22X1 U594 ( .A(n799), .B(n1302), .C(n800), .D(n1212), .Y(n646) );
  OAI22X1 U595 ( .A(n800), .B(n1302), .C(n801), .D(n1303), .Y(n647) );
  OAI22X1 U596 ( .A(n1302), .B(n801), .C(n802), .D(n1303), .Y(n648) );
  OAI22X1 U597 ( .A(n1302), .B(n802), .C(n803), .D(n1303), .Y(n649) );
  OAI22X1 U598 ( .A(n1302), .B(n803), .C(n804), .D(n1303), .Y(n650) );
  OAI22X1 U599 ( .A(n1302), .B(n804), .C(n805), .D(n1212), .Y(n651) );
  OAI22X1 U600 ( .A(n1302), .B(n805), .C(n806), .D(n1303), .Y(n652) );
  OAI22X1 U601 ( .A(n1302), .B(n806), .C(n1212), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1351), .B(n1250), .Y(n654) );
  XNOR2X1 U604 ( .A(n1347), .B(n1360), .Y(n792) );
  XNOR2X1 U605 ( .A(n1345), .B(n1360), .Y(n793) );
  XNOR2X1 U606 ( .A(n1343), .B(n1360), .Y(n794) );
  XNOR2X1 U607 ( .A(n1341), .B(n1360), .Y(n795) );
  XNOR2X1 U608 ( .A(n1339), .B(n1360), .Y(n796) );
  XNOR2X1 U609 ( .A(n1337), .B(n1360), .Y(n797) );
  XNOR2X1 U610 ( .A(n1335), .B(n1360), .Y(n798) );
  XNOR2X1 U611 ( .A(n1333), .B(n1360), .Y(n799) );
  XNOR2X1 U612 ( .A(n1331), .B(n1360), .Y(n800) );
  XNOR2X1 U613 ( .A(n1329), .B(n1360), .Y(n801) );
  XNOR2X1 U614 ( .A(n1327), .B(n1360), .Y(n802) );
  XNOR2X1 U615 ( .A(n1325), .B(n1360), .Y(n803) );
  XNOR2X1 U616 ( .A(n1323), .B(n1360), .Y(n804) );
  XNOR2X1 U617 ( .A(n1321), .B(n1360), .Y(n805) );
  XNOR2X1 U618 ( .A(n1319), .B(n1360), .Y(n806) );
  XNOR2X1 U619 ( .A(n1351), .B(n1360), .Y(n807) );
  OR2X1 U620 ( .A(n1351), .B(n1361), .Y(n808) );
  OAI22X1 U622 ( .A(n1213), .B(n1301), .C(n1298), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1278), .B(n1298), .C(n809), .D(n1301), .Y(n656) );
  OAI22X1 U626 ( .A(n1298), .B(n809), .C(n810), .D(n1301), .Y(n657) );
  OAI22X1 U627 ( .A(n1298), .B(n810), .C(n811), .D(n1301), .Y(n658) );
  OAI22X1 U628 ( .A(n1299), .B(n811), .C(n812), .D(n1301), .Y(n659) );
  OAI22X1 U629 ( .A(n1298), .B(n812), .C(n813), .D(n1301), .Y(n660) );
  OAI22X1 U630 ( .A(n1298), .B(n813), .C(n814), .D(n1301), .Y(n661) );
  OAI22X1 U631 ( .A(n1299), .B(n814), .C(n815), .D(n1301), .Y(n662) );
  OAI22X1 U632 ( .A(n1298), .B(n815), .C(n816), .D(n1301), .Y(n663) );
  OAI22X1 U633 ( .A(n1298), .B(n816), .C(n817), .D(n1301), .Y(n664) );
  OAI22X1 U634 ( .A(n1298), .B(n817), .C(n818), .D(n1301), .Y(n665) );
  OAI22X1 U635 ( .A(n1298), .B(n818), .C(n819), .D(n1301), .Y(n666) );
  OAI22X1 U636 ( .A(n1298), .B(n819), .C(n820), .D(n1301), .Y(n667) );
  OAI22X1 U637 ( .A(n1298), .B(n820), .C(n821), .D(n1301), .Y(n668) );
  OAI22X1 U638 ( .A(n1298), .B(n821), .C(n822), .D(n1301), .Y(n669) );
  OAI22X1 U639 ( .A(n1298), .B(n822), .C(n823), .D(n1301), .Y(n670) );
  OAI22X1 U640 ( .A(n1298), .B(n823), .C(n1301), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1351), .B(n1297), .Y(n672) );
  XNOR2X1 U643 ( .A(n877), .B(n1050), .Y(n809) );
  XNOR2X1 U644 ( .A(n1345), .B(n1050), .Y(n810) );
  XNOR2X1 U645 ( .A(n1343), .B(n1050), .Y(n811) );
  XNOR2X1 U646 ( .A(n1341), .B(n1071), .Y(n812) );
  XNOR2X1 U647 ( .A(n1339), .B(n1071), .Y(n813) );
  XNOR2X1 U648 ( .A(n1337), .B(n1071), .Y(n814) );
  XNOR2X1 U650 ( .A(n1333), .B(n1071), .Y(n816) );
  XNOR2X1 U651 ( .A(n1331), .B(n1071), .Y(n817) );
  XNOR2X1 U652 ( .A(n1329), .B(n1071), .Y(n818) );
  XNOR2X1 U653 ( .A(n1327), .B(n1071), .Y(n819) );
  XNOR2X1 U654 ( .A(n1325), .B(n1071), .Y(n820) );
  XNOR2X1 U655 ( .A(n1323), .B(n1071), .Y(n821) );
  XNOR2X1 U656 ( .A(n1321), .B(n1071), .Y(n822) );
  XNOR2X1 U657 ( .A(n1319), .B(n1071), .Y(n823) );
  XNOR2X1 U658 ( .A(n1351), .B(n1071), .Y(n824) );
  OR2X1 U659 ( .A(n1351), .B(n1213), .Y(n825) );
  OAI22X1 U661 ( .A(n1358), .B(n1296), .C(n1293), .D(n842), .Y(n570) );
  OAI22X1 U665 ( .A(n1293), .B(n826), .C(n827), .D(n1296), .Y(n675) );
  OAI22X1 U666 ( .A(n1271), .B(n827), .C(n828), .D(n1295), .Y(n676) );
  OAI22X1 U667 ( .A(n1293), .B(n828), .C(n829), .D(n1296), .Y(n677) );
  OAI22X1 U668 ( .A(n1271), .B(n829), .C(n830), .D(n1295), .Y(n678) );
  OAI22X1 U669 ( .A(n1293), .B(n830), .C(n831), .D(n1263), .Y(n679) );
  OAI22X1 U670 ( .A(n1271), .B(n831), .C(n832), .D(n1295), .Y(n680) );
  OAI22X1 U671 ( .A(n1293), .B(n832), .C(n833), .D(n1295), .Y(n681) );
  OAI22X1 U672 ( .A(n1271), .B(n833), .C(n834), .D(n1296), .Y(n682) );
  OAI22X1 U673 ( .A(n1293), .B(n834), .C(n835), .D(n1295), .Y(n683) );
  OAI22X1 U674 ( .A(n1271), .B(n835), .C(n836), .D(n1296), .Y(n684) );
  OAI22X1 U675 ( .A(n1293), .B(n836), .C(n837), .D(n1295), .Y(n685) );
  OAI22X1 U676 ( .A(n1271), .B(n837), .C(n838), .D(n1296), .Y(n686) );
  OAI22X1 U677 ( .A(n1293), .B(n838), .C(n839), .D(n1295), .Y(n687) );
  OAI22X1 U678 ( .A(n1271), .B(n839), .C(n840), .D(n1296), .Y(n688) );
  OAI22X1 U679 ( .A(n1293), .B(n840), .C(n1263), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1351), .B(n1154), .Y(n690) );
  XNOR2X1 U682 ( .A(n877), .B(n1276), .Y(n826) );
  XNOR2X1 U683 ( .A(n1345), .B(n1158), .Y(n827) );
  XNOR2X1 U684 ( .A(n1343), .B(n1276), .Y(n828) );
  XNOR2X1 U685 ( .A(n1341), .B(n1170), .Y(n829) );
  XNOR2X1 U686 ( .A(n1339), .B(n1170), .Y(n830) );
  XNOR2X1 U687 ( .A(n1337), .B(n1170), .Y(n831) );
  XNOR2X1 U688 ( .A(n1335), .B(n1159), .Y(n832) );
  XNOR2X1 U689 ( .A(n1333), .B(n1158), .Y(n833) );
  XNOR2X1 U690 ( .A(n1331), .B(n1159), .Y(n834) );
  XNOR2X1 U691 ( .A(n1329), .B(n1158), .Y(n835) );
  XNOR2X1 U692 ( .A(n1327), .B(n1257), .Y(n836) );
  XNOR2X1 U693 ( .A(n1325), .B(n1257), .Y(n837) );
  XNOR2X1 U694 ( .A(n1323), .B(n1158), .Y(n838) );
  XNOR2X1 U695 ( .A(n1321), .B(n1257), .Y(n839) );
  XNOR2X1 U696 ( .A(n1319), .B(n1159), .Y(n840) );
  XNOR2X1 U697 ( .A(n1351), .B(n1257), .Y(n841) );
  OAI22X1 U700 ( .A(n1228), .B(n1292), .C(n1148), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1228), .B(n1260), .C(n843), .D(n1292), .Y(n692) );
  OAI22X1 U704 ( .A(n1260), .B(n843), .C(n844), .D(n1292), .Y(n693) );
  OAI22X1 U705 ( .A(n1148), .B(n844), .C(n845), .D(n1292), .Y(n694) );
  OAI22X1 U706 ( .A(n1260), .B(n845), .C(n846), .D(n1292), .Y(n695) );
  OAI22X1 U707 ( .A(n1148), .B(n846), .C(n847), .D(n1292), .Y(n696) );
  OAI22X1 U708 ( .A(n1260), .B(n847), .C(n848), .D(n1292), .Y(n697) );
  OAI22X1 U709 ( .A(n1148), .B(n848), .C(n849), .D(n1292), .Y(n698) );
  OAI22X1 U710 ( .A(n1260), .B(n849), .C(n850), .D(n1292), .Y(n699) );
  OAI22X1 U711 ( .A(n1148), .B(n850), .C(n851), .D(n1292), .Y(n700) );
  OAI22X1 U712 ( .A(n1260), .B(n851), .C(n852), .D(n1292), .Y(n701) );
  OAI22X1 U713 ( .A(n1148), .B(n852), .C(n853), .D(n1292), .Y(n702) );
  OAI22X1 U714 ( .A(n1260), .B(n853), .C(n854), .D(n1292), .Y(n703) );
  OAI22X1 U715 ( .A(n1148), .B(n854), .C(n855), .D(n1292), .Y(n704) );
  OAI22X1 U716 ( .A(n1260), .B(n855), .C(n856), .D(n1292), .Y(n705) );
  OAI22X1 U717 ( .A(n1148), .B(n856), .C(n857), .D(n1292), .Y(n706) );
  OAI22X1 U718 ( .A(n1260), .B(n857), .C(n1292), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1351), .B(n1259), .Y(n708) );
  XNOR2X1 U723 ( .A(n1343), .B(n1164), .Y(n845) );
  XNOR2X1 U725 ( .A(n1339), .B(n1164), .Y(n847) );
  XNOR2X1 U726 ( .A(n1337), .B(n1355), .Y(n848) );
  XNOR2X1 U727 ( .A(n1335), .B(n1355), .Y(n849) );
  XNOR2X1 U728 ( .A(n1333), .B(n1355), .Y(n850) );
  XNOR2X1 U729 ( .A(n1331), .B(n1355), .Y(n851) );
  XNOR2X1 U730 ( .A(n1329), .B(n1355), .Y(n852) );
  XNOR2X1 U731 ( .A(n1327), .B(n1355), .Y(n853) );
  XNOR2X1 U732 ( .A(n1325), .B(n1355), .Y(n854) );
  XNOR2X1 U733 ( .A(n1323), .B(n1355), .Y(n855) );
  XNOR2X1 U734 ( .A(n1321), .B(n1355), .Y(n856) );
  XNOR2X1 U735 ( .A(n1319), .B(n1230), .Y(n857) );
  XNOR2X1 U736 ( .A(n1351), .B(n1230), .Y(n858) );
  OR2X1 U737 ( .A(n1351), .B(n1229), .Y(n859) );
  OAI22X1 U739 ( .A(n1160), .B(n1290), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n1160), .C(n860), .D(n1153), .Y(n710) );
  OAI22X1 U743 ( .A(n860), .B(n917), .C(n861), .D(n1153), .Y(n711) );
  OAI22X1 U744 ( .A(n917), .B(n861), .C(n862), .D(n1153), .Y(n712) );
  OAI22X1 U745 ( .A(n917), .B(n862), .C(n863), .D(n1290), .Y(n713) );
  OAI22X1 U746 ( .A(n917), .B(n863), .C(n864), .D(n1290), .Y(n714) );
  OAI22X1 U747 ( .A(n917), .B(n864), .C(n865), .D(n1153), .Y(n715) );
  OAI22X1 U748 ( .A(n917), .B(n865), .C(n866), .D(n1153), .Y(n716) );
  OAI22X1 U749 ( .A(n917), .B(n866), .C(n867), .D(n1290), .Y(n717) );
  OAI22X1 U750 ( .A(n917), .B(n867), .C(n868), .D(n1290), .Y(n718) );
  OAI22X1 U751 ( .A(n917), .B(n868), .C(n869), .D(n1290), .Y(n719) );
  OAI22X1 U752 ( .A(n917), .B(n869), .C(n870), .D(n1290), .Y(n720) );
  OAI22X1 U753 ( .A(n917), .B(n870), .C(n871), .D(n1290), .Y(n721) );
  OAI22X1 U754 ( .A(n917), .B(n871), .C(n872), .D(n1290), .Y(n722) );
  OAI22X1 U755 ( .A(n917), .B(n872), .C(n873), .D(n1290), .Y(n723) );
  OAI22X1 U756 ( .A(n917), .B(n873), .C(n874), .D(n1290), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1290), .D(n875), .Y(n725) );
  XNOR2X1 U759 ( .A(n1345), .B(n1150), .Y(n861) );
  XNOR2X1 U760 ( .A(n1343), .B(n1353), .Y(n862) );
  XNOR2X1 U761 ( .A(n1341), .B(n1150), .Y(n863) );
  XNOR2X1 U762 ( .A(n1339), .B(n1353), .Y(n864) );
  XNOR2X1 U763 ( .A(n1337), .B(n1353), .Y(n865) );
  XNOR2X1 U764 ( .A(n1335), .B(n1150), .Y(n866) );
  XNOR2X1 U765 ( .A(n1333), .B(n1353), .Y(n867) );
  XNOR2X1 U766 ( .A(n1331), .B(n1150), .Y(n868) );
  XNOR2X1 U767 ( .A(n1329), .B(n1353), .Y(n869) );
  XNOR2X1 U768 ( .A(n1327), .B(n1150), .Y(n870) );
  XNOR2X1 U769 ( .A(n1325), .B(n1353), .Y(n871) );
  XNOR2X1 U770 ( .A(n1323), .B(n1150), .Y(n872) );
  XNOR2X1 U771 ( .A(n1321), .B(n1353), .Y(n873) );
  XNOR2X1 U772 ( .A(n1319), .B(n1150), .Y(n874) );
  XNOR2X1 U773 ( .A(n1351), .B(n1353), .Y(n875) );
  OR2X1 U774 ( .A(n1351), .B(n1160), .Y(n876) );
  XNOR2X1 U803 ( .A(n37), .B(a[29]), .Y(n46) );
  XOR2X1 U805 ( .A(n37), .B(a[27]), .Y(n894) );
  XNOR2X1 U806 ( .A(n31), .B(a[27]), .Y(n40) );
  NAND2X1 U807 ( .A(n895), .B(n34), .Y(n36) );
  XOR2X1 U808 ( .A(a[25]), .B(n31), .Y(n895) );
  XNOR2X1 U809 ( .A(a[25]), .B(n25), .Y(n34) );
  XOR2X1 U811 ( .A(n25), .B(a[23]), .Y(n896) );
  NAND2X1 U813 ( .A(n897), .B(n22), .Y(n24) );
  XOR2X1 U814 ( .A(n19), .B(a[21]), .Y(n897) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  BUFX4 U828 ( .A(n431), .Y(n1255) );
  INVX8 U829 ( .A(n1344), .Y(n1345) );
  INVX4 U830 ( .A(n1346), .Y(n1347) );
  INVX8 U831 ( .A(n1334), .Y(n1335) );
  INVX4 U832 ( .A(n7), .Y(n1356) );
  INVX4 U833 ( .A(n1356), .Y(n1164) );
  INVX8 U834 ( .A(n1338), .Y(n1339) );
  INVX4 U835 ( .A(n883), .Y(n1334) );
  INVX4 U836 ( .A(n877), .Y(n1346) );
  BUFX4 U837 ( .A(n159), .Y(n1169) );
  INVX4 U838 ( .A(n1185), .Y(n1314) );
  AND2X1 U839 ( .A(n46), .B(n893), .Y(n1185) );
  INVX8 U840 ( .A(n1306), .Y(n1155) );
  INVX8 U841 ( .A(n13), .Y(n1358) );
  INVX4 U842 ( .A(n1116), .Y(n1263) );
  BUFX4 U843 ( .A(n1357), .Y(n1159) );
  BUFX4 U844 ( .A(n1357), .Y(n1257) );
  INVX4 U845 ( .A(n1358), .Y(n1357) );
  INVX4 U846 ( .A(n1342), .Y(n1343) );
  INVX2 U847 ( .A(n1111), .Y(n359) );
  BUFX2 U848 ( .A(n1155), .Y(n1128) );
  BUFX2 U849 ( .A(n31), .Y(n1134) );
  INVX2 U850 ( .A(n884), .Y(n1332) );
  BUFX2 U851 ( .A(n438), .Y(n1252) );
  INVX2 U852 ( .A(n1247), .Y(n1294) );
  INVX2 U853 ( .A(n1134), .Y(n1161) );
  INVX4 U854 ( .A(n1042), .Y(n1325) );
  INVX2 U855 ( .A(n1259), .Y(n1260) );
  BUFX2 U856 ( .A(n424), .Y(n1254) );
  BUFX2 U857 ( .A(n452), .Y(n1065) );
  INVX2 U858 ( .A(n658), .Y(n1004) );
  INVX2 U859 ( .A(n366), .Y(n1033) );
  INVX2 U860 ( .A(n879), .Y(n1342) );
  INVX2 U861 ( .A(n63), .Y(n1014) );
  INVX2 U862 ( .A(n882), .Y(n1336) );
  BUFX4 U863 ( .A(n477), .Y(n1256) );
  INVX2 U864 ( .A(n49), .Y(n1352) );
  AND2X2 U865 ( .A(n1351), .B(n1168), .Y(n618) );
  XNOR2X1 U866 ( .A(n1324), .B(n1363), .Y(n786) );
  INVX2 U867 ( .A(n25), .Y(n995) );
  INVX1 U868 ( .A(n25), .Y(n1361) );
  XOR2X1 U869 ( .A(n417), .B(n406), .Y(n996) );
  XOR2X1 U870 ( .A(n404), .B(n996), .Y(n402) );
  NAND2X1 U871 ( .A(n404), .B(n417), .Y(n997) );
  NAND2X1 U872 ( .A(n404), .B(n406), .Y(n998) );
  NAND2X1 U873 ( .A(n417), .B(n406), .Y(n999) );
  NAND3X1 U874 ( .A(n998), .B(n997), .C(n999), .Y(n401) );
  XOR2X1 U875 ( .A(n541), .B(a[29]), .Y(n893) );
  INVX4 U876 ( .A(n541), .Y(n1348) );
  INVX1 U877 ( .A(n1294), .Y(n1154) );
  INVX4 U878 ( .A(n1165), .Y(n1290) );
  INVX1 U879 ( .A(n1138), .Y(n1000) );
  XNOR2X1 U880 ( .A(n95), .B(n1001), .Y(product[44]) );
  AND2X2 U881 ( .A(n94), .B(n91), .Y(n1001) );
  XNOR2X1 U882 ( .A(n86), .B(n1002), .Y(product[45]) );
  AND2X2 U883 ( .A(n85), .B(n275), .Y(n1002) );
  XNOR2X1 U884 ( .A(n112), .B(n1003), .Y(product[43]) );
  AND2X2 U885 ( .A(n111), .B(n1233), .Y(n1003) );
  XNOR2X1 U886 ( .A(n1005), .B(n1004), .Y(n382) );
  XOR2X1 U887 ( .A(n642), .B(n610), .Y(n1005) );
  INVX2 U888 ( .A(n1110), .Y(n1006) );
  INVX2 U889 ( .A(n1110), .Y(n1007) );
  INVX2 U890 ( .A(n1110), .Y(n1317) );
  XNOR2X1 U891 ( .A(n163), .B(n1008), .Y(product[38]) );
  AND2X2 U892 ( .A(n162), .B(n282), .Y(n1008) );
  INVX2 U893 ( .A(n475), .Y(n1009) );
  INVX4 U894 ( .A(n1009), .Y(n1010) );
  AND2X2 U895 ( .A(n171), .B(n159), .Y(n1011) );
  INVX4 U896 ( .A(n1011), .Y(n53) );
  INVX8 U897 ( .A(n1297), .Y(n1298) );
  INVX2 U898 ( .A(n1316), .Y(n1261) );
  INVX4 U899 ( .A(n31), .Y(n1363) );
  INVX1 U900 ( .A(n182), .Y(n285) );
  INVX8 U901 ( .A(a[15]), .Y(n917) );
  INVX2 U902 ( .A(a[19]), .Y(n1012) );
  INVX2 U903 ( .A(n1012), .Y(n1013) );
  AND2X2 U904 ( .A(n1351), .B(n1304), .Y(n636) );
  INVX8 U905 ( .A(n1250), .Y(n1302) );
  INVX2 U906 ( .A(n1311), .Y(n1312) );
  INVX4 U907 ( .A(n1249), .Y(n1212) );
  INVX2 U908 ( .A(n418), .Y(n1047) );
  INVX2 U909 ( .A(n1183), .Y(n1156) );
  INVX1 U910 ( .A(n563), .Y(n1183) );
  XNOR2X1 U911 ( .A(n170), .B(n1014), .Y(product[37]) );
  INVX1 U912 ( .A(n1151), .Y(n1015) );
  INVX1 U913 ( .A(n1337), .Y(n731) );
  XOR2X1 U914 ( .A(n325), .B(n604), .Y(n1016) );
  XOR2X1 U915 ( .A(n1016), .B(n327), .Y(n316) );
  NAND2X1 U916 ( .A(n327), .B(n325), .Y(n1017) );
  NAND2X1 U917 ( .A(n327), .B(n604), .Y(n1018) );
  NAND2X1 U918 ( .A(n325), .B(n604), .Y(n1019) );
  NAND3X1 U919 ( .A(n1018), .B(n1017), .C(n1019), .Y(n315) );
  OAI22X1 U920 ( .A(n1305), .B(n775), .C(n776), .D(n1155), .Y(n1020) );
  INVX8 U921 ( .A(n1304), .Y(n1305) );
  XOR2X1 U922 ( .A(n696), .B(n632), .Y(n1021) );
  XOR2X1 U923 ( .A(n1021), .B(n648), .Y(n466) );
  NAND2X1 U924 ( .A(n696), .B(n632), .Y(n1022) );
  NAND2X1 U925 ( .A(n696), .B(n648), .Y(n1023) );
  NAND2X1 U926 ( .A(n632), .B(n648), .Y(n1024) );
  NAND3X1 U927 ( .A(n1022), .B(n1023), .C(n1024), .Y(n465) );
  XOR2X1 U928 ( .A(n1065), .B(n454), .Y(n1025) );
  XOR2X1 U929 ( .A(n1025), .B(n465), .Y(n448) );
  NAND2X1 U930 ( .A(n1065), .B(n454), .Y(n1026) );
  NAND2X1 U931 ( .A(n1065), .B(n465), .Y(n1027) );
  NAND2X1 U932 ( .A(n454), .B(n465), .Y(n1028) );
  NAND3X1 U933 ( .A(n1026), .B(n1027), .C(n1028), .Y(n447) );
  OR2X1 U934 ( .A(n49), .B(n918), .Y(n757) );
  INVX2 U935 ( .A(n40), .Y(n1168) );
  INVX2 U936 ( .A(n1071), .Y(n1213) );
  OR2X2 U937 ( .A(n308), .B(n313), .Y(n1029) );
  OR2X2 U938 ( .A(n322), .B(n329), .Y(n1030) );
  OR2X2 U939 ( .A(n481), .B(n470), .Y(n1031) );
  INVX4 U940 ( .A(n1328), .Y(n1329) );
  INVX2 U941 ( .A(n886), .Y(n1328) );
  INVX2 U942 ( .A(n46), .Y(n1311) );
  INVX2 U943 ( .A(n24), .Y(n1300) );
  INVX4 U944 ( .A(n1320), .Y(n1321) );
  INVX4 U945 ( .A(n1322), .Y(n1323) );
  INVX4 U946 ( .A(n1340), .Y(n1341) );
  INVX2 U947 ( .A(n880), .Y(n1340) );
  INVX4 U948 ( .A(n1330), .Y(n1331) );
  INVX2 U949 ( .A(n885), .Y(n1330) );
  INVX4 U950 ( .A(n1326), .Y(n1327) );
  INVX2 U951 ( .A(n887), .Y(n1326) );
  INVX4 U952 ( .A(n1318), .Y(n1319) );
  INVX2 U953 ( .A(n891), .Y(n1318) );
  INVX2 U954 ( .A(n878), .Y(n1344) );
  OR2X2 U955 ( .A(n292), .B(n293), .Y(n1032) );
  INVX2 U956 ( .A(n888), .Y(n1042) );
  XNOR2X1 U957 ( .A(n1), .B(a[17]), .Y(n9) );
  INVX1 U958 ( .A(n1), .Y(n1354) );
  XOR2X1 U959 ( .A(n364), .B(n1033), .Y(n1137) );
  INVX1 U960 ( .A(n1258), .Y(n156) );
  INVX4 U961 ( .A(n1365), .Y(n1223) );
  XOR2X1 U962 ( .A(n628), .B(n612), .Y(n1034) );
  XOR2X1 U963 ( .A(n1034), .B(n596), .Y(n412) );
  NAND2X1 U964 ( .A(n628), .B(n612), .Y(n1035) );
  NAND2X1 U965 ( .A(n628), .B(n596), .Y(n1036) );
  NAND2X1 U966 ( .A(n612), .B(n596), .Y(n1037) );
  NAND3X1 U967 ( .A(n1035), .B(n1036), .C(n1037), .Y(n411) );
  XOR2X1 U968 ( .A(n413), .B(n409), .Y(n1038) );
  XOR2X1 U969 ( .A(n1038), .B(n411), .Y(n394) );
  NAND2X1 U970 ( .A(n413), .B(n409), .Y(n1039) );
  NAND2X1 U971 ( .A(n413), .B(n411), .Y(n1040) );
  NAND2X1 U972 ( .A(n409), .B(n411), .Y(n1041) );
  NAND3X1 U973 ( .A(n1039), .B(n1040), .C(n1041), .Y(n393) );
  INVX4 U974 ( .A(n1168), .Y(n1308) );
  INVX2 U975 ( .A(n889), .Y(n1322) );
  INVX1 U976 ( .A(n888), .Y(n1324) );
  INVX1 U977 ( .A(n51), .Y(n1316) );
  INVX1 U978 ( .A(n1316), .Y(n1043) );
  NOR2X1 U979 ( .A(n349), .B(n340), .Y(n1044) );
  INVX1 U980 ( .A(n211), .Y(n209) );
  XOR2X1 U981 ( .A(n456), .B(n663), .Y(n1179) );
  XNOR2X1 U982 ( .A(n1045), .B(n461), .Y(n446) );
  XNOR2X1 U983 ( .A(n450), .B(n463), .Y(n1045) );
  NOR2X1 U984 ( .A(n429), .B(n416), .Y(n1046) );
  INVX4 U985 ( .A(n1354), .Y(n1353) );
  XOR2X1 U986 ( .A(n1048), .B(n1047), .Y(n416) );
  XNOR2X1 U987 ( .A(n1255), .B(n420), .Y(n1048) );
  NAND2X1 U988 ( .A(n899), .B(n9), .Y(n1049) );
  INVX4 U989 ( .A(n1049), .Y(n1251) );
  INVX2 U990 ( .A(n1359), .Y(n1050) );
  INVX1 U991 ( .A(n222), .Y(n221) );
  XOR2X1 U992 ( .A(n435), .B(n422), .Y(n1051) );
  XOR2X1 U993 ( .A(n1051), .B(n433), .Y(n418) );
  NAND2X1 U994 ( .A(n435), .B(n422), .Y(n1052) );
  NAND2X1 U995 ( .A(n435), .B(n433), .Y(n1053) );
  NAND2X1 U996 ( .A(n422), .B(n433), .Y(n1054) );
  NAND3X1 U997 ( .A(n1052), .B(n1053), .C(n1054), .Y(n417) );
  NAND2X1 U998 ( .A(n1255), .B(n420), .Y(n1055) );
  NAND2X1 U999 ( .A(n1255), .B(n418), .Y(n1056) );
  NAND2X1 U1000 ( .A(n420), .B(n418), .Y(n1057) );
  NAND3X1 U1001 ( .A(n1055), .B(n1056), .C(n1057), .Y(n415) );
  XOR2X1 U1002 ( .A(n581), .B(n563), .Y(n1058) );
  XOR2X1 U1003 ( .A(n1058), .B(n693), .Y(n428) );
  NAND2X1 U1004 ( .A(n693), .B(n581), .Y(n1059) );
  NAND2X1 U1005 ( .A(n693), .B(n1156), .Y(n1060) );
  NAND2X1 U1006 ( .A(n581), .B(n1156), .Y(n1061) );
  NAND3X1 U1007 ( .A(n1060), .B(n1059), .C(n1061), .Y(n427) );
  NOR2X1 U1008 ( .A(n401), .B(n388), .Y(n1062) );
  BUFX2 U1009 ( .A(n421), .Y(n1063) );
  BUFX2 U1010 ( .A(n459), .Y(n1140) );
  BUFX2 U1011 ( .A(n403), .Y(n1064) );
  XOR2X1 U1012 ( .A(n464), .B(n468), .Y(n1066) );
  XOR2X1 U1013 ( .A(n473), .B(n1066), .Y(n460) );
  NAND2X1 U1014 ( .A(n473), .B(n464), .Y(n1067) );
  NAND2X1 U1015 ( .A(n473), .B(n468), .Y(n1068) );
  NAND2X1 U1016 ( .A(n464), .B(n468), .Y(n1069) );
  NAND3X1 U1017 ( .A(n1068), .B(n1067), .C(n1069), .Y(n459) );
  INVX4 U1018 ( .A(n19), .Y(n1359) );
  XNOR2X1 U1019 ( .A(n1070), .B(n453), .Y(n436) );
  XNOR2X1 U1020 ( .A(n451), .B(n455), .Y(n1070) );
  INVX8 U1021 ( .A(n1251), .Y(n1292) );
  XOR2X1 U1022 ( .A(n1326), .B(n1362), .Y(n785) );
  INVX4 U1023 ( .A(n1226), .Y(n1227) );
  INVX8 U1024 ( .A(n1359), .Y(n1071) );
  XOR2X1 U1025 ( .A(n622), .B(n606), .Y(n1072) );
  XOR2X1 U1026 ( .A(n1072), .B(n347), .Y(n334) );
  XOR2X1 U1027 ( .A(n345), .B(n336), .Y(n1073) );
  XOR2X1 U1028 ( .A(n1073), .B(n334), .Y(n332) );
  NAND2X1 U1029 ( .A(n622), .B(n606), .Y(n1074) );
  NAND2X1 U1030 ( .A(n622), .B(n347), .Y(n1075) );
  NAND2X1 U1031 ( .A(n606), .B(n347), .Y(n1076) );
  NAND3X1 U1032 ( .A(n1074), .B(n1075), .C(n1076), .Y(n333) );
  NAND2X1 U1033 ( .A(n345), .B(n336), .Y(n1077) );
  NAND2X1 U1034 ( .A(n345), .B(n334), .Y(n1078) );
  NAND2X1 U1035 ( .A(n336), .B(n334), .Y(n1079) );
  NAND3X1 U1036 ( .A(n1077), .B(n1078), .C(n1079), .Y(n331) );
  XOR2X1 U1037 ( .A(n328), .B(n335), .Y(n1080) );
  XOR2X1 U1038 ( .A(n1080), .B(n326), .Y(n324) );
  NAND2X1 U1039 ( .A(n328), .B(n335), .Y(n1081) );
  NAND2X1 U1040 ( .A(n328), .B(n326), .Y(n1082) );
  NAND2X1 U1041 ( .A(n335), .B(n326), .Y(n1083) );
  NAND3X1 U1042 ( .A(n1081), .B(n1082), .C(n1083), .Y(n323) );
  XOR2X1 U1043 ( .A(n318), .B(n316), .Y(n1084) );
  XOR2X1 U1044 ( .A(n1084), .B(n323), .Y(n314) );
  NAND2X1 U1045 ( .A(n318), .B(n316), .Y(n1085) );
  NAND2X1 U1046 ( .A(n318), .B(n323), .Y(n1086) );
  NAND2X1 U1047 ( .A(n316), .B(n323), .Y(n1087) );
  NAND3X1 U1048 ( .A(n1085), .B(n1086), .C(n1087), .Y(n313) );
  XOR2X1 U1049 ( .A(n337), .B(n576), .Y(n1088) );
  XOR2X1 U1050 ( .A(n1020), .B(n1088), .Y(n328) );
  NAND2X1 U1051 ( .A(n621), .B(n337), .Y(n1089) );
  NAND2X1 U1052 ( .A(n621), .B(n576), .Y(n1090) );
  NAND2X1 U1053 ( .A(n337), .B(n576), .Y(n1091) );
  NAND3X1 U1054 ( .A(n1091), .B(n1089), .C(n1090), .Y(n327) );
  XOR2X1 U1055 ( .A(n1346), .B(n1223), .Y(n758) );
  XNOR2X1 U1056 ( .A(n1092), .B(n599), .Y(n454) );
  XNOR2X1 U1057 ( .A(n647), .B(n695), .Y(n1092) );
  BUFX2 U1058 ( .A(n428), .Y(n1093) );
  XOR2X1 U1059 ( .A(n400), .B(n396), .Y(n1094) );
  XOR2X1 U1060 ( .A(n1094), .B(n398), .Y(n392) );
  NAND2X1 U1061 ( .A(n400), .B(n396), .Y(n1095) );
  NAND2X1 U1062 ( .A(n400), .B(n398), .Y(n1096) );
  NAND2X1 U1063 ( .A(n396), .B(n398), .Y(n1097) );
  NAND3X1 U1064 ( .A(n1095), .B(n1096), .C(n1097), .Y(n391) );
  XOR2X1 U1065 ( .A(n380), .B(n393), .Y(n1098) );
  XOR2X1 U1066 ( .A(n1098), .B(n391), .Y(n376) );
  NAND2X1 U1067 ( .A(n393), .B(n380), .Y(n1099) );
  NAND2X1 U1068 ( .A(n393), .B(n391), .Y(n1100) );
  NAND2X1 U1069 ( .A(n380), .B(n391), .Y(n1101) );
  NAND3X1 U1070 ( .A(n1099), .B(n1100), .C(n1101), .Y(n375) );
  XNOR2X1 U1071 ( .A(n1102), .B(a[15]), .Y(n900) );
  XOR2X1 U1072 ( .A(n877), .B(n1356), .Y(n843) );
  INVX1 U1073 ( .A(n128), .Y(n126) );
  XOR2X1 U1074 ( .A(n1341), .B(n1227), .Y(n846) );
  INVX1 U1075 ( .A(n1), .Y(n1102) );
  XOR2X1 U1076 ( .A(n1334), .B(n1071), .Y(n815) );
  BUFX2 U1077 ( .A(n364), .Y(n1103) );
  XOR2X1 U1078 ( .A(n397), .B(n626), .Y(n1104) );
  XOR2X1 U1079 ( .A(n1166), .B(n1104), .Y(n380) );
  NAND2X1 U1080 ( .A(n1166), .B(n397), .Y(n1105) );
  NAND2X1 U1081 ( .A(n1166), .B(n626), .Y(n1106) );
  NAND2X1 U1082 ( .A(n397), .B(n626), .Y(n1107) );
  NAND3X1 U1083 ( .A(n1106), .B(n1105), .C(n1107), .Y(n379) );
  BUFX2 U1084 ( .A(n399), .Y(n1166) );
  XOR2X1 U1085 ( .A(n427), .B(n1108), .Y(n1127) );
  INVX1 U1086 ( .A(n1108), .Y(n1109) );
  INVX1 U1087 ( .A(n100), .Y(n98) );
  INVX1 U1088 ( .A(n183), .Y(n181) );
  INVX2 U1089 ( .A(n425), .Y(n1108) );
  INVX2 U1090 ( .A(n421), .Y(n1126) );
  INVX8 U1091 ( .A(n1352), .Y(n1351) );
  INVX2 U1092 ( .A(n51), .Y(n1110) );
  OR2X2 U1093 ( .A(n918), .B(n1328), .Y(n1111) );
  XOR2X1 U1094 ( .A(n436), .B(n449), .Y(n1112) );
  XOR2X1 U1095 ( .A(n447), .B(n1112), .Y(n432) );
  NAND2X1 U1096 ( .A(n447), .B(n436), .Y(n1113) );
  NAND2X1 U1097 ( .A(n447), .B(n449), .Y(n1114) );
  NAND2X1 U1098 ( .A(n436), .B(n449), .Y(n1115) );
  NAND3X1 U1099 ( .A(n1114), .B(n1115), .C(n1113), .Y(n431) );
  AND2X2 U1100 ( .A(n898), .B(n1294), .Y(n1116) );
  XOR2X1 U1101 ( .A(n678), .B(n614), .Y(n1117) );
  XOR2X1 U1102 ( .A(n1117), .B(n598), .Y(n440) );
  XOR2X1 U1103 ( .A(n1252), .B(n442), .Y(n1118) );
  XOR2X1 U1104 ( .A(n1118), .B(n440), .Y(n434) );
  NAND2X1 U1105 ( .A(n678), .B(n614), .Y(n1119) );
  NAND2X1 U1106 ( .A(n678), .B(n598), .Y(n1120) );
  NAND2X1 U1107 ( .A(n614), .B(n598), .Y(n1121) );
  NAND3X1 U1108 ( .A(n1119), .B(n1120), .C(n1121), .Y(n439) );
  NAND2X1 U1109 ( .A(n1252), .B(n442), .Y(n1122) );
  NAND2X1 U1110 ( .A(n1252), .B(n440), .Y(n1123) );
  NAND2X1 U1111 ( .A(n442), .B(n440), .Y(n1124) );
  NAND3X1 U1112 ( .A(n1124), .B(n1122), .C(n1123), .Y(n433) );
  INVX4 U1113 ( .A(n37), .Y(n1365) );
  XNOR2X1 U1114 ( .A(n1356), .B(a[17]), .Y(n899) );
  INVX1 U1115 ( .A(n7), .Y(n1125) );
  INVX2 U1116 ( .A(n1247), .Y(n1293) );
  INVX2 U1117 ( .A(n22), .Y(n1297) );
  XNOR2X1 U1118 ( .A(n1126), .B(n408), .Y(n1214) );
  XNOR2X1 U1119 ( .A(n1127), .B(n414), .Y(n408) );
  INVX1 U1120 ( .A(n173), .Y(n1129) );
  XOR2X1 U1121 ( .A(n403), .B(n392), .Y(n1130) );
  XOR2X1 U1122 ( .A(n1130), .B(n390), .Y(n388) );
  NAND2X1 U1123 ( .A(n390), .B(n1064), .Y(n1131) );
  NAND2X1 U1124 ( .A(n390), .B(n392), .Y(n1132) );
  NAND2X1 U1125 ( .A(n1064), .B(n392), .Y(n1133) );
  NAND3X1 U1126 ( .A(n1132), .B(n1131), .C(n1133), .Y(n387) );
  INVX1 U1127 ( .A(n174), .Y(n1135) );
  AOI21X1 U1128 ( .A(n172), .B(n1169), .C(n160), .Y(n1136) );
  XNOR2X1 U1129 ( .A(n1137), .B(n375), .Y(n362) );
  INVX2 U1130 ( .A(n890), .Y(n1320) );
  AND2X2 U1131 ( .A(n894), .B(n40), .Y(n1138) );
  AND2X2 U1132 ( .A(n894), .B(n40), .Y(n1139) );
  INVX1 U1133 ( .A(n1044), .Y(n282) );
  XOR2X1 U1134 ( .A(n877), .B(n1149), .Y(n860) );
  INVX2 U1135 ( .A(n446), .Y(n1151) );
  XOR2X1 U1136 ( .A(n395), .B(n384), .Y(n1141) );
  XOR2X1 U1137 ( .A(n1141), .B(n382), .Y(n378) );
  NAND2X1 U1138 ( .A(n642), .B(n610), .Y(n1142) );
  NAND2X1 U1139 ( .A(n642), .B(n658), .Y(n1143) );
  NAND2X1 U1140 ( .A(n610), .B(n658), .Y(n1144) );
  NAND3X1 U1141 ( .A(n1142), .B(n1143), .C(n1144), .Y(n381) );
  NAND2X1 U1142 ( .A(n395), .B(n384), .Y(n1145) );
  NAND2X1 U1143 ( .A(n395), .B(n382), .Y(n1146) );
  NAND2X1 U1144 ( .A(n384), .B(n382), .Y(n1147) );
  NAND3X1 U1145 ( .A(n1145), .B(n1146), .C(n1147), .Y(n377) );
  INVX2 U1146 ( .A(n1291), .Y(n1148) );
  INVX4 U1147 ( .A(n1264), .Y(n1149) );
  INVX8 U1148 ( .A(n1149), .Y(n1150) );
  INVX2 U1149 ( .A(n1157), .Y(n1264) );
  XNOR2X1 U1150 ( .A(n1172), .B(n1151), .Y(n444) );
  BUFX2 U1151 ( .A(n563), .Y(n1152) );
  XNOR2X1 U1152 ( .A(n1358), .B(n1013), .Y(n898) );
  INVX2 U1153 ( .A(n1358), .Y(n1276) );
  NAND2X1 U1154 ( .A(n917), .B(n900), .Y(n1153) );
  INVX1 U1155 ( .A(n1), .Y(n1157) );
  BUFX4 U1156 ( .A(n1357), .Y(n1158) );
  BUFX2 U1157 ( .A(n36), .Y(n1225) );
  XOR2X1 U1158 ( .A(n1344), .B(n1164), .Y(n844) );
  BUFX2 U1159 ( .A(n1157), .Y(n1160) );
  INVX1 U1160 ( .A(n444), .Y(n1162) );
  INVX1 U1161 ( .A(n1162), .Y(n1163) );
  AND2X2 U1162 ( .A(n917), .B(n900), .Y(n1165) );
  INVX4 U1163 ( .A(n1168), .Y(n1307) );
  INVX4 U1164 ( .A(n1311), .Y(n1313) );
  AND2X2 U1165 ( .A(n898), .B(n1294), .Y(n1167) );
  AND2X2 U1166 ( .A(n49), .B(n1350), .Y(n582) );
  INVX1 U1167 ( .A(n1297), .Y(n1299) );
  INVX2 U1168 ( .A(n1358), .Y(n1170) );
  BUFX2 U1169 ( .A(n441), .Y(n1171) );
  XOR2X1 U1170 ( .A(n459), .B(n448), .Y(n1172) );
  NAND2X1 U1171 ( .A(n463), .B(n450), .Y(n1173) );
  NAND2X1 U1172 ( .A(n463), .B(n461), .Y(n1174) );
  NAND2X1 U1173 ( .A(n450), .B(n461), .Y(n1175) );
  NAND3X1 U1174 ( .A(n1173), .B(n1174), .C(n1175), .Y(n445) );
  NAND2X1 U1175 ( .A(n448), .B(n1140), .Y(n1176) );
  NAND2X1 U1176 ( .A(n448), .B(n446), .Y(n1177) );
  NAND2X1 U1177 ( .A(n1140), .B(n1015), .Y(n1178) );
  NAND3X1 U1178 ( .A(n1176), .B(n1177), .C(n1178), .Y(n443) );
  XOR2X1 U1179 ( .A(n467), .B(n1179), .Y(n450) );
  NAND2X1 U1180 ( .A(n467), .B(n456), .Y(n1180) );
  NAND2X1 U1181 ( .A(n467), .B(n663), .Y(n1181) );
  NAND2X1 U1182 ( .A(n456), .B(n663), .Y(n1182) );
  NAND3X1 U1183 ( .A(n1181), .B(n1180), .C(n1182), .Y(n449) );
  AND2X2 U1184 ( .A(n46), .B(n893), .Y(n1184) );
  INVX4 U1185 ( .A(n1138), .Y(n1310) );
  INVX4 U1186 ( .A(n1139), .Y(n1309) );
  INVX8 U1187 ( .A(n1365), .Y(n1364) );
  INVX4 U1188 ( .A(n1167), .Y(n1295) );
  INVX8 U1189 ( .A(n1300), .Y(n1301) );
  XNOR2X1 U1190 ( .A(n73), .B(n1186), .Y(product[46]) );
  AND2X2 U1191 ( .A(n72), .B(n1032), .Y(n1186) );
  INVX1 U1192 ( .A(n210), .Y(n289) );
  INVX4 U1193 ( .A(n1248), .Y(n1296) );
  INVX8 U1194 ( .A(n995), .Y(n1360) );
  XNOR2X1 U1195 ( .A(n13), .B(a[21]), .Y(n22) );
  XOR2X1 U1196 ( .A(n682), .B(n499), .Y(n1187) );
  XOR2X1 U1197 ( .A(n1187), .B(n497), .Y(n486) );
  NAND2X1 U1198 ( .A(n682), .B(n499), .Y(n1188) );
  NAND2X1 U1199 ( .A(n682), .B(n497), .Y(n1189) );
  NAND2X1 U1200 ( .A(n499), .B(n497), .Y(n1190) );
  NAND3X1 U1201 ( .A(n1188), .B(n1189), .C(n1190), .Y(n485) );
  XOR2X1 U1202 ( .A(n476), .B(n478), .Y(n1191) );
  XOR2X1 U1203 ( .A(n1191), .B(n485), .Y(n472) );
  NAND2X1 U1204 ( .A(n476), .B(n478), .Y(n1192) );
  NAND2X1 U1205 ( .A(n476), .B(n485), .Y(n1193) );
  NAND2X1 U1206 ( .A(n478), .B(n485), .Y(n1194) );
  NAND3X1 U1207 ( .A(n1192), .B(n1193), .C(n1194), .Y(n471) );
  XOR2X1 U1208 ( .A(n428), .B(n441), .Y(n1195) );
  XOR2X1 U1209 ( .A(n1195), .B(n437), .Y(n422) );
  NAND2X1 U1210 ( .A(n437), .B(n1171), .Y(n1196) );
  NAND2X1 U1211 ( .A(n437), .B(n1093), .Y(n1197) );
  NAND2X1 U1212 ( .A(n1171), .B(n1093), .Y(n1198) );
  NAND3X1 U1213 ( .A(n1197), .B(n1196), .C(n1198), .Y(n421) );
  XOR2X1 U1214 ( .A(n367), .B(n356), .Y(n1199) );
  XOR2X1 U1215 ( .A(n365), .B(n1199), .Y(n352) );
  NAND2X1 U1216 ( .A(n365), .B(n367), .Y(n1200) );
  NAND2X1 U1217 ( .A(n365), .B(n356), .Y(n1201) );
  NAND2X1 U1218 ( .A(n367), .B(n356), .Y(n1202) );
  NAND3X1 U1219 ( .A(n1201), .B(n1200), .C(n1202), .Y(n351) );
  XNOR2X1 U1220 ( .A(n19), .B(a[23]), .Y(n1203) );
  INVX2 U1221 ( .A(n1203), .Y(n1250) );
  NAND2X1 U1222 ( .A(n647), .B(n695), .Y(n1204) );
  NAND2X1 U1223 ( .A(n647), .B(n599), .Y(n1205) );
  NAND2X1 U1224 ( .A(n695), .B(n599), .Y(n1206) );
  NAND3X1 U1225 ( .A(n1204), .B(n1205), .C(n1206), .Y(n453) );
  NAND2X1 U1226 ( .A(n455), .B(n451), .Y(n1207) );
  NAND2X1 U1227 ( .A(n455), .B(n453), .Y(n1208) );
  NAND2X1 U1228 ( .A(n451), .B(n453), .Y(n1209) );
  NAND3X1 U1229 ( .A(n1207), .B(n1208), .C(n1209), .Y(n435) );
  NOR2X1 U1230 ( .A(n1313), .B(n755), .Y(n1210) );
  NOR2X1 U1231 ( .A(n1314), .B(n756), .Y(n1211) );
  OR2X2 U1232 ( .A(n1210), .B(n1211), .Y(n599) );
  XOR2X1 U1233 ( .A(n419), .B(n1214), .Y(n404) );
  NAND2X1 U1234 ( .A(n419), .B(n1063), .Y(n1215) );
  NAND2X1 U1235 ( .A(n419), .B(n408), .Y(n1216) );
  NAND2X1 U1236 ( .A(n1063), .B(n408), .Y(n1217) );
  NAND3X1 U1237 ( .A(n1216), .B(n1215), .C(n1217), .Y(n403) );
  XOR2X1 U1238 ( .A(n644), .B(n660), .Y(n1218) );
  XOR2X1 U1239 ( .A(n1218), .B(n676), .Y(n410) );
  NAND2X1 U1240 ( .A(n676), .B(n644), .Y(n1219) );
  NAND2X1 U1241 ( .A(n676), .B(n660), .Y(n1220) );
  NAND2X1 U1242 ( .A(n660), .B(n644), .Y(n1221) );
  NAND3X1 U1243 ( .A(n1220), .B(n1219), .C(n1221), .Y(n409) );
  INVX2 U1244 ( .A(n283), .Y(n1222) );
  INVX2 U1245 ( .A(n287), .Y(n1224) );
  INVX8 U1246 ( .A(n1363), .Y(n1362) );
  INVX4 U1247 ( .A(n1348), .Y(n1349) );
  INVX2 U1248 ( .A(n1125), .Y(n1226) );
  INVX1 U1249 ( .A(n1226), .Y(n1228) );
  INVX1 U1250 ( .A(n1226), .Y(n1229) );
  OR2X2 U1251 ( .A(n1253), .B(n80), .Y(n1231) );
  OR2X2 U1252 ( .A(n302), .B(n307), .Y(n1233) );
  INVX4 U1253 ( .A(n1249), .Y(n1303) );
  AND2X1 U1254 ( .A(n572), .B(n725), .Y(n1246) );
  INVX1 U1255 ( .A(n1228), .Y(n1230) );
  INVX8 U1256 ( .A(n1227), .Y(n1355) );
  AND2X2 U1257 ( .A(n481), .B(n470), .Y(n1232) );
  OR2X1 U1258 ( .A(n523), .B(n518), .Y(n1234) );
  AND2X2 U1259 ( .A(n491), .B(n482), .Y(n1235) );
  OR2X1 U1260 ( .A(n491), .B(n482), .Y(n1236) );
  AND2X2 U1261 ( .A(n523), .B(n518), .Y(n1237) );
  INVX2 U1262 ( .A(n1275), .Y(n674) );
  INVX2 U1263 ( .A(n1152), .Y(n709) );
  INVX2 U1264 ( .A(n554), .Y(n655) );
  XNOR2X1 U1265 ( .A(n1238), .B(n641), .Y(n372) );
  XNOR2X1 U1266 ( .A(n385), .B(n578), .Y(n1238) );
  XNOR2X1 U1267 ( .A(n692), .B(n1239), .Y(n414) );
  XNOR2X1 U1268 ( .A(n1156), .B(n580), .Y(n1239) );
  INVX2 U1269 ( .A(n560), .Y(n691) );
  INVX2 U1270 ( .A(n551), .Y(n637) );
  OR2X1 U1271 ( .A(n724), .B(n708), .Y(n1240) );
  OR2X1 U1272 ( .A(n533), .B(n530), .Y(n1241) );
  OR2X1 U1273 ( .A(n539), .B(n538), .Y(n1242) );
  AND2X2 U1274 ( .A(n724), .B(n708), .Y(n1243) );
  AND2X2 U1275 ( .A(n533), .B(n530), .Y(n1244) );
  AND2X2 U1276 ( .A(n539), .B(n538), .Y(n1245) );
  XNOR2X1 U1277 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1278 ( .A(n548), .Y(n619) );
  INVX2 U1279 ( .A(n545), .Y(n601) );
  XOR2X1 U1280 ( .A(a[19]), .B(n7), .Y(n1247) );
  AND2X2 U1281 ( .A(n898), .B(n1294), .Y(n1248) );
  INVX2 U1282 ( .A(n36), .Y(n1306) );
  INVX2 U1283 ( .A(n881), .Y(n1338) );
  AND2X2 U1284 ( .A(n896), .B(n1203), .Y(n1249) );
  INVX1 U1285 ( .A(n9), .Y(n1291) );
  INVX4 U1286 ( .A(n1184), .Y(n1315) );
  INVX2 U1287 ( .A(n34), .Y(n1304) );
  BUFX4 U1288 ( .A(n137), .Y(n1253) );
  INVX1 U1289 ( .A(n200), .Y(n202) );
  INVX1 U1290 ( .A(n1062), .Y(n286) );
  INVX1 U1291 ( .A(n213), .Y(n212) );
  INVX1 U1292 ( .A(n194), .Y(n287) );
  AOI21X1 U1293 ( .A(n172), .B(n1169), .C(n160), .Y(n1258) );
  OR2X2 U1294 ( .A(n1351), .B(n1358), .Y(n842) );
  INVX1 U1295 ( .A(n9), .Y(n1259) );
  OR2X2 U1296 ( .A(n339), .B(n330), .Y(n1262) );
  INVX1 U1297 ( .A(n1262), .Y(n148) );
  INVX1 U1298 ( .A(n216), .Y(n290) );
  INVX1 U1299 ( .A(n205), .Y(n288) );
  INVX1 U1300 ( .A(n199), .Y(n201) );
  INVX2 U1301 ( .A(n826), .Y(n1277) );
  NAND2X1 U1302 ( .A(n1152), .B(n580), .Y(n1265) );
  NAND2X1 U1303 ( .A(n1152), .B(n692), .Y(n1266) );
  NAND2X1 U1304 ( .A(n580), .B(n692), .Y(n1267) );
  NAND3X1 U1305 ( .A(n1265), .B(n1266), .C(n1267), .Y(n413) );
  NAND2X1 U1306 ( .A(n427), .B(n1109), .Y(n1268) );
  NAND2X1 U1307 ( .A(n427), .B(n414), .Y(n1269) );
  NAND2X1 U1308 ( .A(n1109), .B(n414), .Y(n1270) );
  NAND3X1 U1309 ( .A(n1268), .B(n1269), .C(n1270), .Y(n407) );
  BUFX2 U1310 ( .A(n1294), .Y(n1271) );
  NAND2X1 U1311 ( .A(n375), .B(n1103), .Y(n1272) );
  NAND2X1 U1312 ( .A(n375), .B(n366), .Y(n1273) );
  NAND2X1 U1313 ( .A(n1103), .B(n366), .Y(n1274) );
  NAND3X1 U1314 ( .A(n1273), .B(n1272), .C(n1274), .Y(n361) );
  INVX1 U1315 ( .A(n171), .Y(n173) );
  INVX1 U1316 ( .A(n172), .Y(n174) );
  AOI22X1 U1317 ( .A(n1276), .B(n1154), .C(n1277), .D(n1167), .Y(n1275) );
  INVX1 U1318 ( .A(n1071), .Y(n1278) );
  XOR2X1 U1319 ( .A(n657), .B(n625), .Y(n1279) );
  XOR2X1 U1320 ( .A(n1279), .B(n372), .Y(n368) );
  NAND2X1 U1321 ( .A(n385), .B(n578), .Y(n1280) );
  NAND2X1 U1322 ( .A(n385), .B(n641), .Y(n1281) );
  NAND2X1 U1323 ( .A(n578), .B(n641), .Y(n1282) );
  NAND3X1 U1324 ( .A(n1280), .B(n1281), .C(n1282), .Y(n371) );
  NAND2X1 U1325 ( .A(n657), .B(n625), .Y(n1283) );
  NAND2X1 U1326 ( .A(n657), .B(n372), .Y(n1284) );
  NAND2X1 U1327 ( .A(n625), .B(n372), .Y(n1285) );
  NAND3X1 U1328 ( .A(n1283), .B(n1284), .C(n1285), .Y(n367) );
  INVX1 U1329 ( .A(n177), .Y(n284) );
  INVX1 U1330 ( .A(n166), .Y(n283) );
  XOR2X1 U1331 ( .A(n358), .B(n371), .Y(n1286) );
  XOR2X1 U1332 ( .A(n369), .B(n1286), .Y(n354) );
  NAND2X1 U1333 ( .A(n369), .B(n358), .Y(n1287) );
  NAND2X1 U1334 ( .A(n369), .B(n371), .Y(n1288) );
  NAND2X1 U1335 ( .A(n358), .B(n371), .Y(n1289) );
  NAND3X1 U1336 ( .A(n1288), .B(n1287), .C(n1289), .Y(n353) );
  INVX2 U1337 ( .A(n557), .Y(n673) );
  INVX1 U1338 ( .A(n53), .Y(n155) );
  INVX8 U1339 ( .A(n1349), .Y(n918) );
  INVX8 U1340 ( .A(n1332), .Y(n1333) );
  INVX8 U1341 ( .A(n1336), .Y(n1337) );
  INVX8 U1342 ( .A(n1348), .Y(n1350) );
  INVX2 U1343 ( .A(n101), .Y(n99) );
  INVX2 U1344 ( .A(n94), .Y(n92) );
  INVX2 U1345 ( .A(n79), .Y(n77) );
  OAI22X1 U1346 ( .A(n917), .B(n1160), .C(n1160), .D(n6), .Y(n563) );
  OAI22X1 U1347 ( .A(n1148), .B(n1229), .C(n1292), .D(n1229), .Y(n560) );
  OAI22X1 U1348 ( .A(n1293), .B(n1358), .C(n1263), .D(n1358), .Y(n557) );
  OAI22X1 U1349 ( .A(n1298), .B(n1213), .C(n1301), .D(n1278), .Y(n554) );
  OAI22X1 U1350 ( .A(n1302), .B(n1361), .C(n1303), .D(n1361), .Y(n551) );
  OAI22X1 U1351 ( .A(n1305), .B(n1161), .C(n1128), .D(n1161), .Y(n548) );
  OAI22X1 U1352 ( .A(n1307), .B(n1365), .C(n1000), .D(n1365), .Y(n545) );
  OAI22X1 U1353 ( .A(n1313), .B(n918), .C(n1315), .D(n918), .Y(n542) );
  INVX2 U1354 ( .A(n385), .Y(n386) );
  INVX2 U1355 ( .A(n337), .Y(n338) );
  INVX2 U1356 ( .A(n319), .Y(n320) );
  INVX2 U1357 ( .A(n305), .Y(n306) );
  INVX2 U1358 ( .A(n295), .Y(n296) );
  INVX2 U1359 ( .A(n130), .Y(n279) );
  INVX2 U1360 ( .A(n93), .Y(n91) );
  INVX2 U1361 ( .A(n84), .Y(n275) );
  INVX2 U1362 ( .A(n149), .Y(n151) );
  INVX2 U1363 ( .A(n144), .Y(n142) );
  INVX2 U1364 ( .A(n129), .Y(n127) );
  INVX2 U1365 ( .A(n122), .Y(n120) );
  INVX2 U1366 ( .A(n111), .Y(n109) );
  INVX2 U1367 ( .A(n105), .Y(n103) );
  INVX2 U1368 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n19, n26, n31, n20, 
        src1_data[11], n18, n7, src1_data[8], n16, src1_data[6], n2, n17, n1, 
        n12, src1_data[1:0]}), .B({src2_data[16], src2_data[16], n25, n13, 
        src2_data[13:12], n11, src2_data[10:8], n9, n6, n15, src2_data[4], n3, 
        src2_data[2:1], n29}), .CI(1'b0), .SUM(large_sum) );
  alu_DW01_sub_2 sub_44 ( .A({src1_data[16], src1_data[16], n19, n26, n31, n20, 
        src1_data[11], n18, n7, src1_data[8], n16, src1_data[6], n2, n17, n1, 
        n12, src1_data[1:0]}), .B({src2_data[16], src2_data[16], n25, n13, 
        src2_data[13:12], n11, src2_data[10:8], n9, n6, n15, src2_data[4], n3, 
        src2_data[2:1], n29}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW_mult_uns_3 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b({n25, src2_data[14:1], n29}), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  INVX2 U3 ( .A(src2_data[0]), .Y(n30) );
  INVX4 U4 ( .A(n30), .Y(n29) );
  BUFX2 U6 ( .A(src1_data[3]), .Y(n1) );
  BUFX2 U7 ( .A(src1_data[5]), .Y(n2) );
  BUFX2 U9 ( .A(src2_data[3]), .Y(n3) );
  XNOR2X1 U10 ( .A(n71), .B(large_sum[17]), .Y(n4) );
  INVX1 U11 ( .A(src2_data[6]), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n6) );
  BUFX2 U13 ( .A(src1_data[9]), .Y(n7) );
  INVX1 U14 ( .A(src2_data[7]), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n9) );
  INVX1 U16 ( .A(src2_data[11]), .Y(n10) );
  INVX2 U17 ( .A(n10), .Y(n11) );
  BUFX2 U18 ( .A(src1_data[2]), .Y(n12) );
  BUFX2 U19 ( .A(src2_data[14]), .Y(n13) );
  INVX1 U20 ( .A(src2_data[5]), .Y(n14) );
  INVX2 U21 ( .A(n14), .Y(n15) );
  BUFX2 U22 ( .A(src1_data[7]), .Y(n16) );
  INVX1 U23 ( .A(src1_data[13]), .Y(n32) );
  INVX2 U24 ( .A(n32), .Y(n31) );
  BUFX2 U25 ( .A(src1_data[4]), .Y(n17) );
  BUFX2 U26 ( .A(src1_data[10]), .Y(n18) );
  BUFX2 U27 ( .A(src1_data[15]), .Y(n19) );
  BUFX2 U28 ( .A(src1_data[12]), .Y(n20) );
  NAND2X1 U29 ( .A(n4), .B(n67), .Y(n21) );
  NAND2X1 U30 ( .A(n21), .B(n34), .Y(overflow) );
  INVX2 U31 ( .A(n72), .Y(n67) );
  AND2X2 U32 ( .A(n36), .B(n35), .Y(n22) );
  AND2X2 U33 ( .A(alu_op[1]), .B(n35), .Y(n23) );
  AND2X2 U34 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n24) );
  BUFX4 U35 ( .A(src2_data[15]), .Y(n25) );
  BUFX2 U36 ( .A(src1_data[14]), .Y(n26) );
  INVX2 U37 ( .A(large_sum[16]), .Y(n71) );
  INVX2 U38 ( .A(alu_op[1]), .Y(n36) );
  NAND2X1 U39 ( .A(alu_op[0]), .B(n36), .Y(n72) );
  INVX2 U40 ( .A(alu_op[0]), .Y(n35) );
  XOR2X1 U41 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n33) );
  AOI22X1 U42 ( .A(N26), .B(n24), .C(n33), .D(n23), .Y(n34) );
  AOI22X1 U43 ( .A(src1_data[0]), .B(n22), .C(full_mult[30]), .D(n24), .Y(n38)
         );
  AOI22X1 U44 ( .A(large_dif[0]), .B(n23), .C(large_sum[0]), .D(n67), .Y(n37)
         );
  NAND2X1 U45 ( .A(n38), .B(n37), .Y(result[0]) );
  AOI22X1 U46 ( .A(src1_data[1]), .B(n22), .C(full_mult[31]), .D(n24), .Y(n40)
         );
  AOI22X1 U47 ( .A(large_dif[1]), .B(n23), .C(large_sum[1]), .D(n67), .Y(n39)
         );
  NAND2X1 U48 ( .A(n40), .B(n39), .Y(result[1]) );
  AOI22X1 U49 ( .A(n12), .B(n22), .C(full_mult[32]), .D(n24), .Y(n42) );
  AOI22X1 U50 ( .A(large_dif[2]), .B(n23), .C(large_sum[2]), .D(n67), .Y(n41)
         );
  NAND2X1 U51 ( .A(n42), .B(n41), .Y(result[2]) );
  AOI22X1 U52 ( .A(n1), .B(n22), .C(full_mult[33]), .D(n24), .Y(n44) );
  AOI22X1 U53 ( .A(large_dif[3]), .B(n23), .C(large_sum[3]), .D(n67), .Y(n43)
         );
  NAND2X1 U54 ( .A(n44), .B(n43), .Y(result[3]) );
  AOI22X1 U55 ( .A(n17), .B(n22), .C(full_mult[34]), .D(n24), .Y(n46) );
  AOI22X1 U56 ( .A(large_dif[4]), .B(n23), .C(large_sum[4]), .D(n67), .Y(n45)
         );
  NAND2X1 U57 ( .A(n46), .B(n45), .Y(result[4]) );
  AOI22X1 U58 ( .A(n2), .B(n22), .C(full_mult[35]), .D(n24), .Y(n48) );
  AOI22X1 U59 ( .A(large_dif[5]), .B(n23), .C(large_sum[5]), .D(n67), .Y(n47)
         );
  NAND2X1 U60 ( .A(n48), .B(n47), .Y(result[5]) );
  AOI22X1 U61 ( .A(src1_data[6]), .B(n22), .C(full_mult[36]), .D(n24), .Y(n50)
         );
  AOI22X1 U62 ( .A(large_dif[6]), .B(n23), .C(large_sum[6]), .D(n67), .Y(n49)
         );
  NAND2X1 U63 ( .A(n49), .B(n50), .Y(result[6]) );
  AOI22X1 U64 ( .A(n16), .B(n22), .C(full_mult[37]), .D(n24), .Y(n52) );
  AOI22X1 U65 ( .A(large_dif[7]), .B(n23), .C(large_sum[7]), .D(n67), .Y(n51)
         );
  NAND2X1 U66 ( .A(n52), .B(n51), .Y(result[7]) );
  AOI22X1 U67 ( .A(src1_data[8]), .B(n22), .C(full_mult[38]), .D(n24), .Y(n54)
         );
  AOI22X1 U68 ( .A(large_dif[8]), .B(n23), .C(large_sum[8]), .D(n67), .Y(n53)
         );
  NAND2X1 U69 ( .A(n54), .B(n53), .Y(result[8]) );
  AOI22X1 U70 ( .A(n7), .B(n22), .C(full_mult[39]), .D(n24), .Y(n56) );
  AOI22X1 U71 ( .A(large_dif[9]), .B(n23), .C(large_sum[9]), .D(n67), .Y(n55)
         );
  NAND2X1 U72 ( .A(n56), .B(n55), .Y(result[9]) );
  AOI22X1 U73 ( .A(n18), .B(n22), .C(full_mult[40]), .D(n24), .Y(n58) );
  AOI22X1 U74 ( .A(large_dif[10]), .B(n23), .C(large_sum[10]), .D(n67), .Y(n57) );
  NAND2X1 U75 ( .A(n58), .B(n57), .Y(result[10]) );
  AOI22X1 U76 ( .A(src1_data[11]), .B(n22), .C(full_mult[41]), .D(n24), .Y(n60) );
  AOI22X1 U77 ( .A(large_dif[11]), .B(n23), .C(large_sum[11]), .D(n67), .Y(n59) );
  NAND2X1 U78 ( .A(n60), .B(n59), .Y(result[11]) );
  AOI22X1 U79 ( .A(n20), .B(n22), .C(full_mult[42]), .D(n24), .Y(n62) );
  AOI22X1 U80 ( .A(large_dif[12]), .B(n23), .C(large_sum[12]), .D(n67), .Y(n61) );
  NAND2X1 U81 ( .A(n62), .B(n61), .Y(result[12]) );
  AOI22X1 U82 ( .A(n31), .B(n22), .C(full_mult[43]), .D(n24), .Y(n64) );
  AOI22X1 U83 ( .A(large_dif[13]), .B(n23), .C(large_sum[13]), .D(n67), .Y(n63) );
  NAND2X1 U84 ( .A(n64), .B(n63), .Y(result[13]) );
  AOI22X1 U85 ( .A(n26), .B(n22), .C(full_mult[44]), .D(n24), .Y(n66) );
  AOI22X1 U86 ( .A(large_dif[14]), .B(n23), .C(large_sum[14]), .D(n67), .Y(n65) );
  NAND2X1 U87 ( .A(n66), .B(n65), .Y(result[14]) );
  AOI22X1 U88 ( .A(n19), .B(n22), .C(full_mult[45]), .D(n24), .Y(n69) );
  AOI22X1 U89 ( .A(large_dif[15]), .B(n23), .C(large_sum[15]), .D(n67), .Y(n68) );
  NAND2X1 U90 ( .A(n69), .B(n68), .Y(result[15]) );
  AOI22X1 U91 ( .A(src1_data[16]), .B(n22), .C(large_dif[16]), .D(n23), .Y(n70) );
  OAI21X1 U92 ( .A(n72), .B(n71), .C(n70), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n20), .Y(n30) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n22), .Y(n28) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n18), .Y(n32) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n11), .Y(n46) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n46) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n13), .Y(n42) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n20), .Y(n30) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n12), .Y(n44) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX2 U10 ( .A(write_enable), .Y(n1) );
  INVX2 U11 ( .A(n4), .Y(n3) );
  INVX2 U12 ( .A(n_reset), .Y(n4) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U26 ( .A(n11), .Y(n46) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n14), .Y(n40) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U23 ( .A(n11), .Y(n46) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n14), .Y(n40) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U23 ( .A(n11), .Y(n46) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n776), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n775), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n773), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n776), .Y(n10) );
  NOR2X1 U29 ( .A(n774), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n775), .B(n773), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n772), 
        .write_enable(write_enables[0]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n743, n740, n737, n734, n732, n729, n726, n723, n720, 
        n717}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n765), 
        .write_enable(write_enables[1]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n95, n740, n97, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n765), 
        .write_enable(write_enables[2]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n743, n739, n737, n734, n732, n729, n726, n723, n720, 
        w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n766), 
        .write_enable(write_enables[3]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n742, n740, n736, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[3][16] , \regs_matrix[3][15] , 
        \regs_matrix[3][14] , \regs_matrix[3][13] , \regs_matrix[3][12] , 
        \regs_matrix[3][11] , \regs_matrix[3][10] , \regs_matrix[3][9] , 
        \regs_matrix[3][8] , \regs_matrix[3][7] , \regs_matrix[3][6] , 
        \regs_matrix[3][5] , \regs_matrix[3][4] , \regs_matrix[3][3] , 
        \regs_matrix[3][2] , \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n766), 
        .write_enable(write_enables[4]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n743, n739, n737, n734, n732, n729, n726, n723, n720, 
        w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n767), 
        .write_enable(write_enables[5]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n96, n740, n98, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n767), 
        .write_enable(write_enables[6]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n743, n739, n737, n734, n732, n729, n726, n723, n720, 
        w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n768), 
        .write_enable(write_enables[7]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n95, n740, n97, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n768), 
        .write_enable(write_enables[8]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n96, n739, n98, n734, n732, n729, n726, n723, n720, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n769), 
        .write_enable(write_enables[9]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n742, n740, n736, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[9][16] , \regs_matrix[9][15] , 
        \regs_matrix[9][14] , \regs_matrix[9][13] , \regs_matrix[9][12] , 
        \regs_matrix[9][11] , \regs_matrix[9][10] , \regs_matrix[9][9] , 
        \regs_matrix[9][8] , \regs_matrix[9][7] , \regs_matrix[9][6] , 
        \regs_matrix[9][5] , \regs_matrix[9][4] , \regs_matrix[9][3] , 
        \regs_matrix[9][2] , \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n769), 
        .write_enable(write_enables[10]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n95, n739, n97, n734, n732, n729, n726, n723, n720, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n770), 
        .write_enable(write_enables[11]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n96, n740, n98, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n770), 
        .write_enable(write_enables[12]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n742, n739, n736, n734, n732, n729, n726, n723, n720, 
        w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n771), 
        .write_enable(write_enables[13]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n95, n740, n97, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n771), 
        .write_enable(write_enables[14]), .new_value({n764, n760, n757, n755, 
        n751, n748, n746, n96, n739, n98, n734, n732, n729, n726, n723, n720, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n772), 
        .write_enable(write_enables[15]), .new_value({n763, n761, n758, n754, 
        n752, n749, n745, n742, n739, n736, n734, n731, n728, n725, n722, n719, 
        n717}), .current_value({\regs_matrix[15][16] , \regs_matrix[15][15] , 
        \regs_matrix[15][14] , \regs_matrix[15][13] , \regs_matrix[15][12] , 
        \regs_matrix[15][11] , \regs_matrix[15][10] , \regs_matrix[15][9] , 
        \regs_matrix[15][8] , \regs_matrix[15][7] , \regs_matrix[15][6] , 
        \regs_matrix[15][5] , \regs_matrix[15][4] , \regs_matrix[15][3] , 
        \regs_matrix[15][2] , \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(n427), .Y(n430) );
  INVX8 U3 ( .A(n46), .Y(n47) );
  INVX4 U4 ( .A(n41), .Y(n42) );
  INVX4 U5 ( .A(n426), .Y(n91) );
  INVX4 U31 ( .A(n707), .Y(n709) );
  INVX8 U32 ( .A(n428), .Y(n429) );
  INVX2 U33 ( .A(n134), .Y(n1) );
  INVX4 U34 ( .A(n1), .Y(n2) );
  AND2X1 U35 ( .A(N14), .B(N15), .Y(n111) );
  INVX1 U36 ( .A(n47), .Y(n431) );
  INVX2 U37 ( .A(n431), .Y(n432) );
  INVX2 U38 ( .A(n431), .Y(n103) );
  INVX4 U39 ( .A(n279), .Y(r1_data[9]) );
  INVX4 U40 ( .A(n177), .Y(r1_data[3]) );
  INVX4 U41 ( .A(n211), .Y(r1_data[5]) );
  INVX1 U42 ( .A(n691), .Y(n3) );
  INVX1 U43 ( .A(n691), .Y(n4) );
  INVX1 U44 ( .A(n691), .Y(n14) );
  INVX1 U45 ( .A(n691), .Y(n15) );
  INVX1 U46 ( .A(n691), .Y(n16) );
  INVX1 U47 ( .A(n691), .Y(n17) );
  INVX1 U48 ( .A(n692), .Y(n18) );
  INVX1 U49 ( .A(n692), .Y(n19) );
  INVX1 U50 ( .A(n692), .Y(n20) );
  INVX1 U51 ( .A(n692), .Y(n21) );
  INVX1 U52 ( .A(n692), .Y(n22) );
  INVX2 U53 ( .A(n692), .Y(n23) );
  INVX1 U54 ( .A(n693), .Y(n24) );
  INVX1 U55 ( .A(n693), .Y(n25) );
  INVX1 U56 ( .A(n693), .Y(n26) );
  INVX1 U57 ( .A(n693), .Y(n27) );
  INVX1 U58 ( .A(n693), .Y(n28) );
  INVX1 U59 ( .A(n693), .Y(n29) );
  INVX1 U60 ( .A(n454), .Y(n30) );
  INVX4 U61 ( .A(n454), .Y(n691) );
  BUFX4 U62 ( .A(n691), .Y(n692) );
  INVX8 U63 ( .A(n698), .Y(n700) );
  INVX4 U64 ( .A(n108), .Y(n706) );
  INVX2 U65 ( .A(n43), .Y(n45) );
  INVX4 U66 ( .A(n108), .Y(n705) );
  INVX1 U67 ( .A(n706), .Y(n43) );
  INVX2 U68 ( .A(n440), .Y(n93) );
  BUFX2 U69 ( .A(n694), .Y(n696) );
  INVX2 U70 ( .A(n455), .Y(n694) );
  INVX2 U71 ( .A(n460), .Y(n710) );
  INVX2 U72 ( .A(n109), .Y(n102) );
  INVX2 U73 ( .A(n125), .Y(n412) );
  INVX2 U74 ( .A(n126), .Y(n415) );
  BUFX2 U75 ( .A(n99), .Y(n37) );
  INVX2 U76 ( .A(n456), .Y(n698) );
  INVX2 U77 ( .A(n459), .Y(n707) );
  INVX2 U78 ( .A(n710), .Y(n712) );
  INVX2 U79 ( .A(n698), .Y(n699) );
  INVX2 U80 ( .A(n43), .Y(n44) );
  INVX4 U81 ( .A(n710), .Y(n711) );
  INVX2 U82 ( .A(n160), .Y(r1_data[2]) );
  INVX2 U83 ( .A(n194), .Y(r1_data[4]) );
  INVX4 U84 ( .A(n415), .Y(n417) );
  INVX4 U85 ( .A(n412), .Y(n414) );
  INVX2 U86 ( .A(n442), .Y(n439) );
  BUFX2 U87 ( .A(n433), .Y(n442) );
  INVX2 U88 ( .A(n245), .Y(r1_data[7]) );
  INVX2 U89 ( .A(n296), .Y(r1_data[10]) );
  INVX2 U90 ( .A(n330), .Y(r1_data[12]) );
  BUFX2 U91 ( .A(n691), .Y(n693) );
  BUFX2 U92 ( .A(n100), .Y(n50) );
  BUFX2 U93 ( .A(n99), .Y(n38) );
  INVX2 U94 ( .A(n695), .Y(n63) );
  INVX2 U95 ( .A(n695), .Y(n62) );
  BUFX2 U96 ( .A(n694), .Y(n695) );
  INVX1 U97 ( .A(n32), .Y(n33) );
  INVX4 U98 ( .A(n727), .Y(n729) );
  INVX4 U99 ( .A(n727), .Y(n728) );
  BUFX4 U100 ( .A(n425), .Y(n428) );
  AND2X1 U101 ( .A(n94), .B(N10), .Y(n31) );
  INVX2 U102 ( .A(n696), .Y(n59) );
  INVX2 U103 ( .A(n696), .Y(n58) );
  INVX4 U104 ( .A(w_data[8]), .Y(n738) );
  INVX4 U105 ( .A(n738), .Y(n739) );
  INVX4 U106 ( .A(n738), .Y(n740) );
  INVX4 U107 ( .A(w_data[11]), .Y(n747) );
  INVX4 U108 ( .A(w_data[14]), .Y(n756) );
  INVX4 U109 ( .A(w_data[12]), .Y(n750) );
  AND2X1 U110 ( .A(N11), .B(N10), .Y(n110) );
  INVX2 U111 ( .A(n701), .Y(n101) );
  BUFX4 U112 ( .A(n101), .Y(n40) );
  INVX4 U113 ( .A(n750), .Y(n752) );
  INVX4 U114 ( .A(n750), .Y(n751) );
  INVX4 U115 ( .A(n747), .Y(n749) );
  INVX4 U116 ( .A(n747), .Y(n748) );
  INVX4 U117 ( .A(n756), .Y(n758) );
  INVX4 U118 ( .A(n756), .Y(n757) );
  INVX8 U119 ( .A(n733), .Y(n734) );
  NAND2X1 U120 ( .A(n688), .B(n687), .Y(n32) );
  NAND2X1 U121 ( .A(n82), .B(n33), .Y(n455) );
  AND2X2 U122 ( .A(n31), .B(n86), .Y(n46) );
  NAND2X1 U123 ( .A(N16), .B(n688), .Y(n34) );
  AND2X2 U124 ( .A(n35), .B(n82), .Y(n701) );
  INVX1 U125 ( .A(n34), .Y(n35) );
  BUFX2 U126 ( .A(n99), .Y(n36) );
  INVX2 U127 ( .A(n75), .Y(n99) );
  BUFX2 U128 ( .A(n100), .Y(n51) );
  BUFX2 U129 ( .A(n100), .Y(n49) );
  INVX2 U130 ( .A(n412), .Y(n413) );
  BUFX2 U131 ( .A(n101), .Y(n39) );
  INVX2 U132 ( .A(n127), .Y(n41) );
  BUFX4 U133 ( .A(n131), .Y(n73) );
  BUFX4 U134 ( .A(n131), .Y(n74) );
  INVX4 U135 ( .A(n143), .Y(r1_data[1]) );
  INVX2 U136 ( .A(n77), .Y(n48) );
  INVX2 U137 ( .A(n75), .Y(n100) );
  INVX2 U138 ( .A(N12), .Y(n81) );
  INVX1 U139 ( .A(n694), .Y(n52) );
  INVX1 U140 ( .A(n694), .Y(n53) );
  INVX1 U141 ( .A(n694), .Y(n54) );
  INVX1 U142 ( .A(n694), .Y(n55) );
  INVX1 U143 ( .A(n694), .Y(n56) );
  INVX1 U144 ( .A(n696), .Y(n57) );
  INVX1 U145 ( .A(n696), .Y(n60) );
  INVX2 U146 ( .A(n696), .Y(n61) );
  INVX1 U147 ( .A(n695), .Y(n64) );
  INVX1 U148 ( .A(n695), .Y(n65) );
  INVX2 U149 ( .A(n695), .Y(n66) );
  INVX1 U150 ( .A(n697), .Y(n67) );
  INVX1 U151 ( .A(n697), .Y(n68) );
  INVX1 U152 ( .A(n697), .Y(n69) );
  INVX1 U153 ( .A(n697), .Y(n70) );
  INVX2 U154 ( .A(n697), .Y(n71) );
  INVX1 U155 ( .A(n455), .Y(n72) );
  BUFX2 U156 ( .A(n694), .Y(n697) );
  INVX2 U157 ( .A(n398), .Y(n131) );
  AND2X2 U158 ( .A(N16), .B(n111), .Y(n75) );
  INVX4 U159 ( .A(n707), .Y(n708) );
  INVX2 U160 ( .A(n415), .Y(n416) );
  INVX1 U161 ( .A(n91), .Y(n76) );
  INVX2 U162 ( .A(n76), .Y(n77) );
  INVX2 U163 ( .A(n418), .Y(n420) );
  INVX1 U164 ( .A(n422), .Y(n78) );
  INVX2 U165 ( .A(n78), .Y(n79) );
  INVX4 U166 ( .A(n408), .Y(n86) );
  INVX4 U167 ( .A(w_data[10]), .Y(n744) );
  BUFX2 U168 ( .A(n425), .Y(n427) );
  INVX4 U169 ( .A(n701), .Y(n704) );
  NAND2X1 U170 ( .A(n81), .B(n110), .Y(n80) );
  INVX4 U171 ( .A(w_data[15]), .Y(n759) );
  INVX4 U172 ( .A(n744), .Y(n746) );
  INVX4 U173 ( .A(n744), .Y(n745) );
  INVX4 U174 ( .A(n759), .Y(n761) );
  INVX4 U175 ( .A(n759), .Y(n760) );
  INVX4 U176 ( .A(n364), .Y(r1_data[14]) );
  BUFX2 U177 ( .A(N15), .Y(n82) );
  INVX2 U178 ( .A(n423), .Y(n424) );
  INVX1 U179 ( .A(n427), .Y(n83) );
  INVX2 U180 ( .A(n85), .Y(n84) );
  INVX2 U181 ( .A(n109), .Y(n104) );
  INVX2 U182 ( .A(N11), .Y(n94) );
  INVX1 U183 ( .A(n413), .Y(n85) );
  INVX4 U184 ( .A(w_data[13]), .Y(n753) );
  INVX2 U185 ( .A(n80), .Y(n440) );
  BUFX2 U186 ( .A(n433), .Y(n441) );
  INVX4 U187 ( .A(n753), .Y(n755) );
  INVX4 U188 ( .A(n753), .Y(n754) );
  BUFX2 U189 ( .A(n425), .Y(n426) );
  INVX1 U190 ( .A(n109), .Y(n421) );
  INVX4 U191 ( .A(n262), .Y(r1_data[8]) );
  INVX1 U192 ( .A(n441), .Y(n87) );
  INVX2 U193 ( .A(n142), .Y(n433) );
  INVX4 U194 ( .A(n347), .Y(r1_data[13]) );
  INVX1 U195 ( .A(n440), .Y(n438) );
  BUFX2 U196 ( .A(n712), .Y(n88) );
  BUFX2 U197 ( .A(N11), .Y(n89) );
  INVX1 U198 ( .A(n93), .Y(n90) );
  INVX1 U199 ( .A(n74), .Y(n423) );
  INVX4 U200 ( .A(N16), .Y(n687) );
  INVX1 U201 ( .A(n90), .Y(n92) );
  INVX8 U202 ( .A(n418), .Y(n419) );
  INVX4 U203 ( .A(n228), .Y(r1_data[6]) );
  INVX2 U204 ( .A(n741), .Y(n95) );
  INVX2 U205 ( .A(n741), .Y(n96) );
  INVX4 U206 ( .A(w_data[9]), .Y(n741) );
  INVX2 U207 ( .A(n735), .Y(n97) );
  INVX2 U208 ( .A(n735), .Y(n98) );
  INVX4 U209 ( .A(w_data[7]), .Y(n735) );
  INVX4 U210 ( .A(w_data[6]), .Y(n733) );
  INVX1 U211 ( .A(n109), .Y(n422) );
  AND2X2 U212 ( .A(n110), .B(n86), .Y(n109) );
  INVX2 U213 ( .A(N17), .Y(n715) );
  INVX2 U214 ( .A(w_data[16]), .Y(n762) );
  MUX2X1 U215 ( .B(n106), .A(n107), .S(n713), .Y(r2_data[14]) );
  NAND2X1 U216 ( .A(n655), .B(n656), .Y(n106) );
  NAND2X1 U217 ( .A(n649), .B(n650), .Y(n107) );
  INVX2 U218 ( .A(w_data[5]), .Y(n730) );
  INVX2 U219 ( .A(w_data[4]), .Y(n727) );
  INVX2 U220 ( .A(w_data[3]), .Y(n724) );
  INVX2 U221 ( .A(w_data[2]), .Y(n721) );
  INVX2 U222 ( .A(w_data[1]), .Y(n718) );
  INVX2 U223 ( .A(w_data[0]), .Y(n716) );
  INVX2 U224 ( .A(n701), .Y(n703) );
  INVX2 U225 ( .A(n701), .Y(n702) );
  AND2X2 U226 ( .A(n111), .B(n687), .Y(n108) );
  INVX2 U227 ( .A(n715), .Y(n714) );
  INVX2 U228 ( .A(n715), .Y(n713) );
  INVX2 U229 ( .A(n762), .Y(n764) );
  INVX2 U230 ( .A(n762), .Y(n763) );
  INVX2 U231 ( .A(n735), .Y(n737) );
  INVX2 U232 ( .A(n741), .Y(n743) );
  INVX2 U233 ( .A(n735), .Y(n736) );
  INVX2 U234 ( .A(n741), .Y(n742) );
  INVX2 U235 ( .A(n730), .Y(n732) );
  INVX2 U236 ( .A(n730), .Y(n731) );
  INVX2 U237 ( .A(n724), .Y(n726) );
  INVX2 U238 ( .A(n721), .Y(n723) );
  INVX2 U239 ( .A(n724), .Y(n725) );
  INVX2 U240 ( .A(n721), .Y(n722) );
  INVX2 U241 ( .A(n718), .Y(n720) );
  INVX2 U242 ( .A(n718), .Y(n719) );
  INVX2 U243 ( .A(n716), .Y(n717) );
  BUFX2 U244 ( .A(n_reset), .Y(n765) );
  BUFX2 U245 ( .A(n_reset), .Y(n766) );
  BUFX2 U246 ( .A(n_reset), .Y(n767) );
  BUFX2 U247 ( .A(n_reset), .Y(n768) );
  BUFX2 U248 ( .A(n_reset), .Y(n769) );
  BUFX2 U249 ( .A(n_reset), .Y(n770) );
  BUFX2 U250 ( .A(n_reset), .Y(n771) );
  BUFX2 U251 ( .A(n_reset), .Y(n772) );
  AOI22X1 U252 ( .A(n115), .B(n114), .C(n113), .D(n112), .Y(n116) );
  INVX2 U253 ( .A(N13), .Y(n117) );
  INVX2 U254 ( .A(n116), .Y(r1_data[16]) );
  AOI22X1 U255 ( .A(n119), .B(n120), .C(n121), .D(n122), .Y(n118) );
  NOR2X1 U256 ( .A(n123), .B(n124), .Y(n122) );
  OAI22X1 U257 ( .A(\regs_matrix[6][0] ), .B(n414), .C(outreg_data[0]), .D(
        n417), .Y(n124) );
  OAI21X1 U258 ( .A(\regs_matrix[4][0] ), .B(n419), .C(n117), .Y(n123) );
  NOR2X1 U259 ( .A(n128), .B(n129), .Y(n121) );
  OAI21X1 U260 ( .A(\regs_matrix[7][0] ), .B(n421), .C(n130), .Y(n129) );
  AOI22X1 U261 ( .A(n74), .B(n132), .C(n440), .D(n133), .Y(n130) );
  INVX2 U262 ( .A(\regs_matrix[3][0] ), .Y(n133) );
  INVX2 U263 ( .A(\regs_matrix[1][0] ), .Y(n132) );
  OAI22X1 U264 ( .A(\regs_matrix[2][0] ), .B(n2), .C(\regs_matrix[5][0] ), .D(
        n47), .Y(n128) );
  NOR2X1 U265 ( .A(n135), .B(n136), .Y(n120) );
  OAI22X1 U266 ( .A(\regs_matrix[14][0] ), .B(n84), .C(\regs_matrix[8][0] ), 
        .D(n416), .Y(n136) );
  OAI21X1 U267 ( .A(\regs_matrix[12][0] ), .B(n420), .C(N13), .Y(n135) );
  NOR2X1 U268 ( .A(n137), .B(n138), .Y(n119) );
  OAI21X1 U269 ( .A(\regs_matrix[15][0] ), .B(n79), .C(n139), .Y(n138) );
  AOI22X1 U270 ( .A(n424), .B(n140), .C(n90), .D(n141), .Y(n139) );
  INVX2 U271 ( .A(\regs_matrix[11][0] ), .Y(n141) );
  INVX2 U272 ( .A(\regs_matrix[9][0] ), .Y(n140) );
  OAI22X1 U273 ( .A(\regs_matrix[10][0] ), .B(n77), .C(\regs_matrix[13][0] ), 
        .D(n432), .Y(n137) );
  AOI22X1 U274 ( .A(n144), .B(n145), .C(n146), .D(n147), .Y(n143) );
  NOR2X1 U275 ( .A(n148), .B(n149), .Y(n147) );
  OAI22X1 U276 ( .A(outreg_data[1]), .B(n417), .C(\regs_matrix[2][1] ), .D(n2), 
        .Y(n149) );
  OAI22X1 U277 ( .A(\regs_matrix[4][1] ), .B(n42), .C(\regs_matrix[6][1] ), 
        .D(n414), .Y(n148) );
  NOR2X1 U278 ( .A(n151), .B(n150), .Y(n146) );
  OAI21X1 U279 ( .A(\regs_matrix[3][1] ), .B(n93), .C(n152), .Y(n151) );
  AOI21X1 U280 ( .A(n73), .B(n153), .C(N13), .Y(n152) );
  INVX2 U281 ( .A(\regs_matrix[1][1] ), .Y(n153) );
  OAI22X1 U282 ( .A(\regs_matrix[5][1] ), .B(n47), .C(\regs_matrix[7][1] ), 
        .D(n102), .Y(n150) );
  NOR2X1 U283 ( .A(n154), .B(n155), .Y(n145) );
  OAI22X1 U284 ( .A(\regs_matrix[8][1] ), .B(n416), .C(\regs_matrix[10][1] ), 
        .D(n77), .Y(n155) );
  OAI22X1 U285 ( .A(\regs_matrix[12][1] ), .B(n420), .C(\regs_matrix[14][1] ), 
        .D(n84), .Y(n154) );
  NOR2X1 U286 ( .A(n156), .B(n157), .Y(n144) );
  OAI21X1 U287 ( .A(\regs_matrix[11][1] ), .B(n92), .C(n158), .Y(n157) );
  AOI21X1 U288 ( .A(n424), .B(n159), .C(n117), .Y(n158) );
  INVX2 U289 ( .A(\regs_matrix[9][1] ), .Y(n159) );
  OAI22X1 U290 ( .A(\regs_matrix[13][1] ), .B(n432), .C(\regs_matrix[15][1] ), 
        .D(n79), .Y(n156) );
  AOI22X1 U291 ( .A(n161), .B(n162), .C(n163), .D(n164), .Y(n160) );
  NOR2X1 U292 ( .A(n165), .B(n166), .Y(n164) );
  OAI22X1 U293 ( .A(outreg_data[2]), .B(n417), .C(\regs_matrix[2][2] ), .D(n2), 
        .Y(n166) );
  OAI22X1 U294 ( .A(\regs_matrix[4][2] ), .B(n42), .C(\regs_matrix[6][2] ), 
        .D(n414), .Y(n165) );
  NOR2X1 U295 ( .A(n167), .B(n168), .Y(n163) );
  OAI21X1 U296 ( .A(\regs_matrix[3][2] ), .B(n93), .C(n169), .Y(n168) );
  AOI21X1 U297 ( .A(n73), .B(n170), .C(N13), .Y(n169) );
  INVX2 U298 ( .A(\regs_matrix[1][2] ), .Y(n170) );
  OAI22X1 U299 ( .A(\regs_matrix[5][2] ), .B(n47), .C(\regs_matrix[7][2] ), 
        .D(n102), .Y(n167) );
  NOR2X1 U300 ( .A(n171), .B(n172), .Y(n162) );
  OAI22X1 U301 ( .A(\regs_matrix[8][2] ), .B(n416), .C(\regs_matrix[10][2] ), 
        .D(n77), .Y(n172) );
  OAI22X1 U302 ( .A(\regs_matrix[12][2] ), .B(n420), .C(\regs_matrix[14][2] ), 
        .D(n84), .Y(n171) );
  NOR2X1 U303 ( .A(n173), .B(n174), .Y(n161) );
  OAI21X1 U304 ( .A(\regs_matrix[11][2] ), .B(n92), .C(n175), .Y(n174) );
  AOI21X1 U305 ( .A(n424), .B(n176), .C(n117), .Y(n175) );
  INVX2 U306 ( .A(\regs_matrix[9][2] ), .Y(n176) );
  OAI22X1 U307 ( .A(\regs_matrix[13][2] ), .B(n432), .C(\regs_matrix[15][2] ), 
        .D(n79), .Y(n173) );
  AOI22X1 U308 ( .A(n178), .B(n179), .C(n180), .D(n181), .Y(n177) );
  NOR2X1 U309 ( .A(n182), .B(n183), .Y(n181) );
  OAI22X1 U310 ( .A(outreg_data[3]), .B(n417), .C(\regs_matrix[2][3] ), .D(n91), .Y(n183) );
  OAI22X1 U311 ( .A(\regs_matrix[4][3] ), .B(n419), .C(\regs_matrix[6][3] ), 
        .D(n413), .Y(n182) );
  NOR2X1 U312 ( .A(n184), .B(n185), .Y(n180) );
  OAI21X1 U313 ( .A(\regs_matrix[3][3] ), .B(n87), .C(n186), .Y(n185) );
  AOI21X1 U314 ( .A(n73), .B(n187), .C(N13), .Y(n186) );
  INVX2 U315 ( .A(\regs_matrix[1][3] ), .Y(n187) );
  OAI22X1 U316 ( .A(\regs_matrix[5][3] ), .B(n47), .C(\regs_matrix[7][3] ), 
        .D(n422), .Y(n184) );
  NOR2X1 U317 ( .A(n188), .B(n189), .Y(n179) );
  OAI22X1 U318 ( .A(\regs_matrix[8][3] ), .B(n416), .C(\regs_matrix[10][3] ), 
        .D(n77), .Y(n189) );
  OAI22X1 U319 ( .A(\regs_matrix[12][3] ), .B(n420), .C(\regs_matrix[14][3] ), 
        .D(n84), .Y(n188) );
  NOR2X1 U320 ( .A(n190), .B(n191), .Y(n178) );
  OAI21X1 U321 ( .A(\regs_matrix[11][3] ), .B(n92), .C(n192), .Y(n191) );
  AOI21X1 U322 ( .A(n424), .B(n193), .C(n117), .Y(n192) );
  INVX2 U323 ( .A(\regs_matrix[9][3] ), .Y(n193) );
  OAI22X1 U324 ( .A(\regs_matrix[13][3] ), .B(n432), .C(\regs_matrix[15][3] ), 
        .D(n79), .Y(n190) );
  AOI22X1 U325 ( .A(n195), .B(n196), .C(n197), .D(n198), .Y(n194) );
  NOR2X1 U326 ( .A(n199), .B(n200), .Y(n198) );
  OAI22X1 U327 ( .A(outreg_data[4]), .B(n417), .C(\regs_matrix[2][4] ), .D(
        n429), .Y(n200) );
  OAI22X1 U328 ( .A(\regs_matrix[4][4] ), .B(n419), .C(\regs_matrix[6][4] ), 
        .D(n414), .Y(n199) );
  NOR2X1 U329 ( .A(n201), .B(n202), .Y(n197) );
  OAI21X1 U330 ( .A(\regs_matrix[3][4] ), .B(n439), .C(n203), .Y(n202) );
  AOI21X1 U331 ( .A(n73), .B(n204), .C(N13), .Y(n203) );
  INVX2 U332 ( .A(\regs_matrix[1][4] ), .Y(n204) );
  OAI22X1 U333 ( .A(\regs_matrix[5][4] ), .B(n47), .C(\regs_matrix[7][4] ), 
        .D(n422), .Y(n201) );
  NOR2X1 U334 ( .A(n205), .B(n206), .Y(n196) );
  OAI22X1 U335 ( .A(\regs_matrix[8][4] ), .B(n416), .C(\regs_matrix[10][4] ), 
        .D(n77), .Y(n206) );
  OAI22X1 U336 ( .A(\regs_matrix[12][4] ), .B(n420), .C(\regs_matrix[14][4] ), 
        .D(n84), .Y(n205) );
  NOR2X1 U337 ( .A(n207), .B(n208), .Y(n195) );
  OAI21X1 U338 ( .A(\regs_matrix[11][4] ), .B(n92), .C(n209), .Y(n208) );
  AOI21X1 U339 ( .A(n424), .B(n210), .C(n117), .Y(n209) );
  INVX2 U340 ( .A(\regs_matrix[9][4] ), .Y(n210) );
  OAI22X1 U341 ( .A(\regs_matrix[13][4] ), .B(n432), .C(\regs_matrix[15][4] ), 
        .D(n79), .Y(n207) );
  AOI22X1 U342 ( .A(n212), .B(n213), .C(n214), .D(n215), .Y(n211) );
  NOR2X1 U343 ( .A(n216), .B(n217), .Y(n215) );
  OAI22X1 U344 ( .A(outreg_data[5]), .B(n417), .C(\regs_matrix[2][5] ), .D(n83), .Y(n217) );
  OAI22X1 U345 ( .A(\regs_matrix[4][5] ), .B(n419), .C(\regs_matrix[6][5] ), 
        .D(n413), .Y(n216) );
  NOR2X1 U346 ( .A(n218), .B(n219), .Y(n214) );
  OAI21X1 U347 ( .A(\regs_matrix[3][5] ), .B(n439), .C(n220), .Y(n219) );
  AOI21X1 U348 ( .A(n73), .B(n221), .C(N13), .Y(n220) );
  INVX2 U349 ( .A(\regs_matrix[1][5] ), .Y(n221) );
  OAI22X1 U350 ( .A(\regs_matrix[5][5] ), .B(n47), .C(\regs_matrix[7][5] ), 
        .D(n104), .Y(n218) );
  NOR2X1 U351 ( .A(n222), .B(n223), .Y(n213) );
  OAI22X1 U352 ( .A(\regs_matrix[8][5] ), .B(n416), .C(\regs_matrix[10][5] ), 
        .D(n77), .Y(n223) );
  OAI22X1 U353 ( .A(\regs_matrix[12][5] ), .B(n420), .C(\regs_matrix[14][5] ), 
        .D(n84), .Y(n222) );
  NOR2X1 U354 ( .A(n224), .B(n225), .Y(n212) );
  OAI21X1 U355 ( .A(\regs_matrix[11][5] ), .B(n92), .C(n226), .Y(n225) );
  AOI21X1 U356 ( .A(n424), .B(n227), .C(n117), .Y(n226) );
  INVX2 U357 ( .A(\regs_matrix[9][5] ), .Y(n227) );
  OAI22X1 U358 ( .A(\regs_matrix[13][5] ), .B(n432), .C(\regs_matrix[15][5] ), 
        .D(n79), .Y(n224) );
  AOI22X1 U359 ( .A(n229), .B(n230), .C(n231), .D(n232), .Y(n228) );
  NOR2X1 U360 ( .A(n233), .B(n234), .Y(n232) );
  OAI22X1 U361 ( .A(outreg_data[6]), .B(n417), .C(\regs_matrix[2][6] ), .D(
        n430), .Y(n234) );
  OAI22X1 U362 ( .A(\regs_matrix[4][6] ), .B(n419), .C(\regs_matrix[6][6] ), 
        .D(n414), .Y(n233) );
  NOR2X1 U363 ( .A(n235), .B(n236), .Y(n231) );
  OAI21X1 U364 ( .A(\regs_matrix[3][6] ), .B(n439), .C(n237), .Y(n236) );
  AOI21X1 U365 ( .A(n74), .B(n238), .C(N13), .Y(n237) );
  INVX2 U366 ( .A(\regs_matrix[1][6] ), .Y(n238) );
  OAI22X1 U367 ( .A(\regs_matrix[5][6] ), .B(n47), .C(\regs_matrix[7][6] ), 
        .D(n104), .Y(n235) );
  NOR2X1 U368 ( .A(n239), .B(n240), .Y(n230) );
  OAI22X1 U369 ( .A(\regs_matrix[8][6] ), .B(n416), .C(\regs_matrix[10][6] ), 
        .D(n77), .Y(n240) );
  OAI22X1 U370 ( .A(\regs_matrix[12][6] ), .B(n420), .C(\regs_matrix[14][6] ), 
        .D(n84), .Y(n239) );
  NOR2X1 U371 ( .A(n241), .B(n242), .Y(n229) );
  OAI21X1 U372 ( .A(\regs_matrix[11][6] ), .B(n92), .C(n243), .Y(n242) );
  AOI21X1 U373 ( .A(n424), .B(n244), .C(n117), .Y(n243) );
  INVX2 U374 ( .A(\regs_matrix[9][6] ), .Y(n244) );
  OAI22X1 U375 ( .A(\regs_matrix[13][6] ), .B(n432), .C(\regs_matrix[15][6] ), 
        .D(n79), .Y(n241) );
  AOI22X1 U376 ( .A(n246), .B(n247), .C(n248), .D(n249), .Y(n245) );
  NOR2X1 U377 ( .A(n250), .B(n251), .Y(n249) );
  OAI22X1 U378 ( .A(outreg_data[7]), .B(n417), .C(n429), .D(
        \regs_matrix[2][7] ), .Y(n251) );
  OAI22X1 U379 ( .A(\regs_matrix[4][7] ), .B(n419), .C(\regs_matrix[6][7] ), 
        .D(n413), .Y(n250) );
  NOR2X1 U380 ( .A(n252), .B(n253), .Y(n248) );
  AOI21X1 U381 ( .A(n74), .B(n255), .C(N13), .Y(n254) );
  INVX2 U382 ( .A(\regs_matrix[1][7] ), .Y(n255) );
  OAI22X1 U383 ( .A(\regs_matrix[5][7] ), .B(n47), .C(n421), .D(
        \regs_matrix[7][7] ), .Y(n252) );
  NOR2X1 U384 ( .A(n256), .B(n257), .Y(n247) );
  OAI22X1 U385 ( .A(\regs_matrix[8][7] ), .B(n416), .C(\regs_matrix[10][7] ), 
        .D(n77), .Y(n257) );
  OAI22X1 U386 ( .A(\regs_matrix[12][7] ), .B(n420), .C(\regs_matrix[14][7] ), 
        .D(n84), .Y(n256) );
  NOR2X1 U387 ( .A(n258), .B(n259), .Y(n246) );
  OAI21X1 U388 ( .A(\regs_matrix[11][7] ), .B(n93), .C(n260), .Y(n259) );
  AOI21X1 U389 ( .A(n424), .B(n261), .C(n117), .Y(n260) );
  INVX2 U390 ( .A(\regs_matrix[9][7] ), .Y(n261) );
  OAI22X1 U391 ( .A(\regs_matrix[13][7] ), .B(n432), .C(\regs_matrix[15][7] ), 
        .D(n79), .Y(n258) );
  AOI22X1 U392 ( .A(n263), .B(n264), .C(n265), .D(n266), .Y(n262) );
  NOR2X1 U393 ( .A(n267), .B(n268), .Y(n266) );
  OAI22X1 U394 ( .A(outreg_data[8]), .B(n417), .C(\regs_matrix[2][8] ), .D(n91), .Y(n268) );
  OAI22X1 U395 ( .A(\regs_matrix[4][8] ), .B(n419), .C(\regs_matrix[6][8] ), 
        .D(n414), .Y(n267) );
  NOR2X1 U396 ( .A(n269), .B(n270), .Y(n265) );
  OAI21X1 U397 ( .A(\regs_matrix[3][8] ), .B(n439), .C(n271), .Y(n270) );
  AOI21X1 U398 ( .A(n74), .B(n272), .C(N13), .Y(n271) );
  INVX2 U399 ( .A(\regs_matrix[1][8] ), .Y(n272) );
  OAI22X1 U400 ( .A(\regs_matrix[5][8] ), .B(n47), .C(\regs_matrix[7][8] ), 
        .D(n104), .Y(n269) );
  NOR2X1 U401 ( .A(n273), .B(n274), .Y(n264) );
  OAI22X1 U402 ( .A(\regs_matrix[8][8] ), .B(n416), .C(\regs_matrix[10][8] ), 
        .D(n77), .Y(n274) );
  OAI22X1 U403 ( .A(\regs_matrix[12][8] ), .B(n420), .C(\regs_matrix[14][8] ), 
        .D(n84), .Y(n273) );
  NOR2X1 U404 ( .A(n275), .B(n276), .Y(n263) );
  OAI21X1 U405 ( .A(\regs_matrix[11][8] ), .B(n92), .C(n277), .Y(n276) );
  AOI21X1 U406 ( .A(n424), .B(n278), .C(n117), .Y(n277) );
  INVX2 U407 ( .A(\regs_matrix[9][8] ), .Y(n278) );
  OAI22X1 U408 ( .A(\regs_matrix[13][8] ), .B(n432), .C(\regs_matrix[15][8] ), 
        .D(n79), .Y(n275) );
  AOI22X1 U409 ( .A(n280), .B(n281), .C(n282), .D(n283), .Y(n279) );
  NOR2X1 U410 ( .A(n284), .B(n285), .Y(n283) );
  OAI22X1 U411 ( .A(outreg_data[9]), .B(n417), .C(\regs_matrix[2][9] ), .D(
        n430), .Y(n285) );
  OAI22X1 U412 ( .A(\regs_matrix[4][9] ), .B(n419), .C(\regs_matrix[6][9] ), 
        .D(n413), .Y(n284) );
  NOR2X1 U413 ( .A(n287), .B(n286), .Y(n282) );
  OAI21X1 U414 ( .A(\regs_matrix[3][9] ), .B(n93), .C(n288), .Y(n287) );
  AOI21X1 U415 ( .A(n73), .B(n289), .C(N13), .Y(n288) );
  INVX2 U416 ( .A(\regs_matrix[1][9] ), .Y(n289) );
  OAI22X1 U417 ( .A(\regs_matrix[5][9] ), .B(n47), .C(\regs_matrix[7][9] ), 
        .D(n104), .Y(n286) );
  NOR2X1 U418 ( .A(n290), .B(n291), .Y(n281) );
  OAI22X1 U419 ( .A(\regs_matrix[8][9] ), .B(n416), .C(\regs_matrix[10][9] ), 
        .D(n77), .Y(n291) );
  OAI22X1 U420 ( .A(\regs_matrix[12][9] ), .B(n420), .C(\regs_matrix[14][9] ), 
        .D(n84), .Y(n290) );
  NOR2X1 U421 ( .A(n292), .B(n293), .Y(n280) );
  OAI21X1 U422 ( .A(\regs_matrix[11][9] ), .B(n438), .C(n294), .Y(n293) );
  AOI21X1 U423 ( .A(n424), .B(n295), .C(n117), .Y(n294) );
  INVX2 U424 ( .A(\regs_matrix[9][9] ), .Y(n295) );
  OAI22X1 U425 ( .A(\regs_matrix[13][9] ), .B(n432), .C(\regs_matrix[15][9] ), 
        .D(n79), .Y(n292) );
  AOI22X1 U426 ( .A(n297), .B(n298), .C(n299), .D(n300), .Y(n296) );
  NOR2X1 U427 ( .A(n301), .B(n302), .Y(n300) );
  OAI22X1 U428 ( .A(outreg_data[10]), .B(n417), .C(\regs_matrix[2][10] ), .D(
        n91), .Y(n302) );
  OAI22X1 U429 ( .A(\regs_matrix[4][10] ), .B(n419), .C(\regs_matrix[6][10] ), 
        .D(n414), .Y(n301) );
  NOR2X1 U430 ( .A(n304), .B(n303), .Y(n299) );
  OAI21X1 U431 ( .A(\regs_matrix[3][10] ), .B(n439), .C(n305), .Y(n304) );
  AOI21X1 U432 ( .A(n74), .B(n306), .C(N13), .Y(n305) );
  INVX2 U433 ( .A(\regs_matrix[1][10] ), .Y(n306) );
  OAI22X1 U434 ( .A(\regs_matrix[5][10] ), .B(n47), .C(\regs_matrix[7][10] ), 
        .D(n104), .Y(n303) );
  NOR2X1 U435 ( .A(n307), .B(n308), .Y(n298) );
  OAI22X1 U436 ( .A(\regs_matrix[8][10] ), .B(n416), .C(\regs_matrix[10][10] ), 
        .D(n77), .Y(n308) );
  OAI22X1 U437 ( .A(\regs_matrix[12][10] ), .B(n420), .C(\regs_matrix[14][10] ), .D(n84), .Y(n307) );
  NOR2X1 U438 ( .A(n309), .B(n310), .Y(n297) );
  OAI21X1 U439 ( .A(\regs_matrix[11][10] ), .B(n92), .C(n311), .Y(n310) );
  AOI21X1 U440 ( .A(n424), .B(n312), .C(n117), .Y(n311) );
  INVX2 U441 ( .A(\regs_matrix[9][10] ), .Y(n312) );
  OAI22X1 U442 ( .A(\regs_matrix[13][10] ), .B(n432), .C(\regs_matrix[15][10] ), .D(n79), .Y(n309) );
  AOI22X1 U443 ( .A(n314), .B(n315), .C(n316), .D(n317), .Y(n313) );
  NOR2X1 U444 ( .A(n318), .B(n319), .Y(n317) );
  OAI22X1 U445 ( .A(outreg_data[11]), .B(n417), .C(\regs_matrix[2][11] ), .D(
        n429), .Y(n319) );
  OAI22X1 U446 ( .A(\regs_matrix[4][11] ), .B(n419), .C(\regs_matrix[6][11] ), 
        .D(n414), .Y(n318) );
  NOR2X1 U447 ( .A(n320), .B(n321), .Y(n316) );
  OAI21X1 U448 ( .A(\regs_matrix[3][11] ), .B(n439), .C(n322), .Y(n321) );
  AOI21X1 U449 ( .A(n74), .B(n323), .C(N13), .Y(n322) );
  INVX2 U450 ( .A(\regs_matrix[1][11] ), .Y(n323) );
  OAI22X1 U451 ( .A(\regs_matrix[5][11] ), .B(n47), .C(\regs_matrix[7][11] ), 
        .D(n104), .Y(n320) );
  NOR2X1 U452 ( .A(n324), .B(n325), .Y(n315) );
  OAI22X1 U453 ( .A(\regs_matrix[8][11] ), .B(n416), .C(\regs_matrix[10][11] ), 
        .D(n77), .Y(n325) );
  OAI22X1 U454 ( .A(\regs_matrix[12][11] ), .B(n420), .C(\regs_matrix[14][11] ), .D(n84), .Y(n324) );
  NOR2X1 U455 ( .A(n326), .B(n327), .Y(n314) );
  OAI21X1 U456 ( .A(\regs_matrix[11][11] ), .B(n93), .C(n328), .Y(n327) );
  AOI21X1 U457 ( .A(n424), .B(n329), .C(n117), .Y(n328) );
  INVX2 U458 ( .A(\regs_matrix[9][11] ), .Y(n329) );
  OAI22X1 U459 ( .A(\regs_matrix[13][11] ), .B(n432), .C(\regs_matrix[15][11] ), .D(n79), .Y(n326) );
  AOI22X1 U460 ( .A(n331), .B(n332), .C(n333), .D(n334), .Y(n330) );
  NOR2X1 U461 ( .A(n335), .B(n336), .Y(n334) );
  OAI22X1 U462 ( .A(outreg_data[12]), .B(n417), .C(\regs_matrix[2][12] ), .D(
        n430), .Y(n336) );
  OAI22X1 U463 ( .A(\regs_matrix[4][12] ), .B(n42), .C(\regs_matrix[6][12] ), 
        .D(n414), .Y(n335) );
  NOR2X1 U464 ( .A(n337), .B(n338), .Y(n333) );
  OAI21X1 U465 ( .A(\regs_matrix[3][12] ), .B(n438), .C(n339), .Y(n338) );
  AOI21X1 U466 ( .A(n131), .B(n340), .C(N13), .Y(n339) );
  INVX2 U467 ( .A(\regs_matrix[1][12] ), .Y(n340) );
  OAI22X1 U468 ( .A(\regs_matrix[5][12] ), .B(n47), .C(\regs_matrix[7][12] ), 
        .D(n104), .Y(n337) );
  NOR2X1 U469 ( .A(n341), .B(n342), .Y(n332) );
  OAI22X1 U470 ( .A(\regs_matrix[8][12] ), .B(n416), .C(\regs_matrix[10][12] ), 
        .D(n77), .Y(n342) );
  OAI22X1 U471 ( .A(\regs_matrix[12][12] ), .B(n420), .C(\regs_matrix[14][12] ), .D(n84), .Y(n341) );
  NOR2X1 U472 ( .A(n343), .B(n344), .Y(n331) );
  OAI21X1 U473 ( .A(\regs_matrix[11][12] ), .B(n438), .C(n345), .Y(n344) );
  AOI21X1 U474 ( .A(n424), .B(n346), .C(n117), .Y(n345) );
  INVX2 U475 ( .A(\regs_matrix[9][12] ), .Y(n346) );
  OAI22X1 U476 ( .A(\regs_matrix[13][12] ), .B(n432), .C(\regs_matrix[15][12] ), .D(n79), .Y(n343) );
  AOI22X1 U477 ( .A(n348), .B(n349), .C(n350), .D(n351), .Y(n347) );
  NOR2X1 U478 ( .A(n352), .B(n353), .Y(n351) );
  OAI22X1 U479 ( .A(outreg_data[13]), .B(n417), .C(\regs_matrix[2][13] ), .D(
        n429), .Y(n353) );
  OAI22X1 U480 ( .A(\regs_matrix[4][13] ), .B(n419), .C(\regs_matrix[6][13] ), 
        .D(n414), .Y(n352) );
  NOR2X1 U481 ( .A(n354), .B(n355), .Y(n350) );
  AOI21X1 U482 ( .A(n74), .B(n357), .C(N13), .Y(n356) );
  INVX2 U483 ( .A(\regs_matrix[1][13] ), .Y(n357) );
  OAI22X1 U484 ( .A(\regs_matrix[5][13] ), .B(n47), .C(\regs_matrix[7][13] ), 
        .D(n102), .Y(n354) );
  NOR2X1 U485 ( .A(n358), .B(n359), .Y(n349) );
  OAI22X1 U486 ( .A(\regs_matrix[8][13] ), .B(n416), .C(\regs_matrix[10][13] ), 
        .D(n77), .Y(n359) );
  OAI22X1 U487 ( .A(\regs_matrix[12][13] ), .B(n420), .C(\regs_matrix[14][13] ), .D(n84), .Y(n358) );
  NOR2X1 U488 ( .A(n360), .B(n361), .Y(n348) );
  OAI21X1 U489 ( .A(\regs_matrix[11][13] ), .B(n92), .C(n362), .Y(n361) );
  AOI21X1 U490 ( .A(n424), .B(n363), .C(n117), .Y(n362) );
  INVX2 U491 ( .A(\regs_matrix[9][13] ), .Y(n363) );
  OAI22X1 U492 ( .A(\regs_matrix[13][13] ), .B(n432), .C(\regs_matrix[15][13] ), .D(n79), .Y(n360) );
  AOI22X1 U493 ( .A(n365), .B(n366), .C(n367), .D(n368), .Y(n364) );
  NOR2X1 U494 ( .A(n369), .B(n370), .Y(n368) );
  OAI22X1 U495 ( .A(outreg_data[14]), .B(n417), .C(\regs_matrix[2][14] ), .D(
        n429), .Y(n370) );
  OAI22X1 U496 ( .A(\regs_matrix[4][14] ), .B(n419), .C(\regs_matrix[6][14] ), 
        .D(n414), .Y(n369) );
  NOR2X1 U497 ( .A(n371), .B(n372), .Y(n367) );
  OAI21X1 U498 ( .A(\regs_matrix[3][14] ), .B(n93), .C(n373), .Y(n372) );
  AOI21X1 U499 ( .A(n73), .B(n374), .C(N13), .Y(n373) );
  INVX2 U500 ( .A(\regs_matrix[1][14] ), .Y(n374) );
  OAI22X1 U501 ( .A(\regs_matrix[5][14] ), .B(n47), .C(\regs_matrix[7][14] ), 
        .D(n102), .Y(n371) );
  NOR2X1 U502 ( .A(n375), .B(n376), .Y(n366) );
  OAI22X1 U503 ( .A(\regs_matrix[8][14] ), .B(n416), .C(\regs_matrix[10][14] ), 
        .D(n77), .Y(n376) );
  OAI22X1 U504 ( .A(\regs_matrix[12][14] ), .B(n420), .C(\regs_matrix[14][14] ), .D(n84), .Y(n375) );
  NOR2X1 U505 ( .A(n377), .B(n378), .Y(n365) );
  OAI21X1 U506 ( .A(\regs_matrix[11][14] ), .B(n93), .C(n379), .Y(n378) );
  AOI21X1 U507 ( .A(n424), .B(n380), .C(n117), .Y(n379) );
  INVX2 U508 ( .A(\regs_matrix[9][14] ), .Y(n380) );
  OAI22X1 U509 ( .A(\regs_matrix[13][14] ), .B(n432), .C(\regs_matrix[15][14] ), .D(n79), .Y(n377) );
  AOI22X1 U510 ( .A(n382), .B(n383), .C(n384), .D(n385), .Y(n381) );
  NOR2X1 U511 ( .A(n386), .B(n387), .Y(n385) );
  OAI22X1 U512 ( .A(outreg_data[15]), .B(n417), .C(\regs_matrix[2][15] ), .D(
        n429), .Y(n387) );
  OAI22X1 U513 ( .A(\regs_matrix[4][15] ), .B(n419), .C(\regs_matrix[6][15] ), 
        .D(n413), .Y(n386) );
  NOR2X1 U514 ( .A(n388), .B(n389), .Y(n384) );
  OAI21X1 U515 ( .A(\regs_matrix[3][15] ), .B(n439), .C(n390), .Y(n389) );
  AOI21X1 U516 ( .A(n74), .B(n391), .C(N13), .Y(n390) );
  INVX2 U517 ( .A(\regs_matrix[1][15] ), .Y(n391) );
  OAI22X1 U518 ( .A(\regs_matrix[5][15] ), .B(n47), .C(\regs_matrix[7][15] ), 
        .D(n102), .Y(n388) );
  NOR2X1 U519 ( .A(n392), .B(n393), .Y(n383) );
  OAI22X1 U520 ( .A(\regs_matrix[8][15] ), .B(n416), .C(\regs_matrix[10][15] ), 
        .D(n77), .Y(n393) );
  OAI22X1 U521 ( .A(\regs_matrix[12][15] ), .B(n420), .C(\regs_matrix[14][15] ), .D(n84), .Y(n392) );
  NOR2X1 U522 ( .A(n394), .B(n395), .Y(n382) );
  OAI21X1 U523 ( .A(\regs_matrix[11][15] ), .B(n92), .C(n396), .Y(n395) );
  AOI21X1 U524 ( .A(n424), .B(n397), .C(n117), .Y(n396) );
  INVX2 U525 ( .A(\regs_matrix[9][15] ), .Y(n397) );
  OAI22X1 U526 ( .A(\regs_matrix[13][15] ), .B(n432), .C(\regs_matrix[15][15] ), .D(n79), .Y(n394) );
  NOR2X1 U527 ( .A(n399), .B(n400), .Y(n112) );
  OAI21X1 U528 ( .A(outreg_data[16]), .B(n416), .C(n401), .Y(n400) );
  AOI21X1 U529 ( .A(n48), .B(n402), .C(N13), .Y(n401) );
  INVX2 U530 ( .A(\regs_matrix[2][16] ), .Y(n402) );
  OAI22X1 U531 ( .A(\regs_matrix[4][16] ), .B(n420), .C(\regs_matrix[6][16] ), 
        .D(n84), .Y(n399) );
  NOR2X1 U532 ( .A(n403), .B(n404), .Y(n113) );
  OAI22X1 U533 ( .A(\regs_matrix[3][16] ), .B(n92), .C(\regs_matrix[1][16] ), 
        .D(n423), .Y(n404) );
  OAI22X1 U534 ( .A(\regs_matrix[5][16] ), .B(n103), .C(\regs_matrix[7][16] ), 
        .D(n79), .Y(n403) );
  NOR3X1 U535 ( .A(n405), .B(n406), .C(n407), .Y(n114) );
  OAI22X1 U536 ( .A(\regs_matrix[10][16] ), .B(n77), .C(\regs_matrix[8][16] ), 
        .D(n416), .Y(n407) );
  NAND3X1 U537 ( .A(n94), .B(n409), .C(n81), .Y(n126) );
  NAND3X1 U538 ( .A(n408), .B(n89), .C(n409), .Y(n134) );
  NOR2X1 U539 ( .A(\regs_matrix[12][16] ), .B(n420), .Y(n406) );
  NAND3X1 U540 ( .A(n94), .B(n86), .C(n409), .Y(n127) );
  OAI22X1 U541 ( .A(\regs_matrix[9][16] ), .B(n423), .C(\regs_matrix[14][16] ), 
        .D(n84), .Y(n405) );
  NAND3X1 U542 ( .A(n86), .B(n409), .C(n89), .Y(n125) );
  INVX2 U543 ( .A(N10), .Y(n409) );
  NAND3X1 U544 ( .A(N10), .B(n94), .C(n408), .Y(n398) );
  NOR2X1 U545 ( .A(n410), .B(n411), .Y(n115) );
  OAI21X1 U546 ( .A(\regs_matrix[11][16] ), .B(n92), .C(N13), .Y(n411) );
  NAND2X1 U547 ( .A(n81), .B(n110), .Y(n142) );
  OAI22X1 U548 ( .A(\regs_matrix[15][16] ), .B(n79), .C(\regs_matrix[13][16] ), 
        .D(n432), .Y(n410) );
  INVX4 U549 ( .A(N12), .Y(n408) );
  INVX2 U550 ( .A(\regs_matrix[3][13] ), .Y(n435) );
  NAND2X1 U551 ( .A(n434), .B(n356), .Y(n355) );
  NAND2X1 U552 ( .A(n435), .B(n441), .Y(n434) );
  INVX2 U553 ( .A(\regs_matrix[3][7] ), .Y(n437) );
  NAND2X1 U554 ( .A(n436), .B(n254), .Y(n253) );
  NAND2X1 U555 ( .A(n437), .B(n440), .Y(n436) );
  INVX2 U556 ( .A(n2), .Y(n425) );
  INVX4 U557 ( .A(n118), .Y(r1_data[0]) );
  INVX4 U558 ( .A(n313), .Y(r1_data[11]) );
  INVX4 U559 ( .A(n381), .Y(r1_data[15]) );
  INVX4 U560 ( .A(n42), .Y(n418) );
  AOI22X1 U561 ( .A(n446), .B(n445), .C(n444), .D(n443), .Y(n447) );
  INVX2 U562 ( .A(n447), .Y(r2_data[16]) );
  MUX2X1 U563 ( .B(n448), .A(n449), .S(n713), .Y(r2_data[0]) );
  NAND2X1 U564 ( .A(n450), .B(n451), .Y(n449) );
  NOR2X1 U565 ( .A(n452), .B(n453), .Y(n451) );
  OAI22X1 U566 ( .A(\regs_matrix[8][0] ), .B(n3), .C(\regs_matrix[10][0] ), 
        .D(n53), .Y(n453) );
  OAI22X1 U567 ( .A(\regs_matrix[12][0] ), .B(n699), .C(\regs_matrix[14][0] ), 
        .D(n704), .Y(n452) );
  NOR2X1 U568 ( .A(n457), .B(n458), .Y(n450) );
  OAI22X1 U569 ( .A(\regs_matrix[11][0] ), .B(n705), .C(\regs_matrix[9][0] ), 
        .D(n709), .Y(n458) );
  OAI22X1 U570 ( .A(\regs_matrix[13][0] ), .B(n711), .C(\regs_matrix[15][0] ), 
        .D(n49), .Y(n457) );
  NAND2X1 U571 ( .A(n462), .B(n461), .Y(n448) );
  NOR2X1 U572 ( .A(n463), .B(n464), .Y(n462) );
  OAI22X1 U573 ( .A(outreg_data[0]), .B(n19), .C(\regs_matrix[2][0] ), .D(n54), 
        .Y(n464) );
  OAI22X1 U574 ( .A(\regs_matrix[4][0] ), .B(n699), .C(\regs_matrix[6][0] ), 
        .D(n704), .Y(n463) );
  NOR2X1 U575 ( .A(n465), .B(n466), .Y(n461) );
  OAI22X1 U576 ( .A(\regs_matrix[3][0] ), .B(n705), .C(\regs_matrix[1][0] ), 
        .D(n709), .Y(n466) );
  OAI22X1 U577 ( .A(\regs_matrix[5][0] ), .B(n711), .C(\regs_matrix[7][0] ), 
        .D(n36), .Y(n465) );
  MUX2X1 U578 ( .B(n467), .A(n468), .S(n714), .Y(r2_data[1]) );
  NAND2X1 U579 ( .A(n470), .B(n469), .Y(n468) );
  NOR2X1 U580 ( .A(n471), .B(n472), .Y(n470) );
  OAI22X1 U581 ( .A(\regs_matrix[8][1] ), .B(n23), .C(\regs_matrix[10][1] ), 
        .D(n56), .Y(n472) );
  OAI22X1 U582 ( .A(\regs_matrix[12][1] ), .B(n699), .C(\regs_matrix[14][1] ), 
        .D(n39), .Y(n471) );
  NOR2X1 U583 ( .A(n473), .B(n474), .Y(n469) );
  OAI22X1 U584 ( .A(\regs_matrix[11][1] ), .B(n705), .C(\regs_matrix[9][1] ), 
        .D(n709), .Y(n474) );
  OAI22X1 U585 ( .A(\regs_matrix[13][1] ), .B(n711), .C(\regs_matrix[15][1] ), 
        .D(n49), .Y(n473) );
  NAND2X1 U586 ( .A(n475), .B(n476), .Y(n467) );
  NOR2X1 U587 ( .A(n477), .B(n478), .Y(n476) );
  OAI22X1 U588 ( .A(outreg_data[1]), .B(n22), .C(\regs_matrix[2][1] ), .D(n55), 
        .Y(n478) );
  OAI22X1 U589 ( .A(\regs_matrix[4][1] ), .B(n699), .C(\regs_matrix[6][1] ), 
        .D(n704), .Y(n477) );
  NOR2X1 U590 ( .A(n480), .B(n479), .Y(n475) );
  OAI22X1 U591 ( .A(\regs_matrix[3][1] ), .B(n705), .C(\regs_matrix[1][1] ), 
        .D(n709), .Y(n480) );
  OAI22X1 U592 ( .A(\regs_matrix[5][1] ), .B(n712), .C(\regs_matrix[7][1] ), 
        .D(n36), .Y(n479) );
  MUX2X1 U593 ( .B(n481), .A(n482), .S(n713), .Y(r2_data[2]) );
  NAND2X1 U594 ( .A(n483), .B(n484), .Y(n482) );
  NOR2X1 U595 ( .A(n485), .B(n486), .Y(n484) );
  OAI22X1 U596 ( .A(\regs_matrix[8][2] ), .B(n23), .C(\regs_matrix[10][2] ), 
        .D(n54), .Y(n486) );
  OAI22X1 U597 ( .A(\regs_matrix[12][2] ), .B(n699), .C(\regs_matrix[14][2] ), 
        .D(n703), .Y(n485) );
  NOR2X1 U598 ( .A(n487), .B(n488), .Y(n483) );
  OAI22X1 U599 ( .A(\regs_matrix[11][2] ), .B(n706), .C(\regs_matrix[9][2] ), 
        .D(n709), .Y(n488) );
  OAI22X1 U600 ( .A(\regs_matrix[13][2] ), .B(n711), .C(\regs_matrix[15][2] ), 
        .D(n38), .Y(n487) );
  NAND2X1 U601 ( .A(n489), .B(n490), .Y(n481) );
  NOR2X1 U602 ( .A(n491), .B(n492), .Y(n490) );
  OAI22X1 U603 ( .A(outreg_data[2]), .B(n22), .C(\regs_matrix[2][2] ), .D(n52), 
        .Y(n492) );
  OAI22X1 U604 ( .A(\regs_matrix[4][2] ), .B(n699), .C(\regs_matrix[6][2] ), 
        .D(n702), .Y(n491) );
  NOR2X1 U605 ( .A(n493), .B(n494), .Y(n489) );
  OAI22X1 U606 ( .A(\regs_matrix[3][2] ), .B(n706), .C(\regs_matrix[1][2] ), 
        .D(n709), .Y(n494) );
  OAI22X1 U607 ( .A(\regs_matrix[5][2] ), .B(n711), .C(\regs_matrix[7][2] ), 
        .D(n50), .Y(n493) );
  MUX2X1 U608 ( .B(n495), .A(n496), .S(n714), .Y(r2_data[3]) );
  NAND2X1 U609 ( .A(n497), .B(n498), .Y(n496) );
  NOR2X1 U610 ( .A(n499), .B(n500), .Y(n498) );
  OAI22X1 U611 ( .A(\regs_matrix[8][3] ), .B(n27), .C(\regs_matrix[10][3] ), 
        .D(n60), .Y(n500) );
  OAI22X1 U612 ( .A(\regs_matrix[12][3] ), .B(n699), .C(\regs_matrix[14][3] ), 
        .D(n40), .Y(n499) );
  NOR2X1 U613 ( .A(n501), .B(n502), .Y(n497) );
  OAI22X1 U614 ( .A(\regs_matrix[11][3] ), .B(n705), .C(\regs_matrix[9][3] ), 
        .D(n709), .Y(n502) );
  OAI22X1 U615 ( .A(\regs_matrix[13][3] ), .B(n711), .C(\regs_matrix[15][3] ), 
        .D(n50), .Y(n501) );
  NAND2X1 U616 ( .A(n503), .B(n504), .Y(n495) );
  NOR2X1 U617 ( .A(n505), .B(n506), .Y(n504) );
  OAI22X1 U618 ( .A(outreg_data[3]), .B(n4), .C(\regs_matrix[2][3] ), .D(n57), 
        .Y(n506) );
  OAI22X1 U619 ( .A(\regs_matrix[4][3] ), .B(n699), .C(\regs_matrix[6][3] ), 
        .D(n703), .Y(n505) );
  NOR2X1 U620 ( .A(n507), .B(n508), .Y(n503) );
  OAI22X1 U621 ( .A(\regs_matrix[3][3] ), .B(n705), .C(\regs_matrix[1][3] ), 
        .D(n709), .Y(n508) );
  OAI22X1 U622 ( .A(\regs_matrix[5][3] ), .B(n711), .C(\regs_matrix[7][3] ), 
        .D(n51), .Y(n507) );
  MUX2X1 U623 ( .B(n509), .A(n510), .S(n713), .Y(r2_data[4]) );
  NAND2X1 U624 ( .A(n511), .B(n512), .Y(n510) );
  NOR2X1 U625 ( .A(n513), .B(n514), .Y(n512) );
  OAI22X1 U626 ( .A(\regs_matrix[8][4] ), .B(n21), .C(\regs_matrix[10][4] ), 
        .D(n63), .Y(n514) );
  OAI22X1 U627 ( .A(\regs_matrix[12][4] ), .B(n700), .C(\regs_matrix[14][4] ), 
        .D(n704), .Y(n513) );
  NOR2X1 U628 ( .A(n515), .B(n516), .Y(n511) );
  OAI22X1 U629 ( .A(\regs_matrix[11][4] ), .B(n706), .C(\regs_matrix[9][4] ), 
        .D(n709), .Y(n516) );
  OAI22X1 U630 ( .A(\regs_matrix[13][4] ), .B(n711), .C(\regs_matrix[15][4] ), 
        .D(n50), .Y(n515) );
  NAND2X1 U631 ( .A(n517), .B(n518), .Y(n509) );
  NOR2X1 U632 ( .A(n519), .B(n520), .Y(n518) );
  OAI22X1 U633 ( .A(outreg_data[4]), .B(n19), .C(\regs_matrix[2][4] ), .D(n68), 
        .Y(n520) );
  OAI22X1 U634 ( .A(\regs_matrix[4][4] ), .B(n700), .C(\regs_matrix[6][4] ), 
        .D(n704), .Y(n519) );
  NOR2X1 U635 ( .A(n521), .B(n522), .Y(n517) );
  OAI22X1 U636 ( .A(\regs_matrix[3][4] ), .B(n705), .C(\regs_matrix[1][4] ), 
        .D(n709), .Y(n522) );
  OAI22X1 U637 ( .A(\regs_matrix[5][4] ), .B(n711), .C(\regs_matrix[7][4] ), 
        .D(n51), .Y(n521) );
  MUX2X1 U638 ( .B(n523), .A(n524), .S(n714), .Y(r2_data[5]) );
  NAND2X1 U639 ( .A(n525), .B(n526), .Y(n524) );
  NOR2X1 U640 ( .A(n527), .B(n528), .Y(n526) );
  OAI22X1 U641 ( .A(\regs_matrix[8][5] ), .B(n4), .C(\regs_matrix[10][5] ), 
        .D(n55), .Y(n528) );
  OAI22X1 U642 ( .A(\regs_matrix[12][5] ), .B(n700), .C(\regs_matrix[14][5] ), 
        .D(n704), .Y(n527) );
  NOR2X1 U643 ( .A(n529), .B(n530), .Y(n525) );
  OAI22X1 U644 ( .A(\regs_matrix[11][5] ), .B(n705), .C(\regs_matrix[9][5] ), 
        .D(n709), .Y(n530) );
  OAI22X1 U645 ( .A(\regs_matrix[13][5] ), .B(n711), .C(\regs_matrix[15][5] ), 
        .D(n51), .Y(n529) );
  NAND2X1 U646 ( .A(n531), .B(n532), .Y(n523) );
  NOR2X1 U647 ( .A(n533), .B(n534), .Y(n532) );
  OAI22X1 U648 ( .A(outreg_data[5]), .B(n17), .C(\regs_matrix[2][5] ), .D(n52), 
        .Y(n534) );
  OAI22X1 U649 ( .A(\regs_matrix[4][5] ), .B(n700), .C(\regs_matrix[6][5] ), 
        .D(n702), .Y(n533) );
  NOR2X1 U650 ( .A(n535), .B(n536), .Y(n531) );
  OAI22X1 U651 ( .A(\regs_matrix[3][5] ), .B(n706), .C(\regs_matrix[1][5] ), 
        .D(n709), .Y(n536) );
  OAI22X1 U652 ( .A(\regs_matrix[5][5] ), .B(n711), .C(\regs_matrix[7][5] ), 
        .D(n37), .Y(n535) );
  MUX2X1 U653 ( .B(n537), .A(n538), .S(n713), .Y(r2_data[6]) );
  NAND2X1 U654 ( .A(n539), .B(n540), .Y(n538) );
  NOR2X1 U655 ( .A(n541), .B(n542), .Y(n540) );
  OAI22X1 U656 ( .A(\regs_matrix[8][6] ), .B(n20), .C(\regs_matrix[10][6] ), 
        .D(n56), .Y(n542) );
  OAI22X1 U657 ( .A(\regs_matrix[12][6] ), .B(n700), .C(\regs_matrix[14][6] ), 
        .D(n702), .Y(n541) );
  NOR2X1 U658 ( .A(n543), .B(n544), .Y(n539) );
  OAI22X1 U659 ( .A(\regs_matrix[11][6] ), .B(n706), .C(\regs_matrix[9][6] ), 
        .D(n708), .Y(n544) );
  OAI22X1 U660 ( .A(\regs_matrix[13][6] ), .B(n711), .C(\regs_matrix[15][6] ), 
        .D(n50), .Y(n543) );
  NAND2X1 U661 ( .A(n545), .B(n546), .Y(n537) );
  NOR2X1 U662 ( .A(n547), .B(n548), .Y(n546) );
  OAI22X1 U663 ( .A(outreg_data[6]), .B(n18), .C(\regs_matrix[2][6] ), .D(n53), 
        .Y(n548) );
  OAI22X1 U664 ( .A(\regs_matrix[4][6] ), .B(n700), .C(\regs_matrix[6][6] ), 
        .D(n40), .Y(n547) );
  NOR2X1 U665 ( .A(n549), .B(n550), .Y(n545) );
  OAI22X1 U666 ( .A(\regs_matrix[3][6] ), .B(n706), .C(\regs_matrix[1][6] ), 
        .D(n708), .Y(n550) );
  OAI22X1 U667 ( .A(\regs_matrix[5][6] ), .B(n711), .C(\regs_matrix[7][6] ), 
        .D(n38), .Y(n549) );
  MUX2X1 U668 ( .B(n551), .A(n552), .S(n714), .Y(r2_data[7]) );
  NAND2X1 U669 ( .A(n553), .B(n554), .Y(n552) );
  NOR2X1 U670 ( .A(n555), .B(n556), .Y(n554) );
  OAI22X1 U671 ( .A(\regs_matrix[8][7] ), .B(n21), .C(\regs_matrix[10][7] ), 
        .D(n70), .Y(n556) );
  OAI22X1 U672 ( .A(\regs_matrix[12][7] ), .B(n700), .C(\regs_matrix[14][7] ), 
        .D(n702), .Y(n555) );
  NOR2X1 U673 ( .A(n557), .B(n558), .Y(n553) );
  OAI22X1 U674 ( .A(\regs_matrix[11][7] ), .B(n706), .C(\regs_matrix[9][7] ), 
        .D(n708), .Y(n558) );
  OAI22X1 U675 ( .A(\regs_matrix[13][7] ), .B(n711), .C(\regs_matrix[15][7] ), 
        .D(n38), .Y(n557) );
  NAND2X1 U676 ( .A(n559), .B(n560), .Y(n551) );
  NOR2X1 U677 ( .A(n561), .B(n562), .Y(n560) );
  OAI22X1 U678 ( .A(outreg_data[7]), .B(n20), .C(\regs_matrix[2][7] ), .D(n62), 
        .Y(n562) );
  OAI22X1 U679 ( .A(\regs_matrix[4][7] ), .B(n700), .C(\regs_matrix[6][7] ), 
        .D(n703), .Y(n561) );
  NOR2X1 U680 ( .A(n563), .B(n564), .Y(n559) );
  OAI22X1 U681 ( .A(\regs_matrix[3][7] ), .B(n705), .C(\regs_matrix[1][7] ), 
        .D(n708), .Y(n564) );
  OAI22X1 U682 ( .A(\regs_matrix[5][7] ), .B(n711), .C(\regs_matrix[7][7] ), 
        .D(n38), .Y(n563) );
  MUX2X1 U683 ( .B(n565), .A(n566), .S(n713), .Y(r2_data[8]) );
  NAND2X1 U684 ( .A(n567), .B(n568), .Y(n566) );
  NOR2X1 U685 ( .A(n569), .B(n570), .Y(n568) );
  OAI22X1 U686 ( .A(\regs_matrix[8][8] ), .B(n15), .C(\regs_matrix[10][8] ), 
        .D(n64), .Y(n570) );
  OAI22X1 U687 ( .A(\regs_matrix[12][8] ), .B(n700), .C(\regs_matrix[14][8] ), 
        .D(n702), .Y(n569) );
  NOR2X1 U688 ( .A(n571), .B(n572), .Y(n567) );
  OAI22X1 U689 ( .A(\regs_matrix[11][8] ), .B(n706), .C(\regs_matrix[9][8] ), 
        .D(n708), .Y(n572) );
  OAI22X1 U690 ( .A(\regs_matrix[13][8] ), .B(n711), .C(\regs_matrix[15][8] ), 
        .D(n50), .Y(n571) );
  NAND2X1 U691 ( .A(n573), .B(n574), .Y(n565) );
  NOR2X1 U692 ( .A(n575), .B(n576), .Y(n574) );
  OAI22X1 U693 ( .A(outreg_data[8]), .B(n14), .C(\regs_matrix[2][8] ), .D(n69), 
        .Y(n576) );
  OAI22X1 U694 ( .A(\regs_matrix[4][8] ), .B(n700), .C(\regs_matrix[6][8] ), 
        .D(n704), .Y(n575) );
  NOR2X1 U695 ( .A(n577), .B(n578), .Y(n573) );
  OAI22X1 U696 ( .A(\regs_matrix[3][8] ), .B(n705), .C(\regs_matrix[1][8] ), 
        .D(n708), .Y(n578) );
  OAI22X1 U697 ( .A(\regs_matrix[5][8] ), .B(n711), .C(\regs_matrix[7][8] ), 
        .D(n37), .Y(n577) );
  MUX2X1 U698 ( .B(n579), .A(n580), .S(n714), .Y(r2_data[9]) );
  NAND2X1 U699 ( .A(n581), .B(n582), .Y(n580) );
  NOR2X1 U700 ( .A(n583), .B(n584), .Y(n582) );
  OAI22X1 U701 ( .A(\regs_matrix[8][9] ), .B(n17), .C(\regs_matrix[10][9] ), 
        .D(n61), .Y(n584) );
  OAI22X1 U702 ( .A(\regs_matrix[12][9] ), .B(n700), .C(\regs_matrix[14][9] ), 
        .D(n704), .Y(n583) );
  NOR2X1 U703 ( .A(n585), .B(n586), .Y(n581) );
  OAI22X1 U704 ( .A(\regs_matrix[11][9] ), .B(n705), .C(\regs_matrix[9][9] ), 
        .D(n708), .Y(n586) );
  OAI22X1 U705 ( .A(\regs_matrix[13][9] ), .B(n711), .C(\regs_matrix[15][9] ), 
        .D(n50), .Y(n585) );
  NAND2X1 U706 ( .A(n587), .B(n588), .Y(n579) );
  NOR2X1 U707 ( .A(n589), .B(n590), .Y(n588) );
  OAI22X1 U708 ( .A(outreg_data[9]), .B(n16), .C(\regs_matrix[2][9] ), .D(n67), 
        .Y(n590) );
  OAI22X1 U709 ( .A(\regs_matrix[4][9] ), .B(n700), .C(\regs_matrix[6][9] ), 
        .D(n702), .Y(n589) );
  NOR2X1 U710 ( .A(n591), .B(n592), .Y(n587) );
  OAI22X1 U711 ( .A(\regs_matrix[3][9] ), .B(n706), .C(\regs_matrix[1][9] ), 
        .D(n708), .Y(n592) );
  OAI22X1 U712 ( .A(\regs_matrix[5][9] ), .B(n711), .C(\regs_matrix[7][9] ), 
        .D(n38), .Y(n591) );
  MUX2X1 U713 ( .B(n593), .A(n594), .S(n713), .Y(r2_data[10]) );
  NAND2X1 U714 ( .A(n595), .B(n596), .Y(n594) );
  NOR2X1 U715 ( .A(n597), .B(n598), .Y(n596) );
  OAI22X1 U716 ( .A(\regs_matrix[8][10] ), .B(n25), .C(\regs_matrix[10][10] ), 
        .D(n62), .Y(n598) );
  OAI22X1 U717 ( .A(\regs_matrix[12][10] ), .B(n700), .C(\regs_matrix[14][10] ), .D(n40), .Y(n597) );
  NOR2X1 U718 ( .A(n599), .B(n600), .Y(n595) );
  OAI22X1 U719 ( .A(\regs_matrix[11][10] ), .B(n706), .C(\regs_matrix[9][10] ), 
        .D(n708), .Y(n600) );
  OAI22X1 U720 ( .A(\regs_matrix[13][10] ), .B(n711), .C(\regs_matrix[15][10] ), .D(n50), .Y(n599) );
  NAND2X1 U721 ( .A(n601), .B(n602), .Y(n593) );
  NOR2X1 U722 ( .A(n603), .B(n604), .Y(n602) );
  OAI22X1 U723 ( .A(outreg_data[10]), .B(n25), .C(\regs_matrix[2][10] ), .D(
        n59), .Y(n604) );
  OAI22X1 U724 ( .A(\regs_matrix[4][10] ), .B(n700), .C(\regs_matrix[6][10] ), 
        .D(n704), .Y(n603) );
  NOR2X1 U725 ( .A(n605), .B(n606), .Y(n601) );
  OAI22X1 U726 ( .A(\regs_matrix[3][10] ), .B(n706), .C(\regs_matrix[1][10] ), 
        .D(n708), .Y(n606) );
  OAI22X1 U727 ( .A(\regs_matrix[5][10] ), .B(n712), .C(\regs_matrix[7][10] ), 
        .D(n38), .Y(n605) );
  MUX2X1 U728 ( .B(n607), .A(n608), .S(n714), .Y(r2_data[11]) );
  NAND2X1 U729 ( .A(n609), .B(n610), .Y(n608) );
  NOR2X1 U730 ( .A(n611), .B(n612), .Y(n610) );
  OAI22X1 U731 ( .A(\regs_matrix[8][11] ), .B(n3), .C(\regs_matrix[10][11] ), 
        .D(n63), .Y(n612) );
  OAI22X1 U732 ( .A(\regs_matrix[12][11] ), .B(n700), .C(\regs_matrix[14][11] ), .D(n40), .Y(n611) );
  NOR2X1 U733 ( .A(n613), .B(n614), .Y(n609) );
  OAI22X1 U734 ( .A(\regs_matrix[11][11] ), .B(n706), .C(\regs_matrix[9][11] ), 
        .D(n708), .Y(n614) );
  OAI22X1 U735 ( .A(\regs_matrix[13][11] ), .B(n712), .C(\regs_matrix[15][11] ), .D(n37), .Y(n613) );
  NAND2X1 U736 ( .A(n615), .B(n616), .Y(n607) );
  NOR2X1 U737 ( .A(n617), .B(n618), .Y(n616) );
  OAI22X1 U738 ( .A(outreg_data[11]), .B(n28), .C(\regs_matrix[2][11] ), .D(
        n60), .Y(n618) );
  OAI22X1 U739 ( .A(\regs_matrix[4][11] ), .B(n700), .C(\regs_matrix[6][11] ), 
        .D(n704), .Y(n617) );
  NOR2X1 U740 ( .A(n619), .B(n620), .Y(n615) );
  OAI22X1 U741 ( .A(\regs_matrix[3][11] ), .B(n706), .C(\regs_matrix[1][11] ), 
        .D(n708), .Y(n620) );
  OAI22X1 U742 ( .A(\regs_matrix[5][11] ), .B(n712), .C(\regs_matrix[7][11] ), 
        .D(n37), .Y(n619) );
  MUX2X1 U743 ( .B(n621), .A(n622), .S(n713), .Y(r2_data[12]) );
  NAND2X1 U744 ( .A(n623), .B(n624), .Y(n622) );
  NOR2X1 U745 ( .A(n625), .B(n626), .Y(n624) );
  OAI22X1 U746 ( .A(\regs_matrix[8][12] ), .B(n24), .C(\regs_matrix[10][12] ), 
        .D(n66), .Y(n626) );
  OAI22X1 U747 ( .A(\regs_matrix[12][12] ), .B(n700), .C(\regs_matrix[14][12] ), .D(n703), .Y(n625) );
  NOR2X1 U748 ( .A(n627), .B(n628), .Y(n623) );
  OAI22X1 U749 ( .A(\regs_matrix[11][12] ), .B(n705), .C(\regs_matrix[9][12] ), 
        .D(n708), .Y(n628) );
  OAI22X1 U750 ( .A(\regs_matrix[13][12] ), .B(n712), .C(\regs_matrix[15][12] ), .D(n38), .Y(n627) );
  NAND2X1 U751 ( .A(n629), .B(n630), .Y(n621) );
  NOR2X1 U752 ( .A(n631), .B(n632), .Y(n630) );
  OAI22X1 U753 ( .A(outreg_data[12]), .B(n24), .C(\regs_matrix[2][12] ), .D(
        n71), .Y(n632) );
  OAI22X1 U754 ( .A(\regs_matrix[4][12] ), .B(n700), .C(\regs_matrix[6][12] ), 
        .D(n40), .Y(n631) );
  NOR2X1 U755 ( .A(n633), .B(n634), .Y(n629) );
  OAI22X1 U756 ( .A(\regs_matrix[3][12] ), .B(n705), .C(\regs_matrix[1][12] ), 
        .D(n709), .Y(n634) );
  OAI22X1 U757 ( .A(\regs_matrix[5][12] ), .B(n712), .C(\regs_matrix[7][12] ), 
        .D(n51), .Y(n633) );
  MUX2X1 U758 ( .B(n635), .A(n636), .S(n714), .Y(r2_data[13]) );
  NAND2X1 U759 ( .A(n637), .B(n638), .Y(n636) );
  NOR2X1 U760 ( .A(n639), .B(n640), .Y(n638) );
  OAI22X1 U761 ( .A(\regs_matrix[8][13] ), .B(n15), .C(\regs_matrix[10][13] ), 
        .D(n59), .Y(n640) );
  OAI22X1 U762 ( .A(\regs_matrix[12][13] ), .B(n700), .C(\regs_matrix[14][13] ), .D(n702), .Y(n639) );
  NOR2X1 U763 ( .A(n641), .B(n642), .Y(n637) );
  OAI22X1 U764 ( .A(\regs_matrix[11][13] ), .B(n705), .C(\regs_matrix[9][13] ), 
        .D(n708), .Y(n642) );
  OAI22X1 U765 ( .A(\regs_matrix[13][13] ), .B(n712), .C(\regs_matrix[15][13] ), .D(n37), .Y(n641) );
  NAND2X1 U766 ( .A(n643), .B(n644), .Y(n635) );
  NOR2X1 U767 ( .A(n645), .B(n646), .Y(n644) );
  OAI22X1 U768 ( .A(outreg_data[13]), .B(n14), .C(\regs_matrix[2][13] ), .D(
        n65), .Y(n646) );
  OAI22X1 U769 ( .A(\regs_matrix[4][13] ), .B(n700), .C(\regs_matrix[6][13] ), 
        .D(n703), .Y(n645) );
  NOR2X1 U770 ( .A(n647), .B(n648), .Y(n643) );
  OAI22X1 U771 ( .A(\regs_matrix[3][13] ), .B(n706), .C(\regs_matrix[1][13] ), 
        .D(n708), .Y(n648) );
  OAI22X1 U772 ( .A(\regs_matrix[5][13] ), .B(n712), .C(\regs_matrix[7][13] ), 
        .D(n51), .Y(n647) );
  NOR2X1 U773 ( .A(n651), .B(n652), .Y(n650) );
  OAI22X1 U774 ( .A(\regs_matrix[8][14] ), .B(n26), .C(\regs_matrix[10][14] ), 
        .D(n58), .Y(n652) );
  OAI22X1 U775 ( .A(\regs_matrix[12][14] ), .B(n700), .C(\regs_matrix[14][14] ), .D(n703), .Y(n651) );
  NOR2X1 U776 ( .A(n653), .B(n654), .Y(n649) );
  OAI22X1 U777 ( .A(\regs_matrix[11][14] ), .B(n706), .C(\regs_matrix[9][14] ), 
        .D(n708), .Y(n654) );
  OAI22X1 U778 ( .A(\regs_matrix[13][14] ), .B(n712), .C(\regs_matrix[15][14] ), .D(n51), .Y(n653) );
  NOR2X1 U779 ( .A(n657), .B(n658), .Y(n656) );
  OAI22X1 U780 ( .A(outreg_data[14]), .B(n29), .C(\regs_matrix[2][14] ), .D(
        n57), .Y(n658) );
  OAI22X1 U781 ( .A(\regs_matrix[4][14] ), .B(n700), .C(\regs_matrix[6][14] ), 
        .D(n40), .Y(n657) );
  NOR2X1 U782 ( .A(n659), .B(n660), .Y(n655) );
  OAI22X1 U783 ( .A(\regs_matrix[3][14] ), .B(n705), .C(\regs_matrix[1][14] ), 
        .D(n709), .Y(n660) );
  OAI22X1 U784 ( .A(\regs_matrix[5][14] ), .B(n712), .C(\regs_matrix[7][14] ), 
        .D(n37), .Y(n659) );
  MUX2X1 U785 ( .B(n661), .A(n662), .S(n714), .Y(r2_data[15]) );
  NAND2X1 U786 ( .A(n663), .B(n664), .Y(n662) );
  NOR2X1 U787 ( .A(n665), .B(n666), .Y(n664) );
  OAI22X1 U788 ( .A(\regs_matrix[8][15] ), .B(n16), .C(\regs_matrix[10][15] ), 
        .D(n61), .Y(n666) );
  OAI22X1 U789 ( .A(\regs_matrix[12][15] ), .B(n700), .C(\regs_matrix[14][15] ), .D(n704), .Y(n665) );
  NOR2X1 U790 ( .A(n667), .B(n668), .Y(n663) );
  OAI22X1 U791 ( .A(\regs_matrix[11][15] ), .B(n706), .C(\regs_matrix[9][15] ), 
        .D(n708), .Y(n668) );
  OAI22X1 U792 ( .A(\regs_matrix[13][15] ), .B(n712), .C(\regs_matrix[15][15] ), .D(n37), .Y(n667) );
  NAND2X1 U793 ( .A(n670), .B(n669), .Y(n661) );
  NOR2X1 U794 ( .A(n671), .B(n672), .Y(n670) );
  OAI22X1 U795 ( .A(outreg_data[15]), .B(n18), .C(\regs_matrix[2][15] ), .D(
        n58), .Y(n672) );
  OAI22X1 U796 ( .A(\regs_matrix[4][15] ), .B(n700), .C(n704), .D(
        \regs_matrix[6][15] ), .Y(n671) );
  NOR2X1 U797 ( .A(n673), .B(n674), .Y(n669) );
  OAI22X1 U798 ( .A(\regs_matrix[3][15] ), .B(n706), .C(\regs_matrix[1][15] ), 
        .D(n708), .Y(n674) );
  OAI22X1 U799 ( .A(\regs_matrix[5][15] ), .B(n712), .C(\regs_matrix[7][15] ), 
        .D(n51), .Y(n673) );
  NOR2X1 U800 ( .A(n675), .B(n676), .Y(n443) );
  OAI21X1 U801 ( .A(\regs_matrix[6][16] ), .B(n40), .C(n677), .Y(n676) );
  AOI22X1 U802 ( .A(n72), .B(n402), .C(n30), .D(n678), .Y(n677) );
  INVX2 U803 ( .A(outreg_data[16]), .Y(n678) );
  OAI21X1 U804 ( .A(\regs_matrix[4][16] ), .B(n700), .C(n715), .Y(n675) );
  NOR2X1 U805 ( .A(n679), .B(n680), .Y(n444) );
  OAI22X1 U806 ( .A(\regs_matrix[3][16] ), .B(n45), .C(\regs_matrix[1][16] ), 
        .D(n708), .Y(n680) );
  OAI22X1 U807 ( .A(\regs_matrix[5][16] ), .B(n88), .C(\regs_matrix[7][16] ), 
        .D(n50), .Y(n679) );
  NOR2X1 U808 ( .A(n681), .B(n682), .Y(n445) );
  OAI21X1 U809 ( .A(\regs_matrix[12][16] ), .B(n700), .C(n683), .Y(n682) );
  AOI22X1 U810 ( .A(n72), .B(n684), .C(n30), .D(n685), .Y(n683) );
  INVX2 U811 ( .A(\regs_matrix[8][16] ), .Y(n685) );
  NAND3X1 U812 ( .A(n688), .B(n687), .C(n686), .Y(n454) );
  INVX2 U813 ( .A(\regs_matrix[10][16] ), .Y(n684) );
  NAND3X1 U814 ( .A(N16), .B(n686), .C(n688), .Y(n456) );
  OAI22X1 U815 ( .A(\regs_matrix[9][16] ), .B(n709), .C(\regs_matrix[14][16] ), 
        .D(n703), .Y(n681) );
  INVX2 U816 ( .A(N14), .Y(n688) );
  NAND3X1 U817 ( .A(N14), .B(n687), .C(n686), .Y(n459) );
  NOR2X1 U818 ( .A(n689), .B(n690), .Y(n446) );
  OAI21X1 U819 ( .A(\regs_matrix[11][16] ), .B(n44), .C(n713), .Y(n690) );
  OAI22X1 U820 ( .A(\regs_matrix[15][16] ), .B(n38), .C(\regs_matrix[13][16] ), 
        .D(n88), .Y(n689) );
  NAND3X1 U821 ( .A(N16), .B(N14), .C(n686), .Y(n460) );
  INVX2 U822 ( .A(N15), .Y(n686) );
  INVX2 U823 ( .A(w_sel[2]), .Y(n773) );
  INVX2 U824 ( .A(w_en), .Y(n774) );
  INVX2 U825 ( .A(w_sel[1]), .Y(n775) );
  INVX2 U826 ( .A(w_sel[3]), .Y(n776) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U3 ( .A(n36), .B(n3), .Y(n1) );
  AND2X2 U4 ( .A(w_data_sel[0]), .B(n36), .Y(n2) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, \sub_add_12_b0/carry[15] , \sub_add_12_b0/carry[14] ,
         \sub_add_12_b0/carry[13] , \sub_add_12_b0/carry[12] ,
         \sub_add_12_b0/carry[11] , \sub_add_12_b0/carry[10] ,
         \sub_add_12_b0/carry[9] , \sub_add_12_b0/carry[8] ,
         \sub_add_12_b0/carry[7] , \sub_add_12_b0/carry[6] ,
         \sub_add_12_b0/carry[5] , \sub_add_12_b0/carry[4] ,
         \sub_add_12_b0/carry[3] , \sub_add_12_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  assign N2 = in[0];

  AOI22X1 U22 ( .A(n2), .B(N11), .C(in[9]), .D(n1), .Y(n22) );
  AOI22X1 U23 ( .A(N10), .B(in[16]), .C(in[8]), .D(n1), .Y(n23) );
  AOI22X1 U24 ( .A(N9), .B(in[16]), .C(in[7]), .D(n1), .Y(n24) );
  AOI22X1 U25 ( .A(N8), .B(in[16]), .C(in[6]), .D(n1), .Y(n25) );
  AOI22X1 U26 ( .A(N7), .B(in[16]), .C(in[5]), .D(n1), .Y(n26) );
  AOI22X1 U27 ( .A(N6), .B(n2), .C(in[4]), .D(n1), .Y(n27) );
  AOI22X1 U28 ( .A(N5), .B(in[16]), .C(in[3]), .D(n1), .Y(n28) );
  AOI22X1 U29 ( .A(N4), .B(n2), .C(in[2]), .D(n1), .Y(n29) );
  AOI22X1 U30 ( .A(N3), .B(n2), .C(in[1]), .D(n1), .Y(n30) );
  AOI22X1 U31 ( .A(N17), .B(n2), .C(in[15]), .D(n1), .Y(n31) );
  AOI22X1 U32 ( .A(N16), .B(n2), .C(in[14]), .D(n1), .Y(n32) );
  AOI22X1 U33 ( .A(N15), .B(n2), .C(in[13]), .D(n1), .Y(n33) );
  AOI22X1 U34 ( .A(N14), .B(n2), .C(in[12]), .D(n1), .Y(n34) );
  AOI22X1 U35 ( .A(N13), .B(n2), .C(in[11]), .D(n1), .Y(n35) );
  AOI22X1 U36 ( .A(N12), .B(n2), .C(in[10]), .D(n1), .Y(n36) );
  AOI22X1 U37 ( .A(N2), .B(n2), .C(N2), .D(n1), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  XOR2X1 U4 ( .A(n18), .B(\sub_add_12_b0/carry[15] ), .Y(N17) );
  AND2X1 U5 ( .A(n17), .B(\sub_add_12_b0/carry[14] ), .Y(
        \sub_add_12_b0/carry[15] ) );
  XOR2X1 U6 ( .A(\sub_add_12_b0/carry[14] ), .B(n17), .Y(N16) );
  AND2X1 U7 ( .A(n16), .B(\sub_add_12_b0/carry[13] ), .Y(
        \sub_add_12_b0/carry[14] ) );
  XOR2X1 U8 ( .A(\sub_add_12_b0/carry[13] ), .B(n16), .Y(N15) );
  AND2X1 U9 ( .A(n15), .B(\sub_add_12_b0/carry[12] ), .Y(
        \sub_add_12_b0/carry[13] ) );
  XOR2X1 U10 ( .A(\sub_add_12_b0/carry[12] ), .B(n15), .Y(N14) );
  AND2X1 U11 ( .A(n14), .B(\sub_add_12_b0/carry[11] ), .Y(
        \sub_add_12_b0/carry[12] ) );
  XOR2X1 U12 ( .A(\sub_add_12_b0/carry[11] ), .B(n14), .Y(N13) );
  AND2X1 U13 ( .A(n13), .B(\sub_add_12_b0/carry[10] ), .Y(
        \sub_add_12_b0/carry[11] ) );
  XOR2X1 U14 ( .A(\sub_add_12_b0/carry[10] ), .B(n13), .Y(N12) );
  AND2X1 U15 ( .A(n12), .B(\sub_add_12_b0/carry[9] ), .Y(
        \sub_add_12_b0/carry[10] ) );
  XOR2X1 U16 ( .A(\sub_add_12_b0/carry[9] ), .B(n12), .Y(N11) );
  AND2X1 U17 ( .A(n11), .B(\sub_add_12_b0/carry[8] ), .Y(
        \sub_add_12_b0/carry[9] ) );
  XOR2X1 U18 ( .A(\sub_add_12_b0/carry[8] ), .B(n11), .Y(N10) );
  AND2X1 U19 ( .A(n10), .B(\sub_add_12_b0/carry[7] ), .Y(
        \sub_add_12_b0/carry[8] ) );
  XOR2X1 U20 ( .A(\sub_add_12_b0/carry[7] ), .B(n10), .Y(N9) );
  AND2X1 U21 ( .A(n9), .B(\sub_add_12_b0/carry[6] ), .Y(
        \sub_add_12_b0/carry[7] ) );
  XOR2X1 U38 ( .A(\sub_add_12_b0/carry[6] ), .B(n9), .Y(N8) );
  AND2X1 U39 ( .A(n8), .B(\sub_add_12_b0/carry[5] ), .Y(
        \sub_add_12_b0/carry[6] ) );
  XOR2X1 U40 ( .A(\sub_add_12_b0/carry[5] ), .B(n8), .Y(N7) );
  AND2X1 U41 ( .A(n7), .B(\sub_add_12_b0/carry[4] ), .Y(
        \sub_add_12_b0/carry[5] ) );
  XOR2X1 U42 ( .A(\sub_add_12_b0/carry[4] ), .B(n7), .Y(N6) );
  AND2X1 U43 ( .A(n6), .B(\sub_add_12_b0/carry[3] ), .Y(
        \sub_add_12_b0/carry[4] ) );
  XOR2X1 U44 ( .A(\sub_add_12_b0/carry[3] ), .B(n6), .Y(N5) );
  AND2X1 U45 ( .A(n5), .B(\sub_add_12_b0/carry[2] ), .Y(
        \sub_add_12_b0/carry[3] ) );
  XOR2X1 U46 ( .A(\sub_add_12_b0/carry[2] ), .B(n5), .Y(N4) );
  AND2X1 U47 ( .A(n4), .B(n3), .Y(\sub_add_12_b0/carry[2] ) );
  XOR2X1 U48 ( .A(n3), .B(n4), .Y(N3) );
  INVX2 U49 ( .A(N2), .Y(n3) );
  INVX2 U50 ( .A(in[1]), .Y(n4) );
  INVX2 U51 ( .A(in[2]), .Y(n5) );
  INVX2 U52 ( .A(in[3]), .Y(n6) );
  INVX2 U53 ( .A(in[4]), .Y(n7) );
  INVX2 U54 ( .A(in[5]), .Y(n8) );
  INVX2 U55 ( .A(in[6]), .Y(n9) );
  INVX2 U56 ( .A(in[7]), .Y(n10) );
  INVX2 U57 ( .A(in[8]), .Y(n11) );
  INVX2 U58 ( .A(in[9]), .Y(n12) );
  INVX2 U59 ( .A(in[10]), .Y(n13) );
  INVX2 U60 ( .A(in[11]), .Y(n14) );
  INVX2 U61 ( .A(in[12]), .Y(n15) );
  INVX2 U62 ( .A(in[13]), .Y(n16) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   data_sync, load_sync, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_low_1 my_friend_here ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(data_sync) );
  sync_low_0 justin ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(load_sync) );
  controller hes_already_taken ( .clk(clk), .n_rst(n_reset), .dr(data_sync), 
        .lc(load_sync), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), 
        .modwait(modwait), .op(op), .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), .dest(dest), .err(err) );
  counter And_hes_cracked ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), 
        .clear(clear), .one_k_samples(one_k_samples) );
  datapath at_fortnite_my_guy ( .clk(clk), .n_reset(n_reset), .op(op), .src1({
        1'b0, src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(
        overflow) );
  magnitude euughhhhh ( .in(outreg_data), .out(fir_out) );
endmodule

