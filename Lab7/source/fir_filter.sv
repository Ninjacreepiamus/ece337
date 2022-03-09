// $Id: $
// File name:   fir_filter.sv
// Created:     3/8/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is the fir_filter part of the Lab 7 design that puts all the blocks together.

module fir_filter(
    input logic clk,
    input logic n_reset,
    input logic [15:0] sample_data,
    input logic [15:0] fir_coefficient,
    input logic load_coeff,
    input logic data_ready,
    output logic one_k_samples,
    output logic modwait,
    output logic [15:0] fir_out,
    output logic err
);
    logic data_sync;
    logic load_sync;
    logic cnt_up;
    logic clear;
    logic [2:0] op;
    logic [3:0] src1;
    logic [3:0] src2;
    logic [3:0] dest;
    logic [16:0] outreg_data;
    logic overflow;

    sync_low my_friend_here(
        .clk(clk),
        .n_rst(n_reset),
        .async_in(data_ready),
        .sync_out(data_sync)
    );

    sync_low justin(
        .clk(clk),
        .n_rst(n_reset),
        .async_in(load_coeff),
        .sync_out(load_sync)
    );
    
    controller hes_already_taken(
        .clk(clk),
        .n_rst(n_reset),
        .dr(data_sync),
        .lc(load_sync),
        .overflow(overflow),
        .cnt_up(cnt_up),
        .clear(clear),
        .modwait(modwait),
        .op(op),
        .src1(src1),
        .src2(src2),
        .dest(dest),
        .err(err)
    );

    counter And_hes_cracked(
        .clk(clk),
        .n_rst(n_reset),
        .cnt_up(cnt_up),
        .clear(clear),
        .one_k_samples(one_k_samples)
    );

    datapath at_fortnite_my_guy(
        .clk(clk),
        .n_reset(n_reset),
        .op(op),
        .src1(src1),
        .src2(src2),
        .dest(dest),
        .ext_data1(sample_data),
        .ext_data2(fir_coefficient),
        .outreg_data(outreg_data),
        .overflow(overflow)
    );

    magnitude euughhhhh(
        .in(outreg_data),
        .out(fir_out)
    );

endmodule