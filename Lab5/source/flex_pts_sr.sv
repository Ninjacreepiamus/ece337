// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/10/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a flexible and scalable parallel to series shift register
// /
// /

module flex_pts_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input logic clk,
    input logic n_rst,
    input logic shift_enable,
    input logic load_enable,
    input logic [(NUM_BITS - 1):0] parallel_in,
    output logic serial_out
);
  logic [(NUM_BITS - 1):0] next_data;
  always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
      parallel_in <= 'b0;
    else
      parallel_in <= next_data;
  end

  always_comb begin
      if(load_enable) begin
        next_data = parallel_in;
        serial_out = next_data[3];
      end
      else begin
        if(shift_enable)
            next_data = {1'b0, next_data[15:1]};
        else
            next_data = {1'b1, next_data[15:1]};
        serial_out = next_data[3];
      end
  end
endmodule