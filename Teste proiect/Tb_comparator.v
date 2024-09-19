`include "comparator.v"
`timescale 1ns / 1ps

module comparator_tb;

    parameter W = 16;

    // Inputs
  reg [W-1:0] a;
  reg [W-1:0] b;

    // Output
    wire equal;

    // Instantiate the Unit Under Test (UUT)
    comparator #(.W(W)) uut (
      .a(a),
      .b(b),
      .equal(equal)
    );

    initial begin
        // Initialize Inputs
        a = 0;
        b = 0;

        // Test 1:
        a = 0;
        b = 16'hAAFF;  
		#10;
      	$display("egual = %d",equal);

        // Test 2:
       	a = 16'h0022;
        b = 16'h0022;  
		#10;
      	$display("egual = %d",equal);

        $finish;
    end
      
endmodule