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

  always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) begin
      temp <= '1;
    end
    else begin
      temp <= next_data;
    end
  end

  always_comb begin
    next_data = temp;
      if(load_enable) begin
        next_data = parallel_in;
      end
      else begin
        if(shift_enable) begin
            if(SHIFT_MSB == 1) begin
              next_data = {next_data[(NUM_BITS - 2):0], 1'b1};
            end
            else begin
              next_data = {1'b1, next_data[(NUM_BITS - 1):1]};
            end
        end
      end
  end

  always_comb begin
    if(SHIFT_MSB == 1)
      serial_out = temp[(NUM_BITS - 1)];
    else
      serial_out = temp[0];
  end

endmodule