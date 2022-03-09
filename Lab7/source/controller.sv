// $Id: $
// File name:   controller.soverflow
// Created:     3/8/2022
// Author:      Jake Williams
// Lab Section: 337-015
// overflowersion:     1.0  Initial Design Entry
// Description: This is the unit brain of the system.

module controller(
    input logic clk,
    input logic n_rst,
    input logic dr,
    input logic lc,
    input logic overflow,
    output logic cnt_up,
    output logic clear,
    output logic modwait,
    output logic [2:0] op,
    output logic [3:0] src1,
    output logic [3:0] src2,
    output logic [3:0] dest,
    output logic err
);

    typedef enum logic [4:0] {IDLE, COLOAD1, WAIT1, COLOAD2,
                              WAIT2, COLOAD3, WAIT3, COLOAD4,
                              STORE, ZERO, SORT1, SORT2, SORT3,
                              SORT4, MUL1, ADD1, MUL2, SUB2, MUL3,
                              ADD3, MUL4, SUB4, EIDLE} state_t;
    state_t state;
    state_t next_state;
    logic next_modwait;

    always_ff @(posedge clk, negedge n_rst) begin
        if(~n_rst) begin
            state <= IDLE;
            modwait <= 1'b0;
        end
        else begin
            state <= next_state;
            modwait <= next_modwait;
        end
    end

    always_comb begin
        case(state)
        IDLE: begin
            if(dr == 1)
                next_state = STORE;
            else if(lc == 1)
                next_state = COLOAD1;
            else
                next_state = IDLE;
        end

        COLOAD1: begin
            next_state = WAIT1;
        end

        WAIT1: begin
            if(lc == 1)
                next_state = COLOAD2;
            else
                next_state = WAIT1;
        end

        COLOAD2: begin
            next_state = WAIT2;
        end

        WAIT2: begin
            if(lc == 1)
                next_state = COLOAD3;
            else
                next_state = WAIT2;
        end

        COLOAD3: begin
            next_state = WAIT3;
        end

        WAIT3: begin
            if(lc == 1)
                next_state = COLOAD4;
            else
                next_state = WAIT3;
        end

        COLOAD4: begin
            next_state = IDLE;
        end

        STORE: begin
            if(dr == 1)
                next_state = ZERO;
            else
                next_state = EIDLE;
        end

        ZERO: begin
            next_state = SORT1;
        end

        SORT1: begin
            next_state = SORT2;
        end

        SORT2: begin
            next_state = SORT3;
        end

        SORT3: begin
            next_state = SORT4;
        end

        SORT4: begin
            next_state = MUL1;
        end

        MUL1: begin
            if(overflow == 0)
                next_state = ADD1;
            else
                next_state = EIDLE;
        end

        ADD1: begin
            if(overflow == 0)
                next_state = MUL2;
            else
                next_state = EIDLE;
        end

        MUL2: begin
            if(overflow == 0)
                next_state = SUB2;
            else
                next_state = EIDLE;
        end

        SUB2: begin
            if(overflow == 0)
                next_state = MUL3;
            else
                next_state = EIDLE;
        end

        MUL3: begin
            if(overflow == 0)
                next_state = ADD3;
            else
                next_state = EIDLE;
        end

        ADD3: begin
            if(overflow == 0)
                next_state = MUL4;
            else
                next_state = EIDLE;
        end

        MUL4: begin
            if(overflow == 0)
                next_state = SUB4;
            else
                next_state = EIDLE;
        end

        SUB4: begin
            if(overflow == 0)
                next_state = IDLE;
            else
                next_state = EIDLE;
        end

        EIDLE: begin
            if(dr == 1)
                next_state = STORE;
            else if(lc == 1)
                next_state = COLOAD1;
            else
                next_state = EIDLE;
        end

        default: next_state = IDLE;

        endcase
    end

    always_comb begin
        case(state)
        IDLE: begin
            next_modwait = lc || dr;
            cnt_up = 0;
            err = 0;

            //NULL
            op = 3'b000;
            dest = 4'b0000;
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        COLOAD1: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b1001;
            op = 3'b011;

            //NULL
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        WAIT1: begin
            next_modwait = 0;
            cnt_up = 0;
            err = 0;

            //NULL
            dest = 4'b0000;
            op = 3'b000;
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        COLOAD2: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b1000;
            op = 3'b011;

            //NULL
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        WAIT2: begin
            next_modwait = 0;
            cnt_up = 0;
            err = 0;

            //NULL
            dest = 4'b0000;
            op = 3'b000;
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        COLOAD3: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0111;
            op = 3'b011;

            //NULL
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        WAIT3: begin
            next_modwait = 0;
            cnt_up = 0;
            err = 0;

            //NULL
            dest = 4'b0000;
            src1 = 4'b0000;
            op = 3'b000;
            src2 = 4'b0000;
        end

        COLOAD4: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0110;
            op = 3'b011;

            //NULL
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        STORE: begin
            next_modwait = 1;
            cnt_up = 1;
            err = 0;

            dest = 4'b0101;
            op = 3'b010;

            //NULL
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        ZERO: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0000;
            op = 3'b101;
            src1 = 4'b0000;
            src2 = 4'b0000;
        end

        SORT1: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0001;
            op = 3'b001;
            src1 = 4'b0010;

            //NULL
            src2 = 4'b0000;
        end

        SORT2: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0010;
            src1 = 4'b0011;
            op = 3'b001;

            //NULL
            src2 = 4'b0000;
        end

        SORT3: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0011;
            src1 = 4'b0100;
            op = 3'b001;

            //NULL
            src2 = 4'b0000;
        end

        SORT4: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0100;
            src1 = 4'b0101;
            op = 3'b001;

            //NULL
            src2 = 4'b0000;
        end

        MUL1: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b1010;
            op = 3'b110;
            src1 = 4'b0100;
            src2 = 4'b1001;
        end

        ADD1: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0000;
            op = 3'b100;
            src1 = 4'b0000;
            src2 = 4'b1010;
        end

        //THIS IS WHERE I HAVE CHECKED TO

        MUL2: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b1010;
            op = 3'b110;
            src1 = 4'b0011;
            src2 = 4'b1000;
        end

        SUB2: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0000;
            op = 3'b101;
            src1 = 4'b0000;
            src2 = 4'b1010;
        end

        MUL3: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b1010;
            op = 3'b110;
            src1 = 4'b0010;
            src2 = 4'b0111;
        end

        ADD3: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0000;
            op = 3'b100;
            src1 = 4'b0000;
            src2 = 4'b1010;
        end

        MUL4: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b1010;
            op = 3'b110;
            src1 = 4'b0001;
            src2 = 4'b0110;
        end

        SUB4: begin
            next_modwait = 1;
            cnt_up = 0;
            err = 0;

            dest = 4'b0000;
            op = 3'b101;
            src1 = 4'b0000;
            src2 = 4'b1010;
        end

        EIDLE: begin
            next_modwait = lc || dr;
            cnt_up = 0;
            err = 1;

            //NULL
            op = 3'b000;
            src1 = 4'b0000;
            src2 = 4'b0000;
            dest = 4'b0000;
        end
        
        default: begin
            next_modwait = 0;
            cnt_up = 0;
            err = 0;

            op = 3'b000;
            src1 = 4'b0000;
            src2 = 4'b0000;
            dest = 4'b0000;
        end
        endcase
    clear = lc;
    end
endmodule