/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Jan 20 10:15:22 2022
/////////////////////////////////////////////////////////////


module adder_1bit ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n3, n5, n6, n7;

  OAI21X1 U4 ( .A(a), .B(carry_out), .C(b), .Y(n3) );
  XOR2X1 U7 ( .A(a), .B(n5), .Y(sum) );
  XOR2X1 U8 ( .A(carry_in), .B(b), .Y(n5) );
  OAI21X1 U9 ( .A(n6), .B(n7), .C(n3), .Y(carry_out) );
  INVX1 U10 ( .A(a), .Y(n7) );
  INVX1 U11 ( .A(carry_in), .Y(n6) );
endmodule

