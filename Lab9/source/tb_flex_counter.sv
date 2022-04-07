`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 5;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
  
  localparam  INACTIVE_VALUE     = 'b0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  localparam  ROLLOVER_FLAG = INACTIVE_VALUE;
  localparam  START_COUNT = 1'b1;
  localparam  END_COUNT = 1'b0;
  localparam NUM_CNT_BITS = 4;
  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [(NUM_CNT_BITS - 1):0] tb_rollover_val;
  reg [(NUM_CNT_BITS - 1):0] tb_count_out;
  reg tb_rollover_flag;
  
  // Declare test bench signals
  integer tb_test_case_num;
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;

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

//PUT CLEAR DUT
task clear_dut;
begin
  // Activate the clear
  tb_clear = 1'b1;

  // Maintain the clear for more than one cycle
  @(posedge tb_clk);
  @(posedge tb_clk);

  // Wait until safely away from rising edge of the clock

  @(negedge tb_clk);
  tb_clear = 1'b0;

  // Burn a few clock cycles before doing anything else
  @(negedge tb_clk);
  @(negedge tb_clk);
end
endtask

//Put check output and checkoutputflag
  task check_output;
    input logic [(NUM_CNT_BITS - 1):0] expected_count;
    input string check_tag;
  begin
    if(expected_count == tb_count_out) begin // Check passed
      $info("Correct count output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect count output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  task check_rollover;
    input logic expected_rollover;
    input string check_tag;
  begin
    if(expected_rollover == tb_rollover_flag) begin // Check passed
      $info("Correct rollover flag %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect count output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end


//DUT PORT MAP do not include parameter because we only want definitive values
  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

//Initialize tb_values, just the inputs
initial 
begin
  tb_test_num = 0;
  tb_n_rst = 1'b1;
  tb_clear = 1'b0;
  tb_count_enable = 1'b0;
  tb_rollover_val = 4'b1111;
  tb_rollover_flag = 1'b0;
  tb_count_out = 4'b0000;
  tb_test_case = "Test bench initialization";
  tb_stream_test_num = 0;
  tb_stream_check_tag = "N/A";

//Declare each test case
 
//********************************************
//        TEST 1: Power on Reset
//********************************************
  tb_test_num = tb_test_num + 1;
  tb_test_case = "Power on Reset";

  #(0.1);

  tb_count_enable = START_COUNT; // Enable the count

  #(0.1); // Wait to count for a bit before applying reset

  tb_n_rst = 1'b0; // Activate reset

  #(CLK_PERIOD * 0.5) // Wait for a bit to check value

  check_output(RESET_OUTPUT_VALUE, "after reset applied");

  #(CLK_PERIOD);

  check_output(RESET_OUTPUT_VALUE, "after clock cycle while reset on");

  @(negedge tb_clk)
  tb_n_rst = 1'b1; //Deactivate reset


  @(posedge tb_clk);
  #(CHECK_DELAY)

  check_output(4'b0001, "after reset was released");
  check_rollover(1'b0, "after reset was released");
 
//********************************************
//        TEST 2: Rollover for a rollover value not power ^2
//********************************************
@(negedge tb_clk);
tb_test_num = tb_test_num + 1;
tb_test_case = "Rollover not squared";
reset_dut();

tb_count_enable = START_COUNT;
tb_rollover_val = 4'b0101;

#(CLK_PERIOD * 7);

@(posedge tb_clk);
#(CHECK_DELAY);
check_rollover(1'b1, "TEST 2: Rollover at 5");
check_output(4'b0101, "TEST 2: Count at 5");

@(posedge tb_clk);
#(CHECK_DELAY);
check_rollover(1'b0, "TEST 2: Rollover after completion goes back to 0");
check_output(4'b0001, "TEST 2: Count output rolled over back to 1");
 
//********************************************
//        TEST 3: Continuous counting
//********************************************
@(negedge tb_clk);
tb_test_num = tb_test_num + 1;
tb_test_case = "Continuous counting";
reset_dut();

tb_count_enable = START_COUNT;
tb_rollover_val = 4'b1111;

#(CLK_PERIOD * 26); // 4'b1010

@(posedge tb_clk);
#(CHECK_DELAY);
check_rollover(1'b0, "TEST 3: Rollover should be 0 when count is at 1110");
check_output(4'b1110, "TEST 3: Count output should be 1110");

//********************************************
//        TEST 4: Discontinuous counting
//********************************************
@(negedge tb_clk);
tb_test_num = tb_test_num + 1;
tb_test_case = "Discontinuous counting";
reset_dut();

tb_count_enable = START_COUNT;
tb_rollover_val = 4'b1111;

#(CLK_PERIOD * 6);

tb_count_enable = END_COUNT;

#(CLK_PERIOD * 4);

@(negedge tb_clk)
tb_count_enable = START_COUNT;

#(CLK_PERIOD * 2);

@(posedge tb_clk);
#(CHECK_DELAY);
check_rollover(1'b0, "TEST 4: Rollover value should be 0");
check_output(4'b1011, "TEST 4: Count output should be blank");

//********************************************
//        TEST 5: Clear while counting
//********************************************
@(negedge tb_clk);
tb_test_num = tb_test_num + 1;
tb_test_case = "Clear while counting";
reset_dut();

tb_count_enable = START_COUNT;
tb_rollover_val = 4'b1111;

#(CLK_PERIOD * 8); // 4'b101

tb_clear = 1'b1;

#(CLK_PERIOD);

@(posedge tb_clk);
#(CHECK_DELAY);
check_output(4'b0000, "TEST 5: Count output should be 0 when cleared");
check_rollover(1'b0, "TEST 5: Rollover flag should be 0 when the clear is on");

$stop;
end
endmodule