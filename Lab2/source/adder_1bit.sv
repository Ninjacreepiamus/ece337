// $Id: $
// File name:   adder_1bit.sv
// Created:     1/20/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a 1-bit adder module

module adder_1bit(input logic a, input logic b, input carry_in, output sum, output carry_out);
		assign sum = a ^ b ^ carry_in;
		assign carry_out = (a & b) | (a & carry_in) | (b & carry_out);
endmodule