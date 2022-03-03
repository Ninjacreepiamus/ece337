// $Id: $
// File name:   sr_9bit.sv
// Created:     2/22/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is simply a wrapper file for the stp shift register
//              from a previous lab

module sr_9bit(
    input logic clk,
    input logic n_rst,
    input logic shift_strobe,
    input logic serial_in,
    output logic [7:0] packet_data,
    output logic stop_bit
);
    logic [8:0] full_data;

    flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0))
    nine_shift(
        .clk(clk),
        .n_rst(n_rst),
        .shift_enable(shift_strobe),
        .serial_in(serial_in),
        .parallel_out(full_data)
    );

    always_comb begin
        stop_bit = full_data[8];
        packet_data = full_data[7:0];
    end
endmodule