// $Id: $
// File name:   coefficient_loader.sv
// Created:     3/28/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This manages loading a full set of coefficients from the AHB-lite interface module into the FIR Filter module. It should be a simple FSM module that mimics the behavior previously done by the coefficient loading tasks in starter test bench provided during the FIR Filter lab.

module coefficient_loader(
    input logic clk,
    input logic n_reset,
    input logic new_coefficient_set,
    input logic modwait,
    output logic load_coeff,
    output logic [1:0] coefficient_num,
    output logic clear_new_coefficient
);
    typedef enum logic [3:0] {IDLE, COLOAD0, WAIT0, COLOAD1,
                              WAIT1, COLOAD2, WAIT2, COLOAD3, WAIT3} state_t;
    state_t state;
    state_t next_state;
    logic next_load_coeff;
    logic next_clear_new_coefficient;
    logic [1:0] next_coefficient_num;

    always_ff @(posedge clk, negedge n_reset) begin
        if(~n_reset) begin
            state <= IDLE;
            load_coeff <= '0;
            coefficient_num <= '0;
        end
        else begin
            state <= next_state;
            load_coeff <= next_load_coeff;
            coefficient_num <= next_coefficient_num;
        end
    end

    always_comb begin
        case(state)
            IDLE: begin
                if(new_coefficient_set == 1)
                    next_state = COLOAD0;
                else
                    next_state = IDLE;
            end
            COLOAD0: begin
                next_state = WAIT0;
            end
            WAIT0: begin
                if(modwait == 1)
                    next_state = WAIT0;
                else
                    next_state = COLOAD1;
            end
            COLOAD1: begin
                next_state = WAIT1;
            end
            WAIT1: begin
                if(modwait == 1)
                    next_state = WAIT1;
                else
                    next_state = COLOAD2;
            end
            COLOAD2: begin
                next_state = WAIT2;
            end
            WAIT2: begin
                if(modwait == 1)
                    next_state = WAIT2;
                else 
                    next_state = COLOAD3;
            end
            COLOAD3: begin
                next_state = WAIT3;
            end
            WAIT3: begin  
                next_state = IDLE;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

    always_comb begin
         case(state)
            IDLE: begin
                next_load_coeff = 0;
                next_coefficient_num = 2'd0;
                next_clear_new_coefficient = 1'b0;
            end
            COLOAD0: begin
                next_load_coeff = 1;
                next_coefficient_num = 2'd0;
                next_clear_new_coefficient = 1'b0;
            end
            WAIT0: begin
                next_load_coeff = 0;
                next_coefficient_num = 2'd0;
                next_clear_new_coefficient = 1'b0;
            end
            COLOAD1: begin
                next_load_coeff = 1;
                next_coefficient_num = 2'd1;
                next_clear_new_coefficient = 1'b0;
            end
            WAIT1: begin
                next_load_coeff = 0;
                next_coefficient_num = 2'd1;
                next_clear_new_coefficient = 1'b0;
            end
            COLOAD2: begin
                next_load_coeff = 1;
                next_coefficient_num = 2'd2;
                next_clear_new_coefficient = 1'b0;
            end
            WAIT2: begin
                next_load_coeff = 0;
                next_coefficient_num = 2'd2;
                next_clear_new_coefficient = 1'b0;
            end
            COLOAD3: begin
                next_load_coeff = 1;
                next_coefficient_num = 2'd3;
                next_clear_new_coefficient = 1'b0;
            end
            WAIT3: begin
                next_load_coeff = 0;
                next_coefficient_num = 2'd3;
                next_clear_new_coefficient = 1'b1;
            end
            default: begin
                next_load_coeff = '0;
                next_coefficient_num = '0;
                next_clear_new_coefficient = '0;
            end
        endcase
    end
endmodule