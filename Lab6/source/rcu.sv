// $Id: $
// File name:   rcu.sv
// Created:     2/22/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is a reciever control unit, which dictates the current mode of operation for the Receiver Block of the UART.

module rcu(
    input logic clk,
    input logic n_rst,
    input logic new_packet_detected, // input to next_state NOT AN OUTPUT
    input logic packet_done, // input to next_state NOT AN OUTPUT
    input logic framing_error, // input to next_state NOT AN OUTPUT
    output logic sbc_clear, // flip-flop
    output logic sbc_enable, // flip-flop
    output logic load_buffer, // flip-flop
    output logic enable_timer // flip-flop
);
    typedef enum logic [2:0] {IDLE, CLEAR, STORE, CHECK, WAIT, LOAD} state_t;
    state_t state;
    state_t next_state;
    logic next_sbc_clear;
    logic next_sbc_enable;
    logic next_load_buffer;
    logic next_enable_timer;

    always_ff @(posedge clk, negedge n_rst) begin
        if(~n_rst) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    always_comb begin
        case(state)
            IDLE: begin
                if(new_packet_detected == 1)
                    next_state = CLEAR;
                else
                    next_state = IDLE;
            end

            CLEAR: begin
                next_state = STORE;
            end

            STORE: begin
                if(packet_done == 1)
                    next_state = CHECK;
                else
                    next_state = STORE;
            end

            CHECK: begin
                if(framing_error == 1)
                    next_state = IDLE;
                else
                    next_state = LOAD;
            end

            WAIT: begin
                next_state = LOAD;
            end

            LOAD: begin
                next_state = IDLE;
            end

            default: next_state = IDLE;

        endcase
    end

    always_comb begin
        case(state)
            IDLE: begin
                sbc_clear = 0;
                sbc_enable = 0;
                load_buffer = 0;
                enable_timer = 0;
            end

            CLEAR: begin
                sbc_clear = 1;
                sbc_enable = 0;
                load_buffer = 0;
                enable_timer = 1;
            end

            STORE: begin
                sbc_clear = 0;
                sbc_enable = 0;
                load_buffer = 0;
                enable_timer = 1;
            end

            CHECK: begin
                sbc_clear = 0;
                sbc_enable = 1;
                load_buffer = 0;
                enable_timer = 0;
            end

            WAIT: begin
                sbc_clear = 0;
                sbc_enable = 0;
                load_buffer = 0;
                enable_timer = 0;
            end

            LOAD: begin
                sbc_clear = 0;
                sbc_enable = 0;
                load_buffer = 1;
                enable_timer = 0;
            end
            default: begin
                sbc_clear = 0;
                sbc_enable = 0;
                load_buffer = 0;
                enable_timer = 0;
            end
        endcase
    end

endmodule