// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/28/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is the full design module that connects the dedicated AHB-Lite Slave interface and FIR Filter modules together to form the overall SoC accelerator module.

module ahb_lite_fir_filter(
    input logic clk,
    input logic n_rst,
    input logic hsel,
    input logic [3:0] haddr,
    input logic hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp
);
    logic [1:0] coefficient_num;
    logic [15:0] sample_data;
    logic data_ready;
    logic new_coefficient_set;
    logic [15:0] fir_coefficient;
    logic modwait;
    logic [15:0] fir_out;
    logic err;
    logic load_coeff;
    logic one_k_samples;
    logic clear_new_coefficient;

    ahb_lite_slave whoever_threw_that_paper(
        .clk(clk),
        .n_rst(n_rst),
        .sample_data(sample_data),
        .data_ready(data_ready),
        .new_coefficient_set(new_coefficient_set),
        .coefficient_num(coefficient_num),
        .fir_coefficient(fir_coefficient),
        .modwait(modwait),
        .fir_out(fir_out),
        .err(err),
        .hsel(hsel),
        .haddr(haddr),
        .hsize(hsize),
        .htrans(htrans),
        .hwrite(hwrite),
        .hwdata(hwdata),
        .clear_new_coefficient(clear_new_coefficient),
        .hrdata(hrdata),
        .hresp(hresp)
    );

    coefficient_loader your_moms(
        .clk(clk),
        .n_reset(n_rst),
        .new_coefficient_set(new_coefficient_set),
        .modwait(modwait),
        .load_coeff(load_coeff),
        .coefficient_num(coefficient_num),
        .clear_new_coefficient(clear_new_coefficient)
    );

    fir_filter a_ho(
        .clk(clk),
        .n_reset(n_rst),
        .sample_data(sample_data),
        .fir_coefficient(fir_coefficient),
        .load_coeff(load_coeff),
        .data_ready(data_ready),
        .one_k_samples(one_k_samples),
        .modwait(modwait),
        .fir_out(fir_out),
        .err(err)
    );

endmodule