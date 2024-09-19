`include "sp_subtractor.v"

`timescale 1ns / 1ps

module sp_subtractor_tb;

    parameter W = 16;

    // Inputs
    reg clk;
    reg [W-1:0] input_stack;
    reg jump_enable;

    // Output
    wire [W-1:0] output_stack;

    // Instantiate the Unit Under Test (UUT)
    sp_subtractor #(.W(W)) uut (
        .clk(clk),
        .input_stack(input_stack),
        .jump_enable(jump_enable),
        .output_stack(output_stack)
    );

    // Generator clk
    always #10 clk = ~clk;

    initial begin
        //Inputs
        clk = 0;
        input_stack = 0;
        jump_enable = 0;

        #100;

        // Test 1:
        jump_enable = 0;
        input_stack = 16'h1015;
	#20; 
      $display("output_stack=%b",output_stack);

        // Test 2:
        jump_enable = 1;
        input_stack = 16'hABA2; 
	#20;
      $display("output_stack=%b",output_stack);
      

        $finish;
    end
      
endmodule