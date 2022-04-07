// $Id: $
// File name:   flex_counter.sv
// Created:     2/3/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: Rollover counter that sets flag when the counter starts over
// /

module flex_counter 
#( 
    parameter NUM_CNT_BITS = 4 
) 
(   input logic clk, 
    input logic n_rst, 
    input logic clear,  
    input logic count_enable,  
    input logic [(NUM_CNT_BITS - 1):0] rollover_val, 
    output logic [(NUM_CNT_BITS - 1):0] count_out, 
    output logic rollover_flag 
); 
  logic [(NUM_CNT_BITS - 1):0] count; 
  logic [(NUM_CNT_BITS - 1):0] next_count; 
  logic next_rollover_flag; 
  
  always_ff @(posedge clk, negedge n_rst) begin 
    if(n_rst == 1'b0) begin 
      count <= 'b0; 
      rollover_flag <= 'b0; 
    end 
    else begin 
        count <= next_count; 
        rollover_flag <= next_rollover_flag; 
    end 
  end 
   
  always_comb begin 
    next_rollover_flag = 1'b0; 
    
    if(clear == 1'b1) begin //If synchronous clear is set
      next_count = '0;
      next_rollover_flag = 1'b0;
    end

    else begin
      if(count_enable == 1'b1) begin //If count is enabled
        if(count == rollover_val) 
          next_count = 'b1; //Count becomes 1
        else 
          next_count = count + 1; //Otherwise keep counting

        if(next_count == rollover_val)
          next_rollover_flag = 1'b1; //Rollover flag becomes 1
        else
          next_rollover_flag = 1'b0; //Rollover flag stays 0
      end

      else begin 
        next_count = count; 
        next_rollover_flag = rollover_flag; 
      end
    end
  end
  assign count_out = count;
endmodule