// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/10/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a flexible and scalable serial-to-parallel shift register

module flex_stp_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input logic clk,
    input logic n_rst,
    input logic shift_enable,
    input logic serial_in,
    output logic [(NUM_BITS - 1):0] parallel_out
);
  logic [(NUM_BITS - 1):0] next_data;
  always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst)
      parallel_out <= 'b0;
    else
      parallel_out <= next_data;
  end

  always_comb begin
    next_data = parallel_out;
    if(shift_enable) begin
      if(SHIFT_MSB == 1) begin
        next_data = {serial_in, parallel_out[7:1]};
      end
      else begin
        next_data = {parallel_out[6:0], serial_in};
      end
    end
  end
endmodule