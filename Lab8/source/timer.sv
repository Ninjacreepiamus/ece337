// $Id: $
// File name:   timer.sv
// Created:     2/22/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is the timing controller, which will keep trackof the serial_in data.

module timer(
    input logic clk,
    input logic n_rst,
    input logic enable_timer,
    input logic [13:0] bit_period,
    input logic [3:0] data_size,
    output logic shift_strobe,
    output logic packet_done
);
    logic [13:0] count_1;
    logic [3:0] count_2;

    //This is the first counter that enables shift strobe when 10 clockl counts have occured
    flex_counter #(.NUM_CNT_BITS(14)) 
    shift_strober(
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(~enable_timer), 
        .count_enable(enable_timer), //bit period
        .rollover_val(bit_period),
        .count_out(count_1), 
        .rollover_flag(shift_strobe)
    );
    
    flex_counter #(.NUM_CNT_BITS(4)) 
    packet_sensor(
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(~enable_timer), 
        .count_enable(shift_strobe), 
        .rollover_val(data_size + 4'b1), //data size
        .count_out(count_2), 
        .rollover_flag(packet_done)
    );

endmodule