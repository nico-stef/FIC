`include "data_memory.v"

`timescale 1ns / 1ps

module data_memory_tb;

    // Parameters
    parameter ADDR_WIDTH = 16;
    parameter DATA_WIDTH = 16;

    // Inputs
    reg clk;
    reg [ADDR_WIDTH-1:0] address;
    reg [DATA_WIDTH-1:0] data_input;
    reg write_enable;

    // Output
    wire [DATA_WIDTH-1:0] data_output;

    // Instantiate the Unit Under Test (UUT)
    data_memory #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) uut (
        .clk(clk),
        .address(address),
        .data_input(data_input),
        .write_enable(write_enable),
        .data_output(data_output)
    );

// Generarea semnalelor de ceas
  	always begin
    	#5 clk = ~clk;
  	end
  
  	initial begin
   	 clk = 0;
  	end

    initial begin
        //Initializare
        clk = 0;
        address = 0;
        data_input = 0;
        write_enable = 0;

      #100;
        //Test1 : Scriere
        write_enable = 1;
        address = 16'h0001; 
        data_input = 16'hA6A5; 
        #20;

        // Test 2: Scriere
        write_enable = 1;
        address = 16'h0002; 
        data_input = 16'h167D; 
        #20;
      
        // Test 3: Scriere
        write_enable = 1;
        address = 16'h0005; 
        data_input = 16'hFFFF; 
        #20;
        
        // Test 4: Scriere
        write_enable = 0;
        address = 16'h0001;  
        #20;
        $display("data_output=%b",data_output);
         
        // Test 5: Scriere
        write_enable = 0;
        address = 16'h0002;
        #20;
        $display("data_output=%b",data_output);
        
        // Test 5: Scriere
        write_enable = 0;
        address = 16'h0005; 
         #20;
        $display("data_output=%b",data_output);


     $finish();
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule