`include "multiplier.v"
`timescale 1ns / 1ps

module multiplier_tb;

    parameter W = 16;

    // Inputs
  reg [W-1:0] a;
  reg [W-1:0] b;

    // Outputs
    wire [W-1:0] y;

    // Instantiate the Unit Under Test (UUT)
    multiplier #(.W(W)) uut (
      .a(a),
      .b(b),
      .y(y)
    );

    initial begin
        // Initialize Inputs
        a = 0;
        b = 0;

        // Test 1:
        a = 0;
        b = 16'hAAFF;  
		#10;
        $display("y = %d",y);

        // Test 2:
       	a = 16'h0016;
        b = 16'h0016;  
		#10;
      	$display("y = %d",y);
      
       // Test 2:
       	a = 16'h0001;
        b = 16'hFF23;  
		#10;
      	$display("y = %d",y);

        $finish;
    end
      
endmodule