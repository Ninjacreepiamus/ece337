// $Id: $
// File name:   sensor_s.sv
// Created:     1/20/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a sensor module, I believe

module sensor_s(input logic [3:0] sensors, output logic error);
  logic and1;
  logic and2;
  logic or1;
  logic or2;

  AND2X1 v1(.Y(and1), .A(sensors[2]), .B(sensors[1]));
  AND2X1 v2(.Y(and2), .A(sensors[3]), .B(sensors[1]));
  OR2X1 v3(.Y(or1), .A(sensors[0]), .B(and1));
  OR2X1 v4(.Y(or2), .A(and1), .B(and2));
  OR2X1 v5(.Y(error), .A(or1), .B(or2));

endmodule