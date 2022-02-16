// $Id: $
// File name:   moore.sv
// Created:     2/15/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a 1101 sequence detector in a Moore Machine format

module moore(input logic clk, input logic n_rst, input logic i, output logic o);
  typedef enum logic [2:0] {S0, S1, S2, S3, S4} state_t;
  state_t state;
  state_t next_state;
  logic next_o;

  always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) begin
      o <= 1'b0;
      state <= S0;
    end
    else begin
      o <= next_o;
      state <= next_state;
    end
  end

  always_comb begin
    case(state)
      S0: begin
        next_o = 1'b0;
        if(i == 1) begin
          next_state = S1;
        end
        else begin
          next_state = S0;
        end
      end

      S1: begin
        next_o = 1'b0;
        if(i == 1) begin
          next_state = S2;
        end
        else begin
          next_state = S0;
        end
      end

      S2: begin
        next_o = 1'b0;
        if(i == 1) begin
          next_state = S2;
        end
        else begin
          next_state = S3;
        end
      end

      S3: begin
        if(i == 1) begin
          next_state = S4;
          next_o = 1'b1;
        end
        else begin
          next_state = S0;
          next_o = 1'b0;
        end
      end

      S4: begin
        if(i == 1) begin
          next_state = S1;
          next_o = 1'b0;
        end
        else begin
          next_state = S0;
          next_o = 1'b0;
        end
      end
      
      default: begin
        next_state = S0;
        next_o = 1'b0;
      end
    endcase
  end  
endmodule