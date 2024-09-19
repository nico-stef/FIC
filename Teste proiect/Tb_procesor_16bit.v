`include "procesor_16bit.v"

`timescale 1ns / 1ns

module tb_processor_16bit;

// Inputs
  reg clk;
  reg rst;

  // Outputs
  wire [15:0] pc_new;



      // Instantiate the Unit Under Test (UUT)
  processor_16bit #(16) uut (
    .clk(clk),
    .rst(rst),
    .pc_new(pc_new)
  );


  // Generarea semnalelor de ceas
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
    clk = 0;
  end
  

  // Initializarea semnalelor
  initial begin
    
    $display("Procesor inainte de ADD:");
    $display("pc_new=%b", pc_new);
    
    #100;
    
    $display("Procesor dupa ADD:");
    $display("pc_new=%b", pc_new);
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