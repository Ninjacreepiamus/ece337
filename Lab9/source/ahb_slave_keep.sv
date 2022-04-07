// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/28/2022
// Author:      Jake Williams
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: This is the AHB-Lite_Slave Interface

module ahb_lite_slave(
    input logic clk,
    input logic n_rst,
    output logic [15:0] sample_data,
    output logic data_ready,
    output logic new_coefficient_set,
    input logic [1:0] coefficient_num,
    output logic [15:0] fir_coefficient,
    input logic modwait,
    input logic [15:0] fir_out, // this is the input from coeff loader
    input logic err,
    input logic hsel,
    input logic [3:0] haddr,
    input logic hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    input logic clear_new_coefficient,
    output logic [15:0] hrdata,
    output logic hresp
);
    logic [3:0] haddr_reg;
    logic [15:0] status;
    logic [15:0] next_status;
    logic [15:0] result;
    logic [15:0] next_result;
    logic [15:0] next_sample;
    logic [15:0] coefficient_confirmation;
    logic [15:0] next_coefficient_confirmation;
    logic [15:0] fir_coefficient0;
    logic [15:0] next_fir_coefficient0;
    logic [15:0] fir_coefficient1;
    logic [15:0] next_fir_coefficient1;
    logic [15:0] fir_coefficient2;
    logic [15:0] next_fir_coefficient2;
    logic [15:0] fir_coefficient3;
    logic [15:0] next_fir_coefficient3;
    logic [15:0] next_fir_coefficient;
    logic clear_coefficient;
    logic next_data_ready;
    logic next_new_coefficient_set;

    //register all of the signals for hwrite hsize and haddr

    //Questions:
    //1. Do we need next registers for status and result since they are read only?
    //2. Do we read from the regular regs and write to the next registers?
    //3. What are our options with using haddr as a registered value?
    //4. What are we outputting to sample_data combinationally?
    //5. Do we need to register data_ready?
    //6. Check fir_coefficient combinational output

    always_comb begin : APB_SLAVE_STATE_LOGIC
        //Combinational block for STATUS
        next_status = {7'b0,err,7'b0,(modwait | new_coefficient_set)}; //We need to or something with modwait?
        
        //Combinational block for RESULT
        next_result = fir_out;
    end

    always_comb begin : OUTPUT_BLOCKS
        //Combinational out for fir_coefficient
        next_fir_coefficient = '0;
        next_data_ready = 1'b0;

        if(coefficient_num == 2'd0)
            next_fir_coefficient = fir_coefficient0; // SWITCH THE REST make sure matches seq
        else if(coefficient_num == 2'd1)
            next_fir_coefficient = fir_coefficient1;
        else if(coefficient_num == 2'd2)
            next_fir_coefficient = fir_coefficient2;
        else if(coefficient_num == 2'd3)
            next_fir_coefficient = fir_coefficient3;

        //Combinational block for NEW COEFFICIENT SET CONFIRMATION REGISTER
        if(clear_new_coefficient == 1'b1)
            next_new_coefficient_set = 1'b0;
        else
            next_new_coefficient_set = 1'b1;

        //DATA READY COMBINATIONAL BLOCK (Data Ready might be registered?)
        //Default condition
        if((hwrite == 1'b1) && ((haddr == 4) || (haddr == 5)))
            next_data_ready = 1'b1;
        else if(modwait == 1)
            next_data_ready = 1'b0;
    end

    //Sequential block for Multiple Registers
    always_ff @(posedge clk, negedge n_rst) begin
        if(~n_rst) begin
            haddr_reg <= '0;
            status <= '0;
            result <= '0;
            sample_data <= '0;
            fir_coefficient0 <= '0;
            fir_coefficient1 <= '0;
            fir_coefficient2 <= '0;
            fir_coefficient3 <= '0;
            fir_coefficient <= '0;
            data_ready <= '0;
            coefficient_confirmation <= '0;
            new_coefficient_set <= '0;
        end
        else begin
            haddr_reg <= haddr; // Next haddr register for delay
            status <= next_status;
            result <= next_result;
            sample_data <= next_sample;
            fir_coefficient0 <= next_fir_coefficient0;
            fir_coefficient1 <= next_fir_coefficient1;
            fir_coefficient2 <= next_fir_coefficient2;
            fir_coefficient3 <= next_fir_coefficient3;
            fir_coefficient <= next_fir_coefficient;
            data_ready <= next_data_ready;
            coefficient_confirmation <= next_coefficient_confirmation;
            new_coefficient_set <= next_new_coefficient_set;
        end
    end

    logic [3:0] rsel;
    logic [3:0] wsel;

    //Read from original write to next
    //Combinational logic for HRESP, HRDATA, and HWDATA
    always_comb begin
        next_sample = sample_data;
        hresp = 0;
        hrdata = '0;
        rsel = '0;
        wsel = '0;

        if(hsel && (htrans == 2'd2)) begin
            case(haddr)
                4'h0: begin
                    hresp = 0;
                    rsel = haddr;
                    wsel = '0;
                    if(hsize == 0)
                        hrdata[7:0] = status[7:0];
                    else
                        hrdata = status;
                    if(hwrite == 1)
                        hresp = 1;
                end

                4'h1: begin
                    hresp = 0;
                    rsel = haddr;
                    wsel = '0;
                    if(hsize == 0)
                        hrdata[15:8] = status[15:8];
                    else
                        hrdata = status;
                        
                    if(hwrite == 1)
                        hresp = 1;
                end

                4'h2: begin
                    hresp = 0;
                    rsel = haddr;
                    wsel = '0;
                    if(hsize == 0)
                        hrdata[7:0] = result[7:0];
                    else
                        hrdata = result;
                    if(hwrite == 1)
                        hresp = 1;
                end

                4'h3: begin
                    hresp = 0;
                    rsel = haddr;
                    wsel = '0;
                    if(hsize == 0)
                        hrdata[15:8] = result[15:8];
                    else
                        hrdata = result;
                    if(hwrite == 1)
                        hresp = 1;
                end

                4'h4: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[7:0] = sample_data[7:0];
                        else
                            hrdata = sample_data;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_sample[7:0] = hwdata[7:0];
                        else
                            next_sample = hwdata;
                    end
                end

                4'h5: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[15:8] = sample_data[15:8];
                        else
                            hrdata = sample_data;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_sample[15:8] = hwdata[15:8];
                        else
                            next_sample = hwdata;
                    end
                end

                4'h6: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[7:0] = fir_coefficient0[7:0];
                        else
                            hrdata = fir_coefficient0;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient0[7:0] = hwdata[7:0]; // Assign coefficient out to be based on number
                        else
                            next_fir_coefficient0 = hwdata;
                    end
                end

                4'h7: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[15:8] = fir_coefficient0[15:8];
                        else
                            hrdata = fir_coefficient0;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient0[15:8] = hwdata[15:8];
                        else
                            next_fir_coefficient0 = hwdata;
                    end
                end

                4'h8: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[7:0] = fir_coefficient1[7:0];
                        else
                            hrdata = fir_coefficient1;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient1[7:0] = hwdata[7:0];
                        else
                            next_fir_coefficient1 = hwdata;
                    end
                end

                4'h9: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[15:8] = fir_coefficient1[15:8];
                        else
                            hrdata = fir_coefficient1;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient1[15:8] = hwdata[15:8];
                        else
                            next_fir_coefficient1 = hwdata;
                    end
                end

                4'ha: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[7:0] = fir_coefficient2[7:0];
                        else
                            hrdata = fir_coefficient2;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient2[7:0] = hwdata[7:0];
                        else
                            next_fir_coefficient2 = hwdata;
                    end
                end

                4'hb: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[15:8] = fir_coefficient2[15:8];
                        else
                            hrdata = fir_coefficient2;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient2[15:8] = hwdata[15:8];
                        else
                            next_fir_coefficient2 = hwdata;
                    end
                end

                4'hc: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[7:0] = fir_coefficient3[7:0];
                        else
                            hrdata = fir_coefficient3;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient3[7:0] = hwdata[7:0];
                        else
                            next_fir_coefficient3 = hwdata;
                    end
                end

                4'hd: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[15:8] = fir_coefficient3[15:8];
                        else
                            hrdata = fir_coefficient3;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_fir_coefficient3[15:8] = hwdata[15:8];
                        else
                            next_fir_coefficient3 = hwdata;
                    end
                end

                4'he: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        wsel = '0;
                        if(hsize == 0)
                            hrdata[7:0] = coefficient_confirmation[7:0];
                        else
                            hrdata = coefficient_confirmation;
                    end
                    else begin
                        rsel = '0;
                        wsel = haddr;
                        if(hsize == 0)
                            next_coefficient_confirmation[7:0] = hwdata[7:0];
                        else
                            next_coefficient_confirmation = hwdata;
                    end
                end

                4'hf: begin
                    hresp = 0;
                    if(hwrite == 0) begin
                        rsel = haddr;
                        if(hsize == 0)
                            hrdata[15:8] = coefficient_confirmation[15:8];
                        else
                            hrdata = coefficient_confirmation;
                    end
                    else begin
                        wsel = haddr;
                        if(hsize == 0)
                            next_coefficient_confirmation[15:8] = hwdata[15:8];
                        else
                            next_coefficient_confirmation = hwdata;
                    end
                end

                default: begin
                    hrdata = '0;
                    hresp = 0;
                    hrdata = '0;
                    rsel = '0;
                    wsel = '0;
                end
            endcase
        end
    end

endmodule