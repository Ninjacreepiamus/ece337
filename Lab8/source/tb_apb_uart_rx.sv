`timescale 1ns / 10ps 

module tb_apb_uart_rx; 
// Define parameters 
parameter CLK_PERIOD = 10; 

localparam BUS_DELAY = 800ps; 
localparam NORM_DATA_PERIOD = 10 * CLK_PERIOD; 

// DUT inputs 
logic psel, penable, pwrite, pslverr; 
logic [2:0] paddr; 
logic [7:0] pwdata, prdata; 

// Sizing related constants 
localparam DATA_WIDTH = 1; 
localparam ADDR_WIDTH = 3; 
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8; 
localparam DATA_MAX_BIT = DATA_WIDTH_BITS - 1; 
localparam ADDR_MAX_BIT = ADDR_WIDTH - 1; 

// Define our address mapping scheme via constants 
localparam ADDR_DATA_SR = 3'd0; 
localparam ADDR_ERROR_SR = 3'd1; 
localparam ADDR_BIT_CR0 = 3'd2; 
localparam ADDR_BIT_CR1 = ADDR_BIT_CR0 + 1; 
localparam ADDR_DATA_CR = 3'd4; 
localparam ADDR_RX_DATA = 3'd6; 

// APB-Slave reset value constants 
// Student TODO: Update these based on the reset values for your config registers 
localparam RESET_BIT_PERIOD = '0; 
localparam RESET_DATA_SIZE = '0; 


//***************************************************************************** 
// Declare TB Signals (Bus Model Controls) 
//***************************************************************************** 
// Testing setup signals 
logic tb_enqueue_transaction; 
logic tb_transaction_write; 
logic tb_transaction_fake; 
logic [(ADDR_WIDTH - 1):0] tb_transaction_addr; 
logic [((DATA_WIDTH*8) - 1):0] tb_transaction_data; 
logic tb_transaction_error; 
// Testing control signal(s) 
logic tb_enable_transactions; 
integer tb_current_transaction_num; 
logic tb_model_reset; 
string tb_test_case; 
integer tb_test_case_num; 
logic [DATA_MAX_BIT:0] tb_test_data; 
string tb_check_tag; 
logic [13:0] tb_test_bit_period; 
logic tb_mismatch; 
logic tb_check; 
logic tb_expected_prdata; 

//***************************************************************************** 
// General System signals 
//***************************************************************************** 
logic tb_clk; 
logic tb_n_rst; 

//***************************************************************************** 
// APB-Slave side signals 
//***************************************************************************** 
logic tb_psel; 
logic [(ADDR_WIDTH - 1):0] tb_paddr; 
logic tb_penable; 
logic tb_pwrite; 
logic [((DATA_WIDTH*8) - 1):0] tb_pwdata; 
logic [((DATA_WIDTH*8) - 1):0] tb_prdata; 
logic tb_pslverr; 

//***************************************************************************** 
// UART-side Signals 
//***************************************************************************** 
logic tb_serial_in; 

//***************************************************************************** 
// Clock Generation Block 
//***************************************************************************** 
// Clock generation block 
always begin 
// Start with clock low to avoid false rising edge events at t=0 
tb_clk = 1'b0; 
// Wait half of the clock period before toggling clock value (maintain 50% duty cycle) 
#(CLK_PERIOD/2.0); 
tb_clk = 1'b1; 
// Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle) 
#(CLK_PERIOD/2.0); 
end 

//***************************************************************************** 
// Bus Model Instance 
//***************************************************************************** 
apb_bus BFM ( .clk(tb_clk), 
// Testing setup signals 
.enqueue_transaction(tb_enqueue_transaction), 
.transaction_write(tb_transaction_write), 
.transaction_fake(tb_transaction_fake), 
.transaction_addr(tb_transaction_addr), 
.transaction_data(tb_transaction_data), 
.transaction_error(tb_transaction_error), 
// Testing controls 
.model_reset(tb_model_reset), 
.enable_transactions(tb_enable_transactions), 
.current_transaction_num(tb_current_transaction_num), 
// APB-Slave Side 
.psel(tb_psel), 
.paddr(tb_paddr), 
.penable(tb_penable), 
.pwrite(tb_pwrite), 
.pwdata(tb_pwdata), 
.prdata(tb_prdata), 
.pslverr(tb_pslverr)); 

//***************************************************************************** 
// DUT Instance 
//***************************************************************************** 
apb_uart_rx DUT ( .clk(tb_clk), .n_rst(tb_n_rst), 
// APB-Slave bus signals 
.psel(tb_psel), 
.paddr(tb_paddr), 
.penable(tb_penable), 
.pwrite(tb_pwrite), 
.pwdata(tb_pwdata), 
.prdata(tb_prdata), 
.pslverr(tb_pslverr), 
// UART 
.serial_in(tb_serial_in)); 

// Tasks for regulating the timing of input stimulus to the design 
task send_packet; 
input [7:0] data; 
input stop_bit; 
input time data_period; 

integer i; 
begin 
// First synchronize to away from clock's rising edge 
@(negedge tb_clk) 

// Send start bit 
tb_serial_in = 1'b0; 
#(data_period); 

// Send data bits 
for(i = 0; i < 8; i = i + 1) 
begin 
tb_serial_in = data[i]; 
#(data_period); 
end 

// Send stop bit 
tb_serial_in = stop_bit; 
#(data_period); 
end 
endtask 

// Task for standard DUT reset procedure 
task reset_dut; 
begin 
// Activate the reset 
tb_n_rst = 1'b0; 

// Maintain the reset for more than one cycle 
@(posedge tb_clk); 
@(posedge tb_clk); 

// Wait until safely away from rising edge of the clock before releasing 
@(negedge tb_clk); 
tb_n_rst = 1'b1; 

// Leave out of reset for a couple cycles before allowing other stimulus 
// Wait for negative clock edges, 
// since inputs to DUT should normally be applied away from rising clock edges 
@(negedge tb_clk); 
@(negedge tb_clk); 
end 
endtask

//Check prdata 
task check_prdata_output; 
input string check_tag; 
tb_mismatch = 1'b0; 
tb_check = 1'b1; 
begin 
if(tb_expected_prdata == tb_prdata) begin // Check passed 
$info("Correct 'prdata' output %s during %s test case", check_tag, tb_test_case); 
end 
else begin // Check failed 
tb_mismatch = 1'b1; 
$error("Incorrect 'prdata' output %s during %s test case", check_tag, tb_test_case); 
end 
// Wait some small amount of time so check pulse timing is visible on waves 
#(0.1); 
tb_check =1'b0; 
end 
endtask


//***************************************************************************** 
// Bus Model Usage Related TB Tasks 
//***************************************************************************** 
// Task to pulse the reset for the bus model 
task reset_model; 
begin 
tb_model_reset = 1'b1; 
#(0.1); 
tb_model_reset = 1'b0; 
end 
endtask 

// Task to enqueue a new transaction 
task enqueue_transaction; 
input logic for_dut; 
input logic write_mode; 
input logic [ADDR_MAX_BIT:0] address; 
input logic [DATA_MAX_BIT:0] data; 
input logic expected_error; 
begin 
// Make sure enqueue flag is low (will need a 0->1 pulse later) 
tb_enqueue_transaction = 1'b0; 
#0.1ns; 

// Setup info about transaction 
tb_transaction_fake = ~for_dut; 
tb_transaction_write = write_mode; 
tb_transaction_addr = address; 
tb_transaction_data = data; 
tb_transaction_error = expected_error; 

// Pulse the enqueue flag 
tb_enqueue_transaction = 1'b1; 
#0.1ns; 
tb_enqueue_transaction = 1'b0; 
end 
endtask 

// Task to wait for multiple transactions to happen 
task execute_transactions; 
input integer num_transactions; 
integer wait_var; 
begin 
// Activate the bus model 
tb_enable_transactions = 1'b1; 
@(posedge tb_clk); 

// Process the transactions 
for(wait_var = 0; wait_var < num_transactions; wait_var++) begin 
@(posedge tb_clk); 
@(posedge tb_clk); 
end 

// Turn off the bus model 
@(negedge tb_clk); 
tb_enable_transactions = 1'b0; 
end 
endtask 


//***************************************************************************** 
//***************************************************************************** 
// Main TB Process 
//***************************************************************************** 
//***************************************************************************** 
initial begin 
// Initialize Test Case Navigation Signals 
tb_test_case = "Initilization"; 
tb_test_case_num = -1; 
tb_test_data = '0; 
tb_check_tag = "N/A"; 
tb_test_bit_period = '0; 
tb_check = 1'b0; 
tb_mismatch = 1'b0; 
tb_expected_prdata = '0; 
// Initialize all of the directly controled DUT inputs 
tb_n_rst = 1'b1; 
tb_serial_in = 1'b1; // Initially idle 
// Initialize all of the bus model control inputs 
tb_model_reset = 1'b0; 
tb_enable_transactions = 1'b0; 
tb_enqueue_transaction = 1'b0; 
tb_transaction_write = 1'b0; 
tb_transaction_fake = 1'b0; 
tb_transaction_addr = '0; 
tb_transaction_data = '0; 
tb_transaction_error = 1'b0; 

// Wait some time before starting first test case 
#(0.1); 

// Clear the bus model 
reset_model(); 

//***************************************************************************** 
// Power-on-Reset Test Case 
//***************************************************************************** 
// Update Navigation Info 
tb_test_case = "Power-on-Reset"; 
tb_test_case_num = tb_test_case_num + 1; 

// Reset the DUT 
reset_dut(); 

// Check outputs for reset state 
if (tb_prdata == 8'd0) 
$info("Correct reset"); 
else 
$error("Incorrect reset"); 


//***************************************************************************** 
// Test Case: Configure the Bit Period Settings 
//***************************************************************************** 
// Update Navigation Info 
tb_test_case = "Read from Bit Config"; 
tb_test_case_num = tb_test_case_num + 1; 

// Reset the DUT to isolate from prior to isolate from prior test case 
reset_dut(); 

// Enque the needed transactions
tb_test_bit_period = 14'd12; 


// Enqueue the CR Writes 
enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR0, tb_test_bit_period[7:0], 1'b0); 
enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR1, {2'b00, tb_test_bit_period[13:8]}, 1'b0); 

// Run the write transactions
execute_transactions(2); 

// Enqueue the CR Reads 
enqueue_transaction(1'b1, 1'b0, ADDR_BIT_CR0, tb_test_bit_period[7:0], 1'b0); 
enqueue_transaction(1'b1, 1'b0, ADDR_BIT_CR1, {2'b00, tb_test_bit_period[13:8]}, 1'b0); 

// Run the read transactions via the model 
execute_transactions(2); 

$info("Pass %s", tb_test_case); 


//***************************************************************************** 
// Test Case: DATA SIZE SETTING CONFIG 
//***************************************************************************** 
// Update Navigation Info 
tb_test_case = "Config data size 8"; 
tb_test_case_num = tb_test_case_num + 1; 

// Reset the DUT to isolate from prior to isolate from prior test case 
reset_dut(); 

// Enque the needed transactions (Overall period of 1000 clocks) 
tb_test_bit_period = 14'd15; 
// Enqueue the CR Writes 
enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR0, tb_test_bit_period[7:0], 1'b0); 
enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR1, {2'b00, tb_test_bit_period[13:8]}, 1'b0); 

// Run the write transactions via the model 
execute_transactions(2); 

// Set data size 
enqueue_transaction(1'b1, 1'b1, ADDR_DATA_CR, 8'd8, 1'b0); 
execute_transactions(1); 

// Enqueue the CR Reads 
enqueue_transaction(1'b1, 1'b0, ADDR_DATA_CR, 8'd8, 1'b0); 
execute_transactions(1); 

$info("Pass %s", tb_test_case); 


//***************************************************************************** 
// Test Case: RX_DATA READ
//***************************************************************************** 

#(CLK_PERIOD); 
@(negedge tb_clk); 
tb_test_case = "Read 8 bits"; 
tb_test_case_num = tb_test_case_num + 1; 

// Set rx data 
tb_test_data = 8'd50; 

send_packet(tb_test_data, 1'b1, 15 * CLK_PERIOD); 

// Wait for 2 data periods to allow DUT to finish processing the packet 
#(15 * CLK_PERIOD * 2); 

// Read the data status first 
enqueue_transaction(1'b1, 1'b0, ADDR_DATA_SR, 8'd1, 1'b0); 
execute_transactions(1); 

// Read the data 
enqueue_transaction(1'b1, 1'b0, ADDR_RX_DATA, tb_test_data, 1'b0); 
execute_transactions(1);
tb_expected_prdata = 8'd50;
check_prdata_output("CHECK CHECK");

$info("Pass %s", tb_test_case); 
//***************************************************************************** 
// Test Case: ERROR_STATUS REG READ
//***************************************************************************** 

#(CLK_PERIOD); 
@(negedge tb_clk); 
tb_test_case = "Read Error Status Reg"; 
tb_test_case_num = tb_test_case_num + 1; 

// Enqueue the CR Reads 
enqueue_transaction(1'b1, 1'b0, ADDR_ERROR_SR, 8'd0, 1'b0); 
execute_transactions(1); 

$info("Pass %s", tb_test_case); 

//***************************************************************************** 
// Test Case: DATA SIZE READ
//***************************************************************************** 
// Update Navigation Info 
tb_test_case = "Config data size 5"; 
tb_test_case_num = tb_test_case_num + 1; 

// Reset the DUT to isolate from prior to isolate from prior test case 
reset_dut(); 

// Enque the needed transactions (Overall period of 1000 clocks) 
tb_test_bit_period = 14'd15; 
// Enqueue the CR Writes 
enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR0, tb_test_bit_period[7:0], 1'b0); 
enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR1, {2'b00, tb_test_bit_period[13:8]}, 1'b0); 

// Run the write transactions via the model 
execute_transactions(2); 

// Set data size 
enqueue_transaction(1'b1, 1'b1, ADDR_DATA_CR, 8'd5, 1'b0); 
execute_transactions(1); 

// Enqueue the CR Reads 
enqueue_transaction(1'b1, 1'b0, ADDR_DATA_CR, 8'd5, 1'b0); 
execute_transactions(1); 

$info("Pass %s", tb_test_case); 

//***************************************************************************** 
// Test Case: RX_DATA READ (FROM BUFFER)
//***************************************************************************** 

#(CLK_PERIOD); 
@(negedge tb_clk); 
tb_test_case = "Read 5 bits"; 
tb_test_case_num = tb_test_case_num + 1; 

// Set rx data 
tb_test_data = 8'b11110111; 

send_packet(tb_test_data, 1'b1, 15 * CLK_PERIOD); 

// Wait for 2 data periods to allow DUT to finish processing the packet 
#(15 * CLK_PERIOD * 2); 

// Enqueue the CR Reads 
enqueue_transaction(1'b1, 1'b0, ADDR_RX_DATA, 8'b00010111, 1'b0); 
execute_transactions(1); 

$info("Pass %s", tb_test_case); 

//***************************************************************************** 
// Test Case: Read OVERRUN ERROR 
//***************************************************************************** 

#(CLK_PERIOD); 
@(negedge tb_clk); 
tb_test_case = "Read OVERRUN ERROR"; 
tb_test_case_num = tb_test_case_num + 1; 

// Set rx data 
tb_test_data = 8'b11110111; 

send_packet(tb_test_data, 1'b1, 15 * CLK_PERIOD); 

// Wait for 2 data periods to allow DUT to finish processing the packet 
#(15 * CLK_PERIOD * 2); 

// Send one more packet 
send_packet(tb_test_data, 1'b1, 15 * CLK_PERIOD); 

// Wait for 2 data periods to allow DUT to finish processing the packet 
#(15 * CLK_PERIOD * 2); 

// Enqueue the CR Reads 
enqueue_transaction(1'b1, 1'b0, ADDR_ERROR_SR, 8'd2, 1'b0); 
execute_transactions(1); 

$info("Pass %s", tb_test_case);


//***************************************************************************** 
// Test Case: PSLVERR WRITE to READ
//***************************************************************************** 
// Update Navigation Info 
tb_test_case = "Write to read only reg"; 
tb_test_case_num = tb_test_case_num + 1; 

// Reset the DUT to isolate from prior to isolate from prior test case 
reset_dut(); 

// Enqueue the CR Writes 
enqueue_transaction(1'b1, 1'b1, ADDR_DATA_SR, 8'd5, 1'b1); 
execute_transactions(1); 

$info("Pass %s", tb_test_case); 

//***************************************************************************** 
// Test Case: PSLVERR WRITE to READ
//***************************#(15 * CLK_PERIOD * 2); ************************************************** 
// Update Navigation Info 
tb_test_case = "Write to read only reg"; 
tb_test_case_num = tb_test_case_num + 1; 

// Reset the DUT to isolate from prior to isolate from prior test case 
reset_dut(); 

// Enqueue the CR Writes 
enqueue_transaction(1'b1, 1'b1, ADDR_ERROR_SR, 8'd5, 1'b1); 
execute_transactions(1); 


//***************************************************************************** 
// Test Case: This is an invalid addition test case
//***************************************************************************** 
// Update Navigation Info 
tb_test_case = "This is an invalid addition test case"; 
tb_test_case_num = tb_test_case_num + 1; 

// Reset the DUT to isolate from prior to isolate from prior test case 
reset_dut(); 

// Enqueue the CR Writes 
enqueue_transaction(1'b1, 1'b1, 5, 8'd5, 1'b1); 
execute_transactions(1); 

$info("Pass %s", tb_test_case);

$stop; 

end 

endmodule