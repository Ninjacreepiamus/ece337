// $Id: $
// File name:   apb_slave.sv
// Created:     3/22/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is the main apb_slave.

module apb_slave(
    input logic clk,
    input logic n_rst,
    input logic [7:0] rx_data,
    input logic data_ready,
    input logic overrun_error,
    input logic framing_error,
    output logic data_read, //keep combinational
    input logic psel,
    input logic [2:0] paddr,
    input logic penable,
    input logic pwrite,
    input logic [7:0] pwdata,
    output logic [7:0] prdata,
    output logic pslverr, //keep combinational
    output logic [3:0] data_size,
    output logic [13:0] bit_period
);
    logic [2:0] rsel;
    logic [2:0] wsel;

    //STEP 1: do rsel, wsel, pslverr based on paddr values and psel and penable
    always_comb begin
        pslverr = 0;
        rsel = 0;
        wsel = 0;

        if(psel == 1'b1) begin
            if(pwrite == 1'b1) begin
                if(paddr == 2 || paddr == 3 || paddr == 4) begin
                    wsel = paddr;
                end
                else begin
                    pslverr = 1;
                end
            end
            else begin
                if(paddr == 0 || paddr == 1 || paddr == 2 || paddr == 3 || paddr == 4 || paddr == 6) begin
                    rsel = paddr;
                end
                else begin
                    pslverr = 1;
                end
            end
        end
    end
    //STEP 2: Create four registers data_ready, overrun_error, framing_error, rx_data
    //if not reset set them to themselves as non-registers
    
    //Also create them for outputs pr_data and data_read
    logic data_ready_reg;
    logic overrun_error_reg;
    logic framing_error_reg;
    logic [7:0] rx_data_reg;

    always_ff @(posedge clk, negedge n_rst) begin
        if(n_rst == 1'b0) begin
            data_ready_reg <= 0;
            overrun_error_reg <= 0;
            framing_error_reg <= 0;
            rx_data_reg <= 0;
        end
        else begin
            overrun_error_reg <= overrun_error;
            framing_error_reg <= framing_error;
            rx_data_reg <= rx_data;
            data_ready_reg <= data_ready;
        end
    end

    //STEP 3: Write combinational logic
    always_comb begin
        data_read = 0;
        prdata = '0;
        case(rsel)
            0: begin 
                    if(penable)
                        prdata = {7'b0,data_ready_reg};
            end
            1: begin
                    if(penable)
                        prdata = {6'b0,overrun_error_reg,framing_error_reg};
            end
            2: begin if(penable)
                        prdata = bit_period[7:0];
            end
            3: begin if(penable)
                        prdata = {2'b0, bit_period[13:8]};
            end
            4: begin if(penable)
                        prdata = {4'b0, data_size};
            end
            6: begin 
                    if(penable) begin
                        prdata = rx_data_reg;
                        data_read = 1;
                    end
            end
        endcase
    end


    //STEP 4: Flip flops for data size and bit period

    logic [3:0] next_data_size;
    logic [13:0] next_bit_period;

    always_ff @(posedge clk, negedge n_rst) begin
        if(n_rst == 1'b0) begin
            data_size <= 4'd8;
            bit_period <= 14'd10; // ARE THESE THE CORRECT RESET VALUES?
        end
        else begin
            data_size <= next_data_size;
            bit_period <= next_bit_period;
        end
    end

    //STEP 5: Create combinational logic for lower/upper bit period

    always_comb begin
        next_bit_period = bit_period;
        next_data_size = data_size;
        if(wsel == 2)
            next_bit_period = {bit_period[13:8],pwdata};
        else if(wsel == 3)
            next_bit_period = {pwdata[5:0],bit_period[7:0]};
        else if(wsel == 4)
            next_data_size = pwdata[3:0];
    end
endmodule