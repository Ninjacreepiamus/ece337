// $Id: $
// File name:   mealy.sv
// Created:     2/15/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a Mealy-Machine version of the previous Moore-implemented 1101 sequence recognizer.

module mealy(input logic clk, input logic n_rst, input logic i, output logic o);
  typedef enum logic [1:0] {S0, S1, S2, S3} state_t;
  state_t state;
  state_t next_state;

  always_ff @(posedge clk, negedge n_rst) begin // This only updates state
    if(~n_rst)
      state <= S0;
    else
      state <= next_state;
  end

  always_comb begin // Always_comb block for the state
    case(state)
      S0: begin
        if(i == 1) begin
          next_state = S1;
        end
        else begin
          next_state = S0;
        end
      end

      S1: begin
        if(i == 1) begin
          next_state = S2;
        end
        else begin
          next_state = S0;
        end
      end

      S2: begin
        if(i == 1) begin
          next_state = S2;
        end
        else begin
          next_state = S3;
        end
      end

      S3: begin
        if(i == 1) begin
          next_state = S1;
        end
        else begin
          next_state = S0;
        end
      end

      default: begin
        next_state = S0;
      end
    endcase
  end

  always_comb begin // Always_comb block for the output
    case(state)
      S0: begin
        o = 1'b0;
      end

      S1: begin
        o = 1'b0;
      end

      S2: begin
        o = 1'b0;
      end

      S3: begin
        if(i == 1) begin
          o = 1'b1;
        end
        else begin
          o = 1'b0;
        end
      end

      default: begin
        o = 1'b0;
      end
    endcase
  end
endmodule