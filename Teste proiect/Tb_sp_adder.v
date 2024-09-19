`include "sp_adder.v"

`timescale 1ns / 1ps

module sp_adder_tb;

    parameter W = 16;

    // Inputs
    reg clk;
    reg [W-1:0] input_stack;
    reg ret_enable;

    // Output
    wire [W-1:0] output_stack;

    // Instantiate the Unit Under Test (UUT)
    sp_adder #(.W(W)) uut (
        .clk(clk),
        .input_stack(input_stack),
        .ret_enable(ret_enable),
        .output_stack(output_stack)
    );

    // Generator clock
    always #10 clk = ~clk;

    initial begin
        // Initializare input
        clk = 0;
        input_stack = 0;
        ret_enable = 0;

        #100;

        // Test 1:
        ret_enable = 0;
        input_stack = 16'h1015;
 	#20;
        $display("output_stack=%b",output_stack);

        // Test 2:
        ret_enable = 1;
        input_stack = 16'hABA2;
 	#20;
        $display("output_stack=%b",output_stack);

        $finish;
    end
      
endmodule