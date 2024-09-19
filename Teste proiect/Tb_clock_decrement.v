`include "clock_decrement.v"

`timescale 1ns / 1ns

module tb_clock_decrement;

// Inputs
  reg clk;
  reg rst;
  reg [15:0] count_input;

  // Outputs
  wire [15:0] count_output;



      // Instantiate the Unit Under Test (UUT)
  clock_decrement #(16) uut (
    .count_input(count_input),
    .clk(clk),
    .rst(rst),
    .count_output(count_output)
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
    
    count_input=16'h0001;
    #10;
    $display("Count_output:%b", count_output);
             
    count_input=16'hABC1;
    #10;
    $display("Count_output:%b", count_output);
    
    count_input=16'hFFAA;
    #10;
    $display("Count_output:%b", count_output);
    
    count_input=16'hCEAB;
    #10;
    $display("Count_output:%b", count_output);
    
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