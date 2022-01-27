// $Id: $
// File name:   adder_1bit.sv
// Created:     1/20/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a 1-bit adder module

`timescale 1ns / 100ps
module adder_1bit(input logic a, input logic b, input carry_in, output logic sum, output logic carry_out);
	always @(a) begin
		assert((a == 1'b1) || (a == 1'b0))
			else $error("Input 'a' of component is not a digital logic value");
	end
		
	always @(b) begin
		assert((b == 1'b1) || (b == 1'b0))
		else $error("Input 'b' of component is not a digital logic value");
	end
	
	assign sum = (a ^ b) ^ carry_in;
	assign carry_out = (a & b) | (a & carry_in) | (b & carry_in);
endmodule