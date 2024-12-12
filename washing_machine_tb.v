module washing_mcachine_tb();

  reg clk;
  reg rst;
  reg cycle;
  reg supply;
  wire [2:0] stage;

  washing_machine uut (
    .clk(clk),
    .rst(rst),
    .cycle(cycle),
    .supply(supply),
    .stage(stage)
  );

  always #5 clk = ~clk; 

  initial begin
    clk = 0;
    rst = 1; // Reset active
    cycle = 0;
    supply = 0; // Supply off initially

    // Release reset after some time
    #10 rst = 0;

    // Test scenario: Start the washing cycle with supply on
    #10 supply = 1;
    #10 cycle = 1; // Start cycle

    // Allow the machine to transition through some states
    #50;

    // Test scenario: Turn off supply mid-operation
    #20 supply = 0;

    // Wait for a while to observe state retention
    #50;

    // Turn supply back on and resume operation
    #10 supply = 1;
    
   // Allow the machine to transition through some states
    #175;
    // Test scenario: Turn off supply mid-operation
    #20 supply = 0;

    // Wait for a while to observe state retention
    #50;

    // Turn supply back on and resume operation
    #10 supply = 1;
    // Allow the machine to continue
    #1000;

    $finish;
  end

  initial begin
    $monitor($time, " | clk=%b | rst=%b | cycle=%b | supply=%b | stage=%b", clk, rst, cycle, supply, stage);
  end

endmodule