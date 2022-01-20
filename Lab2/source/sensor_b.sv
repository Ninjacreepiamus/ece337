// $Id: $
// File name:   sensor_b.sv
// Created:     1/20/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a behavioral version of the same code that I have written three times

module sensor_b(input logic [3:0] sensors, output logic error);
  always_comb begin
    error = sensors[0] | (sensors[2] & sensors[1]) | (sensors[3] & sensors[1]);
  end
endmodule