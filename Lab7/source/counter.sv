// $Id: $
// File name:   counter.sv
// Created:     3/8/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is the counter unit for Lab 7. 
// It counts how many samples have been processed for the 
// current set of coefficients since the last assertion or power on.

module counter(
    input logic clk,
    input logic n_rst,
    input logic cnt_up,
    input logic clear,
    output logic one_k_samples
);
    logic [9:0] count_value; //Internal signal that holds counter value

    flex_counter #(.NUM_CNT_BITS(10))
    count_to_a_thousand(
        .clk(clk),
        .n_rst(n_rst),
        .clear(clear),
        .count_enable(cnt_up),
        .rollover_val(10'd1001), // Rollover value is 1000
        .count_out(count_value),
        .rollover_flag(one_k_samples) // Whenever 1000 samples are hit
    );
endmodule