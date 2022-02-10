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
  logic [(NUM_BITS - 1):0] temp;
  logic next_serial;

  always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) begin
      serial_out <= '1;
      temp <= '1;
    end
    else begin
      temp <= next_data;
      serial_out <= next_serial;
    end
  end

  always_comb begin
    next_data = temp;
    next_serial = serial_out;
      if(load_enable) begin
        next_data = parallel_in;
      end
      else begin
        if(shift_enable) begin
            next_data = {1'b1, next_data[(NUM_BITS - 1):1]};
            if(SHIFT_MSB == 1)
              next_serial = next_data[(NUM_BITS - 1)];
            else
              next_serial = next_data[0];
        end
      end
  end
endmodule