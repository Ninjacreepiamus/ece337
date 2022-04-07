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
    logic cnt_up;
    logic clear;
    logic [2:0] op;
    logic [3:0] src1;
    logic [3:0] src2;
    logic [3:0] dest;
    logic [16:0] outreg_data;
    logic overflow;

    controller whooop_whoop(
        .clk(clk),
        .n_rst(n_reset),
        .dr(data_ready),
        .lc(load_coeff),
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

    counter thats_the(
        .clk(clk),
        .n_rst(n_reset),
        .cnt_up(cnt_up),
        .clear(clear),
        .one_k_samples(one_k_samples)
    );

    datapath sound_of_the(
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

    magnitude police(
        .in(outreg_data),
        .out(fir_out)
    );

endmodule