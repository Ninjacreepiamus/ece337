// $Id: $
// File name:   sensor_d.sv
// Created:     1/20/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a dataflow style sensor error detector design

module sensor_d(input logic [3:0] sensors, output logic error);
  assign error = sensors[0] | (sensors[2] & sensors[1]) | (sensors[3] & sensors[1]);
endmodule