`include "instruction_memory.v"

`timescale 1ns / 1ps

module instruction_memory_tb;

    parameter W = 16;

    // Input
    reg [W-1:0] pc;

    // Output
    wire [W-1:0] instruction;

    // Instantiate the Unit Under Test (UUT)
    instruction_memory #(.W(W)) uut (
        .pc(pc),
        .instruction(instruction)
    );

    initial begin
      //Sa se afiseze instructiunele salvate in instruction_memory.v(sunt momentan 3)
        pc = 0;

        // Test 1: prima instructiune
        pc = 16'h0000;
        #10;
      $display("instruction = %b",instruction);
        #10;

        // Test 2: a doua instructiune
        pc = 16'h0001;
	#10;
      $display("instruction = %b",instruction);

        // Test 3: atreia instrctiune
        pc = 16'h0002;
	#10;
      $display("instruction = %b",instruction);
      
      
        $finish;
    end
      
endmodule