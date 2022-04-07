module ahb_lite_slave
(
	input logic clk,
	input logic n_rst,
	input logic [1:0] coefficient_num,
	input logic modwait,
	input logic [15:0] fir_out,
	input logic err,
	input logic hsel,
	input logic [3:0] haddr,
	input logic hsize,
	input logic [1:0] htrans,
	input logic hwrite,
	input logic [15:0] hwdata,
    input logic clear_new_coefficient,
	output logic [15:0] sample_data,
	output logic data_ready,
	output logic new_coefficient_set,
	output logic [15:0] fir_coefficient,
	output logic [15:0] hrdata,
	output logic hresp
);

	logic [1:0] state;
	logic [1:0] next_state;
	logic [15:0][7:0] Register_Map;
	logic [15:0][7:0] next_Register_Map;
	logic next_data_ready;
	logic [3:0] address_mapping;
	logic size_buffer;

typedef enum logic [1:0] {IDLE,
			WRITE,
			READ,
			ERROR} state_t;

always_comb begin
	next_state = state;
	case(state)
		IDLE: next_state  = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
		WRITE: next_state = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
		READ: next_state  = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
		ERROR: next_state = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? ERROR :
				   (hsel && hwrite && (htrans != 0)) ? WRITE :
				   (hsel && !hwrite && (htrans != 0)) ? READ :
				   IDLE;
	endcase
end

always_ff @(posedge clk, negedge n_rst) begin
	if(!n_rst) begin
		state <= IDLE;
		data_ready <= 0;
		Register_Map <= 0;
		address_mapping <= 0; //
		size_buffer <= 0; 
	end
	else begin
		state <= next_state;
		data_ready <= next_data_ready;
		Register_Map <= next_Register_Map;
		address_mapping <= haddr;
		size_buffer <= hsize;
	end
end

always_comb begin
	hrdata = 0;
	//hresp = 0;
	hresp = (hsel && ((hwrite && ((haddr == 0) | (haddr == 1) | (haddr == 2) | (haddr == 3) | (haddr == 15))) 
					| ((!hwrite) && (haddr == 15)))) ? 1 : 0;
	case(state)
		READ: begin
			if (size_buffer == 1)
				if (address_mapping % 2 == 1)
					hrdata = {Register_Map[address_mapping], Register_Map[address_mapping - 1'b1]};
				else
					hrdata = {Register_Map[address_mapping + 1'b1], Register_Map[address_mapping]};
			else
				if (address_mapping % 2 == 1)
					hrdata = {Register_Map[address_mapping], 8'b0};
				else
					hrdata = {8'b0, Register_Map[address_mapping]};

			if (address_mapping == 4'd14) hrdata = {8'b0, Register_Map[14]};
		end
	endcase
end

always_comb begin
	next_Register_Map = Register_Map;
	next_data_ready = data_ready;
	
	if(err) begin
		next_Register_Map[1] = 1;
		next_Register_Map[0] = '0;
	end
	else if(new_coefficient_set) begin
		next_Register_Map[0] = 1;
		next_Register_Map[1] = '0;
	end
	else if(modwait) begin
		next_Register_Map[0] = 1;
		next_Register_Map[1] = '0;
	end
	else begin
		next_Register_Map[0] = '0;
		next_Register_Map[1] = '0;
	end

	next_Register_Map[2] = fir_out[7:0];
	next_Register_Map[3] = fir_out[15:8];
	next_Register_Map[15] = '0;

	if (coefficient_num == 3) begin
		next_Register_Map[14] = '0;
	end
	new_coefficient_set = Register_Map[14];

	sample_data = {Register_Map[5], Register_Map[4]};
	fir_coefficient = {Register_Map[coefficient_num * 2 + 7], Register_Map[coefficient_num * 2 + 6]};
	
	case(state)
		WRITE: begin
			if(size_buffer == 1)
				if(haddr % 2 == 1) begin
					next_Register_Map[address_mapping - 1'b1] = hwdata[7:0];
					next_Register_Map[address_mapping] = hwdata[15:8];
				end
				else begin
					next_Register_Map[address_mapping] = hwdata[7:0];
					next_Register_Map[address_mapping + 1'b1] = hwdata[15:8];
				end
			else
				if(haddr % 2 == 1)
					next_Register_Map[address_mapping] = hwdata[15:8];
				else
					next_Register_Map[address_mapping] = hwdata[7:0];
			
			if(address_mapping == 4 | address_mapping == 5)
				next_data_ready = 1;
		end
	endcase
	
	if (modwait) next_data_ready = 0;
end


endmodule