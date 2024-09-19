`include "clock_counter.v"

`timescale 1ns / 1ns

module tb_clock_counter;

// Inputs
  reg clk;
  reg rst;

  // Outputs
  wire [15:0] count;



      // Instantiate the Unit Under Test (UUT)
  clock_counter #(16) uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );


  // Generarea clk
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
    clk = 1;
  end
  

  // Initializarea semnalelor
  initial begin
    
    $display("Count:");
    $display("count=%b", count);
    
    #100;
    
        $finish();
  end
  initial begin
    rst = 1;
    #10; 
    rst = 0;
    #10000;

  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule









