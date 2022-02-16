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

  always_ff @(posedge clk, negedge n_rst) begin
    if(~n_rst) begin
      state <= S0;
    end
    else begin
      state <= next_state;
    end
  end

  always_comb begin
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
          next_state = S4;
        end
        else begin
          next_state = S0;
        end
      end

      S4: begin
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
          o = 1'b0;
      end

      S4: begin
        o = 1'b1;
      end

      default: begin
        o = 1'b0;
      end
    endcase
  end
endmodule