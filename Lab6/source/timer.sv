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
    output logic shift_strobe,
    output logic packet_done
);
    logic [3:0] count_1;
    logic [3:0] count_2;

    //This is the first counter that enables shift strobe when 10 clockl counts have occured
    flex_counter #(.NUM_CNT_BITS(4)) 
    shift_strober(
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(~enable_timer), 
        .count_enable(enable_timer), 
        .rollover_val(4'd10),  //Maybe add one more state in RCU for delay if needed
        .count_out(count_1), 
        .rollover_flag(shift_strobe)
    );
    
    flex_counter #(.NUM_CNT_BITS(4)) 
    packet_sensor(
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(~enable_timer), 
        .count_enable(shift_strobe), 
        .rollover_val(4'd9), 
        .count_out(count_2), 
        .rollover_flag(packet_done)
    );

endmodule