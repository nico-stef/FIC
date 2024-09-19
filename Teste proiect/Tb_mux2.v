`include "mux2.v"
`timescale 1ns / 1ps

module mux2_tb;

    parameter W = 8;

    // Inputs
    reg [W-1:0] d0;
    reg [W-1:0] d1;
    reg s;

    // Output
    wire [W-1:0] y;

    // Instantiate the Unit Under Test (UUT)
    mux2 #(.W(W)) uut (
        .d0(d0),
        .d1(d1),
        .s(s),
        .y(y)
    );

    initial begin
        // Initialize Inputs
        d0 = 0;
        d1 = 0;
        s = 0;

        // Test 1: selecteaza d0
        d0 = 8'hAA; 
        d1 = 8'h11; 
        s = 0;
	#10;
      $display("y = %b",y);

        // Test 2: selecteaza d1
        d0 = 8'hFF; 
        d1 = 8'h53; 
        s = 1;
	#10;
      $display("y = %b",y);

        $finish;
    end
      
endmodule