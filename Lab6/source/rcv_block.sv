// $Id: $
// File name:   rcv_block.sv
// Created:     2/19/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is our RCV block for our UART receiver.
// 

module rcv_block(
    input logic clk,
    input logic n_rst,
    input logic serial_in,      // Goes into Shift Register and Start-Bit Detector
    input logic data_read,      // Goes into RX Data Buffer
    output logic [7:0] rx_data,  // Comes from RX Data Buffer... fixed it and turned it from input to output
    output logic data_ready,    // Comes from RX Data Buffer
    output logic overrun_error, // Comes from RX Data Buffer
    output logic framing_error // Comes from Stop-Bit Checker
);
    logic new_packet_detected; // output from Start Bit Detector
    logic [7:0] packet_data; // output from Shift Register
    logic stop_bit; // output from Shift Register and input to Stop-Bit Checker
    logic sbc_clear; // output from RCU and input to Stop-Bit Checker
    logic sbc_enable; // output from RCU and input to Stop-Bit Checker
    logic enable_timer; // output from RCU and input to Timing Controller
    logic shift_strobe; // output from Timing Controller and input to Shift Register
    logic packet_done; // output from Timing Controller and input to RCU
    logic load_buffer; // output from RCU and input to RX Data Buffer

    start_bit_det never(
        .clk(clk),
        .n_rst(n_rst),
        .serial_in(serial_in),
        .new_packet_detected(new_packet_detected)
    );

    sr_9bit gonna(
        .clk(clk),
        .n_rst(n_rst),
        .shift_strobe(shift_strobe),
        .serial_in(serial_in),
        .packet_data(packet_data),
        .stop_bit(stop_bit)
    );

    stop_bit_chk give(
        .clk(clk),
        .n_rst(n_rst),
        .sbc_clear(sbc_clear),
        .sbc_enable(sbc_enable),
        .stop_bit(stop_bit),
        .framing_error(framing_error)
    );

    timer you(
        .clk(clk),
        .n_rst(n_rst),
        .enable_timer(enable_timer),
        .shift_strobe(shift_strobe),
        .packet_done(packet_done)
    );

    rcu up(
        .clk(clk),
        .n_rst(n_rst),
        .new_packet_detected(new_packet_detected),
        .packet_done(packet_done),
        .framing_error(framing_error),
        .sbc_clear(sbc_clear),
        .sbc_enable(sbc_enable),
        .load_buffer(load_buffer),
        .enable_timer(enable_timer)
    );

    rx_data_buff rickastley(
        .clk(clk),
        .n_rst(n_rst),
        .load_buffer(load_buffer),
        .packet_data(packet_data),
        .data_read(data_read),
        .rx_data(rx_data),
        .data_ready(data_ready),
        .overrun_error(overrun_error)
    );

endmodule