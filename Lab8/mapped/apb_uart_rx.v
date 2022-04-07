/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar 24 00:45:51 2022
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, data_read, psel, paddr, penable, pwrite, pwdata, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   data_ready_reg, overrun_error_reg, framing_error_reg, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115;
  wire   [7:0] rx_data_reg;
  wire   [3:0] next_data_size;
  wire   [13:0] next_bit_period;

  DFFSR \rx_data_reg_reg[7]  ( .D(rx_data[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[7]) );
  DFFSR \rx_data_reg_reg[6]  ( .D(rx_data[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[6]) );
  DFFSR \rx_data_reg_reg[5]  ( .D(rx_data[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[5]) );
  DFFSR \rx_data_reg_reg[4]  ( .D(rx_data[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[4]) );
  DFFSR \rx_data_reg_reg[3]  ( .D(rx_data[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[3]) );
  DFFSR \rx_data_reg_reg[2]  ( .D(rx_data[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[2]) );
  DFFSR \rx_data_reg_reg[1]  ( .D(rx_data[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[1]) );
  DFFSR \rx_data_reg_reg[0]  ( .D(rx_data[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_data_reg[0]) );
  DFFSR data_ready_reg_reg ( .D(data_ready), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_ready_reg) );
  DFFSR overrun_error_reg_reg ( .D(overrun_error), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(overrun_error_reg) );
  DFFSR framing_error_reg_reg ( .D(framing_error), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(framing_error_reg) );
  DFFSR \bit_period_reg[13]  ( .D(n110), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[13]) );
  DFFSR \bit_period_reg[12]  ( .D(n111), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[12]) );
  DFFSR \bit_period_reg[11]  ( .D(next_bit_period[11]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[11]) );
  DFFSR \bit_period_reg[10]  ( .D(next_bit_period[10]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[10]) );
  DFFSR \bit_period_reg[9]  ( .D(next_bit_period[9]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[9]) );
  DFFSR \bit_period_reg[8]  ( .D(next_bit_period[8]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[8]) );
  DFFSR \bit_period_reg[7]  ( .D(next_bit_period[7]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[7]) );
  DFFSR \bit_period_reg[6]  ( .D(next_bit_period[6]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[6]) );
  DFFSR \bit_period_reg[5]  ( .D(n112), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[5]) );
  DFFSR \bit_period_reg[4]  ( .D(n113), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[4]) );
  DFFSR \bit_period_reg[3]  ( .D(n114), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        bit_period[3]) );
  DFFSR \bit_period_reg[2]  ( .D(n115), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[2]) );
  DFFSR \bit_period_reg[1]  ( .D(next_bit_period[1]), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(bit_period[1]) );
  DFFSR \bit_period_reg[0]  ( .D(next_bit_period[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[0]) );
  DFFSR \data_size_reg[3]  ( .D(next_data_size[3]), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(data_size[3]) );
  DFFSR \data_size_reg[2]  ( .D(next_data_size[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(data_size[2]) );
  DFFSR \data_size_reg[1]  ( .D(next_data_size[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(data_size[1]) );
  DFFSR \data_size_reg[0]  ( .D(next_data_size[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(data_size[0]) );
  NOR2X1 U32 ( .A(n30), .B(n31), .Y(pslverr) );
  AOI22X1 U33 ( .A(pwrite), .B(n32), .C(paddr[0]), .D(paddr[2]), .Y(n30) );
  OAI21X1 U34 ( .A(n33), .B(n34), .C(n35), .Y(prdata[7]) );
  NAND2X1 U35 ( .A(rx_data_reg[7]), .B(data_read), .Y(n35) );
  OAI21X1 U36 ( .A(n33), .B(n36), .C(n37), .Y(prdata[6]) );
  NAND2X1 U37 ( .A(rx_data_reg[6]), .B(data_read), .Y(n37) );
  INVX1 U38 ( .A(n38), .Y(n33) );
  OAI21X1 U39 ( .A(n39), .B(n40), .C(n41), .Y(prdata[5]) );
  AOI22X1 U40 ( .A(n42), .B(bit_period[13]), .C(bit_period[5]), .D(n38), .Y(
        n41) );
  INVX1 U41 ( .A(rx_data_reg[5]), .Y(n40) );
  OAI21X1 U42 ( .A(n39), .B(n43), .C(n44), .Y(prdata[4]) );
  AOI22X1 U43 ( .A(n42), .B(bit_period[12]), .C(bit_period[4]), .D(n38), .Y(
        n44) );
  NOR2X1 U44 ( .A(n45), .B(n46), .Y(n38) );
  NOR2X1 U45 ( .A(n45), .B(n47), .Y(n42) );
  INVX1 U46 ( .A(rx_data_reg[4]), .Y(n43) );
  OAI21X1 U47 ( .A(n48), .B(n45), .C(n49), .Y(prdata[3]) );
  NAND2X1 U48 ( .A(rx_data_reg[3]), .B(data_read), .Y(n49) );
  AOI21X1 U49 ( .A(bit_period[3]), .B(n50), .C(n51), .Y(n48) );
  OAI22X1 U50 ( .A(n47), .B(n52), .C(n53), .D(n54), .Y(n51) );
  OAI21X1 U51 ( .A(n55), .B(n45), .C(n56), .Y(prdata[2]) );
  NAND2X1 U52 ( .A(rx_data_reg[2]), .B(data_read), .Y(n56) );
  INVX1 U53 ( .A(penable), .Y(n45) );
  AOI21X1 U54 ( .A(bit_period[2]), .B(n50), .C(n57), .Y(n55) );
  OAI22X1 U55 ( .A(n47), .B(n58), .C(n53), .D(n59), .Y(n57) );
  INVX1 U56 ( .A(n46), .Y(n50) );
  OAI21X1 U57 ( .A(n39), .B(n60), .C(n61), .Y(prdata[1]) );
  OAI21X1 U58 ( .A(n62), .B(n63), .C(penable), .Y(n61) );
  OAI22X1 U59 ( .A(n46), .B(n64), .C(n47), .D(n65), .Y(n63) );
  INVX1 U60 ( .A(n66), .Y(n47) );
  OAI21X1 U61 ( .A(n53), .B(n67), .C(n68), .Y(n62) );
  NAND3X1 U62 ( .A(n69), .B(n70), .C(overrun_error_reg), .Y(n68) );
  INVX1 U63 ( .A(n71), .Y(n69) );
  NAND2X1 U64 ( .A(n72), .B(n70), .Y(n53) );
  INVX1 U65 ( .A(rx_data_reg[1]), .Y(n60) );
  INVX1 U66 ( .A(n73), .Y(prdata[0]) );
  AOI22X1 U67 ( .A(penable), .B(n74), .C(rx_data_reg[0]), .D(data_read), .Y(
        n73) );
  OAI21X1 U68 ( .A(n46), .B(n75), .C(n76), .Y(n74) );
  AOI22X1 U69 ( .A(n77), .B(n70), .C(bit_period[8]), .D(n66), .Y(n76) );
  NOR2X1 U70 ( .A(n71), .B(n70), .Y(n66) );
  INVX1 U71 ( .A(n78), .Y(n70) );
  MUX2X1 U72 ( .B(n79), .A(n80), .S(n81), .Y(n77) );
  MUX2X1 U73 ( .B(framing_error_reg), .A(data_ready_reg), .S(n71), .Y(n80) );
  NAND3X1 U74 ( .A(n71), .B(n81), .C(n78), .Y(n46) );
  NAND3X1 U75 ( .A(paddr[0]), .B(n82), .C(n83), .Y(n71) );
  OAI22X1 U76 ( .A(n84), .B(n85), .C(n86), .D(n54), .Y(next_data_size[3]) );
  INVX1 U77 ( .A(data_size[3]), .Y(n54) );
  OAI22X1 U78 ( .A(n84), .B(n87), .C(n86), .D(n59), .Y(next_data_size[2]) );
  INVX1 U79 ( .A(data_size[2]), .Y(n59) );
  OAI22X1 U80 ( .A(n84), .B(n88), .C(n86), .D(n67), .Y(next_data_size[1]) );
  INVX1 U81 ( .A(data_size[1]), .Y(n67) );
  OAI22X1 U82 ( .A(n84), .B(n89), .C(n86), .D(n79), .Y(next_data_size[0]) );
  INVX1 U83 ( .A(data_size[0]), .Y(n79) );
  INVX1 U84 ( .A(n86), .Y(n84) );
  NOR2X1 U85 ( .A(n90), .B(n82), .Y(n86) );
  OAI22X1 U86 ( .A(n88), .B(n91), .C(n92), .D(n65), .Y(next_bit_period[9]) );
  INVX1 U87 ( .A(bit_period[9]), .Y(n65) );
  INVX1 U88 ( .A(n93), .Y(next_bit_period[8]) );
  AOI22X1 U89 ( .A(pwdata[0]), .B(n92), .C(n91), .D(bit_period[8]), .Y(n93) );
  OAI21X1 U90 ( .A(n94), .B(n34), .C(n95), .Y(next_bit_period[7]) );
  NAND2X1 U91 ( .A(pwdata[7]), .B(n94), .Y(n95) );
  INVX1 U92 ( .A(bit_period[7]), .Y(n34) );
  OAI21X1 U93 ( .A(n94), .B(n36), .C(n96), .Y(next_bit_period[6]) );
  NAND2X1 U94 ( .A(pwdata[6]), .B(n94), .Y(n96) );
  INVX1 U95 ( .A(bit_period[6]), .Y(n36) );
  OAI22X1 U96 ( .A(n88), .B(n97), .C(n94), .D(n64), .Y(next_bit_period[1]) );
  INVX1 U97 ( .A(bit_period[1]), .Y(n64) );
  INVX1 U98 ( .A(pwdata[1]), .Y(n88) );
  OAI22X1 U99 ( .A(n85), .B(n91), .C(n92), .D(n52), .Y(next_bit_period[11]) );
  INVX1 U100 ( .A(bit_period[11]), .Y(n52) );
  INVX1 U101 ( .A(pwdata[3]), .Y(n85) );
  OAI22X1 U102 ( .A(n87), .B(n91), .C(n92), .D(n58), .Y(next_bit_period[10])
         );
  INVX1 U103 ( .A(bit_period[10]), .Y(n58) );
  INVX1 U104 ( .A(pwdata[2]), .Y(n87) );
  OAI22X1 U105 ( .A(n89), .B(n97), .C(n94), .D(n75), .Y(next_bit_period[0]) );
  INVX1 U106 ( .A(bit_period[0]), .Y(n75) );
  INVX1 U107 ( .A(pwdata[0]), .Y(n89) );
  INVX1 U108 ( .A(n98), .Y(n110) );
  AOI22X1 U109 ( .A(n92), .B(pwdata[5]), .C(n91), .D(bit_period[13]), .Y(n98)
         );
  INVX1 U110 ( .A(n99), .Y(n111) );
  AOI22X1 U111 ( .A(n92), .B(pwdata[4]), .C(n91), .D(bit_period[12]), .Y(n99)
         );
  INVX1 U112 ( .A(n100), .Y(n112) );
  AOI22X1 U113 ( .A(n94), .B(pwdata[5]), .C(n97), .D(bit_period[5]), .Y(n100)
         );
  INVX1 U114 ( .A(n101), .Y(n113) );
  AOI22X1 U115 ( .A(n94), .B(pwdata[4]), .C(n97), .D(bit_period[4]), .Y(n101)
         );
  INVX1 U116 ( .A(n102), .Y(n114) );
  AOI22X1 U117 ( .A(pwdata[3]), .B(n94), .C(n97), .D(bit_period[3]), .Y(n102)
         );
  INVX1 U118 ( .A(n103), .Y(n115) );
  AOI22X1 U119 ( .A(pwdata[2]), .B(n94), .C(n97), .D(bit_period[2]), .Y(n103)
         );
  INVX1 U120 ( .A(n97), .Y(n94) );
  NAND3X1 U121 ( .A(paddr[1]), .B(n91), .C(n104), .Y(n97) );
  INVX1 U122 ( .A(n90), .Y(n104) );
  INVX1 U123 ( .A(n92), .Y(n91) );
  NOR2X1 U124 ( .A(n90), .B(n105), .Y(n92) );
  NAND3X1 U125 ( .A(pwrite), .B(n106), .C(psel), .Y(n90) );
  INVX1 U126 ( .A(n32), .Y(n106) );
  MUX2X1 U127 ( .B(n107), .A(n82), .S(paddr[1]), .Y(n32) );
  NOR2X1 U128 ( .A(paddr[0]), .B(n82), .Y(n107) );
  INVX1 U129 ( .A(n39), .Y(data_read) );
  NAND3X1 U130 ( .A(penable), .B(n78), .C(n72), .Y(n39) );
  INVX1 U131 ( .A(n81), .Y(n72) );
  NAND3X1 U132 ( .A(paddr[2]), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U133 ( .A(n108), .B(n109), .Y(n78) );
  OAI21X1 U134 ( .A(n82), .B(n105), .C(paddr[1]), .Y(n109) );
  INVX1 U135 ( .A(paddr[0]), .Y(n105) );
  INVX1 U136 ( .A(paddr[2]), .Y(n82) );
  INVX1 U137 ( .A(n83), .Y(n108) );
  NOR2X1 U138 ( .A(n31), .B(pwrite), .Y(n83) );
  INVX1 U139 ( .A(psel), .Y(n31) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_packet_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_packet_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_packet_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 nine_shift ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N24,
         N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, n1,
         n2, n3, n4, n5, n6, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109;

  DFFSR \count_reg[0]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_reg[1]  ( .D(n108), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_reg[2]  ( .D(n107), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_reg[3]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_reg[4]  ( .D(n105), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_reg[5]  ( .D(n104), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_reg[6]  ( .D(n103), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_reg[7]  ( .D(n102), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_reg[8]  ( .D(n101), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_reg[9]  ( .D(n100), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_reg[10]  ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_reg[11]  ( .D(n98), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_reg[12]  ( .D(n97), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR rollover_flag_reg ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_reg[13]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 add_50_aco ( .A({N37, N36, N35, N34, 
        N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}), .SUM({N19, N18, 
        N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6}) );
  INVX2 U4 ( .A(n4), .Y(n50) );
  INVX2 U5 ( .A(n30), .Y(n53) );
  INVX1 U20 ( .A(n1), .Y(n95) );
  AOI22X1 U21 ( .A(n2), .B(n3), .C(rollover_flag), .D(n4), .Y(n1) );
  NOR2X1 U22 ( .A(n5), .B(n6), .Y(n3) );
  NAND3X1 U23 ( .A(n22), .B(n23), .C(n24), .Y(n6) );
  NOR2X1 U24 ( .A(n25), .B(n26), .Y(n24) );
  XOR2X1 U25 ( .A(rollover_val[10]), .B(N16), .Y(n26) );
  XOR2X1 U26 ( .A(rollover_val[9]), .B(N15), .Y(n25) );
  XOR2X1 U27 ( .A(n27), .B(rollover_val[11]), .Y(n23) );
  XOR2X1 U28 ( .A(n28), .B(rollover_val[12]), .Y(n22) );
  NAND3X1 U29 ( .A(n29), .B(n30), .C(n31), .Y(n5) );
  NOR2X1 U30 ( .A(n32), .B(n33), .Y(n31) );
  XOR2X1 U31 ( .A(rollover_val[8]), .B(N14), .Y(n33) );
  XOR2X1 U32 ( .A(rollover_val[7]), .B(N13), .Y(n32) );
  XOR2X1 U33 ( .A(n34), .B(rollover_val[6]), .Y(n29) );
  NOR2X1 U34 ( .A(n35), .B(n36), .Y(n2) );
  NAND3X1 U35 ( .A(n37), .B(n38), .C(n39), .Y(n36) );
  XOR2X1 U36 ( .A(n40), .B(rollover_val[5]), .Y(n39) );
  XOR2X1 U37 ( .A(n41), .B(rollover_val[3]), .Y(n38) );
  XOR2X1 U38 ( .A(n42), .B(rollover_val[4]), .Y(n37) );
  NAND3X1 U39 ( .A(n43), .B(n44), .C(n45), .Y(n35) );
  NOR2X1 U40 ( .A(n46), .B(n47), .Y(n45) );
  XOR2X1 U41 ( .A(rollover_val[0]), .B(N6), .Y(n47) );
  XOR2X1 U42 ( .A(rollover_val[13]), .B(N19), .Y(n46) );
  XOR2X1 U43 ( .A(n48), .B(rollover_val[1]), .Y(n44) );
  XOR2X1 U44 ( .A(n49), .B(rollover_val[2]), .Y(n43) );
  OAI22X1 U45 ( .A(n50), .B(n51), .C(n52), .D(n53), .Y(n96) );
  INVX1 U46 ( .A(N19), .Y(n52) );
  OAI22X1 U47 ( .A(n50), .B(n54), .C(n28), .D(n53), .Y(n97) );
  INVX1 U48 ( .A(N18), .Y(n28) );
  OAI22X1 U49 ( .A(n50), .B(n55), .C(n27), .D(n53), .Y(n98) );
  INVX1 U50 ( .A(N17), .Y(n27) );
  OAI22X1 U51 ( .A(n50), .B(n56), .C(n57), .D(n53), .Y(n99) );
  INVX1 U52 ( .A(N16), .Y(n57) );
  OAI22X1 U53 ( .A(n50), .B(n58), .C(n59), .D(n53), .Y(n100) );
  INVX1 U54 ( .A(N15), .Y(n59) );
  OAI22X1 U55 ( .A(n50), .B(n60), .C(n61), .D(n53), .Y(n101) );
  INVX1 U56 ( .A(N14), .Y(n61) );
  OAI22X1 U57 ( .A(n50), .B(n62), .C(n63), .D(n53), .Y(n102) );
  INVX1 U58 ( .A(N13), .Y(n63) );
  OAI22X1 U59 ( .A(n50), .B(n64), .C(n34), .D(n53), .Y(n103) );
  INVX1 U60 ( .A(N12), .Y(n34) );
  OAI22X1 U61 ( .A(n50), .B(n65), .C(n40), .D(n53), .Y(n104) );
  INVX1 U62 ( .A(N11), .Y(n40) );
  OAI22X1 U63 ( .A(n50), .B(n66), .C(n42), .D(n53), .Y(n105) );
  INVX1 U64 ( .A(N10), .Y(n42) );
  OAI22X1 U65 ( .A(n50), .B(n67), .C(n41), .D(n53), .Y(n106) );
  INVX1 U66 ( .A(N9), .Y(n41) );
  OAI22X1 U67 ( .A(n50), .B(n68), .C(n49), .D(n53), .Y(n107) );
  INVX1 U68 ( .A(N8), .Y(n49) );
  OAI22X1 U69 ( .A(n50), .B(n69), .C(n48), .D(n53), .Y(n108) );
  INVX1 U70 ( .A(N7), .Y(n48) );
  OAI22X1 U71 ( .A(n50), .B(n70), .C(n71), .D(n53), .Y(n109) );
  NOR2X1 U72 ( .A(n4), .B(clear), .Y(n30) );
  INVX1 U73 ( .A(N6), .Y(n71) );
  NOR2X1 U74 ( .A(count_enable), .B(clear), .Y(n4) );
  NOR2X1 U75 ( .A(n72), .B(n51), .Y(N37) );
  NOR2X1 U76 ( .A(n72), .B(n54), .Y(N36) );
  INVX1 U77 ( .A(count_out[12]), .Y(n54) );
  NOR2X1 U78 ( .A(n72), .B(n55), .Y(N35) );
  INVX1 U79 ( .A(count_out[11]), .Y(n55) );
  NOR2X1 U80 ( .A(n72), .B(n56), .Y(N34) );
  INVX1 U81 ( .A(count_out[10]), .Y(n56) );
  NOR2X1 U82 ( .A(n72), .B(n58), .Y(N33) );
  INVX1 U83 ( .A(count_out[9]), .Y(n58) );
  NOR2X1 U84 ( .A(n72), .B(n60), .Y(N32) );
  INVX1 U85 ( .A(count_out[8]), .Y(n60) );
  NOR2X1 U86 ( .A(n72), .B(n62), .Y(N31) );
  NOR2X1 U87 ( .A(n72), .B(n64), .Y(N30) );
  NOR2X1 U88 ( .A(n72), .B(n65), .Y(N29) );
  INVX1 U89 ( .A(count_out[5]), .Y(n65) );
  NOR2X1 U90 ( .A(n72), .B(n66), .Y(N28) );
  INVX1 U91 ( .A(count_out[4]), .Y(n66) );
  NOR2X1 U92 ( .A(n72), .B(n67), .Y(N27) );
  INVX1 U93 ( .A(count_out[3]), .Y(n67) );
  NOR2X1 U94 ( .A(n72), .B(n68), .Y(N26) );
  INVX1 U95 ( .A(count_out[2]), .Y(n68) );
  NOR2X1 U96 ( .A(n72), .B(n69), .Y(N25) );
  INVX1 U97 ( .A(count_out[1]), .Y(n69) );
  NOR2X1 U98 ( .A(n72), .B(n70), .Y(N24) );
  AND2X1 U99 ( .A(n73), .B(n74), .Y(n72) );
  NOR2X1 U100 ( .A(n75), .B(n76), .Y(n74) );
  NAND3X1 U101 ( .A(n77), .B(n78), .C(n79), .Y(n76) );
  XNOR2X1 U102 ( .A(count_out[11]), .B(rollover_val[11]), .Y(n79) );
  XNOR2X1 U103 ( .A(count_out[12]), .B(rollover_val[12]), .Y(n78) );
  XNOR2X1 U104 ( .A(count_out[10]), .B(rollover_val[10]), .Y(n77) );
  NAND3X1 U105 ( .A(n80), .B(n81), .C(n82), .Y(n75) );
  NOR2X1 U106 ( .A(n83), .B(n84), .Y(n82) );
  XNOR2X1 U107 ( .A(rollover_val[7]), .B(n62), .Y(n84) );
  INVX1 U108 ( .A(count_out[7]), .Y(n62) );
  XNOR2X1 U109 ( .A(rollover_val[6]), .B(n64), .Y(n83) );
  INVX1 U110 ( .A(count_out[6]), .Y(n64) );
  XNOR2X1 U111 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n81) );
  XNOR2X1 U112 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n80) );
  NOR2X1 U113 ( .A(n85), .B(n86), .Y(n73) );
  NAND3X1 U114 ( .A(n87), .B(n88), .C(n89), .Y(n86) );
  XNOR2X1 U115 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n89) );
  XNOR2X1 U116 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n88) );
  XNOR2X1 U117 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n87) );
  NAND3X1 U118 ( .A(n90), .B(n91), .C(n92), .Y(n85) );
  NOR2X1 U119 ( .A(n93), .B(n94), .Y(n92) );
  XNOR2X1 U120 ( .A(rollover_val[13]), .B(n51), .Y(n94) );
  INVX1 U121 ( .A(count_out[13]), .Y(n51) );
  XNOR2X1 U122 ( .A(rollover_val[0]), .B(n70), .Y(n93) );
  INVX1 U123 ( .A(count_out[0]), .Y(n70) );
  XNOR2X1 U124 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n91) );
  XNOR2X1 U125 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n90) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n39, n40, n41, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38;

  DFFSR \count_reg[0]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_reg[1]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_reg[2]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_reg[3]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U8 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n37) );
  OAI22X1 U9 ( .A(n5), .B(n2), .C(n6), .D(n4), .Y(n38) );
  INVX1 U10 ( .A(n12), .Y(n41) );
  AOI22X1 U11 ( .A(count_out[0]), .B(n13), .C(n14), .D(n15), .Y(n12) );
  OAI22X1 U12 ( .A(n16), .B(n2), .C(n17), .D(n4), .Y(n40) );
  INVX1 U13 ( .A(n15), .Y(n4) );
  INVX1 U14 ( .A(n13), .Y(n2) );
  OAI21X1 U15 ( .A(n18), .B(n19), .C(n20), .Y(n39) );
  NAND2X1 U16 ( .A(rollover_flag), .B(n13), .Y(n20) );
  NAND2X1 U17 ( .A(n21), .B(n22), .Y(n19) );
  XOR2X1 U18 ( .A(n3), .B(rollover_val[3]), .Y(n22) );
  XOR2X1 U19 ( .A(n23), .B(n24), .Y(n3) );
  NOR2X1 U20 ( .A(n25), .B(n1), .Y(n24) );
  INVX1 U21 ( .A(count_out[3]), .Y(n1) );
  NAND2X1 U22 ( .A(n26), .B(n27), .Y(n23) );
  XOR2X1 U23 ( .A(n17), .B(rollover_val[2]), .Y(n21) );
  XNOR2X1 U24 ( .A(n27), .B(n26), .Y(n17) );
  NOR2X1 U25 ( .A(n14), .B(n5), .Y(n26) );
  NOR2X1 U26 ( .A(n16), .B(n25), .Y(n27) );
  INVX1 U27 ( .A(count_out[2]), .Y(n16) );
  NAND3X1 U28 ( .A(n15), .B(n28), .C(n29), .Y(n18) );
  XOR2X1 U29 ( .A(rollover_val[1]), .B(n6), .Y(n29) );
  XOR2X1 U30 ( .A(n14), .B(n30), .Y(n6) );
  NOR2X1 U31 ( .A(n25), .B(n5), .Y(n30) );
  INVX1 U32 ( .A(n31), .Y(n25) );
  XNOR2X1 U33 ( .A(rollover_val[0]), .B(n14), .Y(n28) );
  NAND2X1 U34 ( .A(count_out[0]), .B(n31), .Y(n14) );
  NAND3X1 U35 ( .A(n32), .B(n33), .C(n34), .Y(n31) );
  NOR2X1 U36 ( .A(n35), .B(n36), .Y(n34) );
  XNOR2X1 U37 ( .A(rollover_val[1]), .B(n5), .Y(n36) );
  INVX1 U38 ( .A(count_out[1]), .Y(n5) );
  XOR2X1 U39 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n35) );
  XNOR2X1 U40 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n33) );
  XNOR2X1 U41 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n32) );
  NOR2X1 U42 ( .A(n13), .B(clear), .Y(n15) );
  NOR2X1 U43 ( .A(count_enable), .B(clear), .Y(n13) );
endmodule


module timer ( clk, n_rst, enable_timer, bit_period, data_size, shift_strobe, 
        packet_done );
  input [13:0] bit_period;
  input [3:0] data_size;
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5;

  flex_counter_NUM_CNT_BITS14 shift_strober ( .clk(clk), .n_rst(n_rst), 
        .clear(n4), .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_strobe) );
  flex_counter_NUM_CNT_BITS4 packet_sensor ( .clk(clk), .n_rst(n_rst), .clear(
        n4), .count_enable(shift_strobe), .rollover_val({\_2_net_[3] , 
        \_2_net_[2] , \_2_net_[1] , n5}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(enable_timer), .Y(n4) );
  INVX1 U3 ( .A(data_size[0]), .Y(n5) );
  XOR2X1 U4 ( .A(data_size[3]), .B(n1), .Y(\_2_net_[3] ) );
  NOR2X1 U5 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U6 ( .A(n3), .B(n2), .Y(\_2_net_[2] ) );
  NAND2X1 U7 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U8 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U9 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  wire   [2:0] state;
  wire   [2:0] next_state;
  assign enable_timer = next_state[1];

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  INVX1 U6 ( .A(n4), .Y(sbc_enable) );
  INVX1 U7 ( .A(n5), .Y(sbc_clear) );
  OAI21X1 U8 ( .A(framing_error), .B(n4), .C(n6), .Y(next_state[2]) );
  NAND3X1 U9 ( .A(n7), .B(n8), .C(state[2]), .Y(n6) );
  NAND2X1 U10 ( .A(n5), .B(n9), .Y(next_state[1]) );
  NAND3X1 U11 ( .A(n8), .B(n10), .C(state[0]), .Y(n5) );
  OAI21X1 U12 ( .A(framing_error), .B(n4), .C(n11), .Y(next_state[0]) );
  INVX1 U13 ( .A(n12), .Y(n11) );
  OAI21X1 U14 ( .A(n13), .B(n9), .C(n14), .Y(n12) );
  OAI21X1 U15 ( .A(new_packet_detected), .B(state[2]), .C(n15), .Y(n14) );
  NOR2X1 U16 ( .A(state[1]), .B(state[0]), .Y(n15) );
  NAND3X1 U17 ( .A(n7), .B(n10), .C(state[1]), .Y(n9) );
  INVX1 U18 ( .A(state[0]), .Y(n7) );
  INVX1 U19 ( .A(packet_done), .Y(n13) );
  NAND3X1 U20 ( .A(state[0]), .B(n10), .C(state[1]), .Y(n4) );
  NOR2X1 U21 ( .A(n10), .B(n16), .Y(load_buffer) );
  NAND2X1 U22 ( .A(state[0]), .B(n8), .Y(n16) );
  INVX1 U23 ( .A(state[1]), .Y(n8) );
  INVX1 U24 ( .A(state[2]), .Y(n10) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, data_size, bit_period, serial_in, data_read, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   new_packet_detected, shift_strobe, stop_bit, sbc_clear, sbc_enable,
         enable_timer, packet_done, load_buffer, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [7:0] packet_data;
  wire   [7:0] new_packet_size;

  start_bit_det never ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .new_packet_detected(new_packet_detected) );
  sr_9bit gonna ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  stop_bit_chk give ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  timer you ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .bit_period(bit_period), .data_size(data_size), .shift_strobe(
        shift_strobe), .packet_done(packet_done) );
  rcu up ( .clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  rx_data_buff rickastley ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), .packet_data(new_packet_size), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(new_packet_size[7]) );
  OAI22X1 U3 ( .A(n2), .B(n3), .C(n1), .D(n4), .Y(new_packet_size[6]) );
  OAI22X1 U4 ( .A(n4), .B(n3), .C(n1), .D(n5), .Y(new_packet_size[5]) );
  OAI21X1 U5 ( .A(n2), .B(n6), .C(n7), .Y(new_packet_size[4]) );
  AOI22X1 U6 ( .A(packet_data[4]), .B(n8), .C(packet_data[5]), .D(n9), .Y(n7)
         );
  INVX1 U7 ( .A(packet_data[7]), .Y(n2) );
  OAI21X1 U8 ( .A(n4), .B(n6), .C(n10), .Y(new_packet_size[3]) );
  AOI22X1 U9 ( .A(packet_data[3]), .B(n8), .C(packet_data[4]), .D(n9), .Y(n10)
         );
  INVX1 U10 ( .A(packet_data[6]), .Y(n4) );
  OAI21X1 U11 ( .A(n5), .B(n6), .C(n11), .Y(new_packet_size[2]) );
  AOI22X1 U12 ( .A(packet_data[2]), .B(n8), .C(packet_data[3]), .D(n9), .Y(n11) );
  INVX1 U13 ( .A(packet_data[5]), .Y(n5) );
  OAI21X1 U14 ( .A(n12), .B(n6), .C(n13), .Y(new_packet_size[1]) );
  AOI22X1 U15 ( .A(packet_data[1]), .B(n8), .C(packet_data[2]), .D(n9), .Y(n13) );
  INVX1 U16 ( .A(packet_data[4]), .Y(n12) );
  OAI21X1 U17 ( .A(n6), .B(n14), .C(n15), .Y(new_packet_size[0]) );
  AOI22X1 U18 ( .A(packet_data[0]), .B(n8), .C(packet_data[1]), .D(n9), .Y(n15) );
  INVX1 U19 ( .A(n3), .Y(n9) );
  INVX1 U20 ( .A(n1), .Y(n8) );
  NAND2X1 U21 ( .A(n6), .B(n3), .Y(n1) );
  NAND3X1 U22 ( .A(data_size[2]), .B(data_size[1]), .C(n16), .Y(n3) );
  NOR2X1 U23 ( .A(data_size[3]), .B(n17), .Y(n16) );
  INVX1 U24 ( .A(data_size[0]), .Y(n17) );
  INVX1 U25 ( .A(packet_data[3]), .Y(n14) );
  NAND3X1 U26 ( .A(data_size[2]), .B(data_size[0]), .C(n18), .Y(n6) );
  NOR2X1 U27 ( .A(data_size[3]), .B(data_size[1]), .Y(n18) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave joe ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), .data_ready(
        data_ready), .overrun_error(overrun_error), .framing_error(
        framing_error), .data_read(data_read), .psel(psel), .paddr(paddr), 
        .penable(penable), .pwrite(pwrite), .pwdata(pwdata), .prdata(prdata), 
        .pslverr(pslverr), .data_size(data_size), .bit_period(bit_period) );
  rcv_block byron ( .clk(clk), .n_rst(n_rst), .data_size(data_size), 
        .bit_period(bit_period), .serial_in(serial_in), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule

