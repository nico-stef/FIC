`include "adder.v"

`timescale 1ns / 1ps

module adder_tb;

    parameter W = 16;

    // Inputs
    reg [W-1:0] a;
    reg [W-1:0] b;

    // Output
    wire [W-1:0] y;

    // Instantiate the Unit Under Test (UUT)
    adder #(.W(W)) uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Test procedure
    initial begin
        // Initialize Inputs
        a = 0;
        b = 0;

        // Test 1
        a = 16'h0001; 
        b = 16'h0002;
        #10;
        $display("Test1: y = %b",y);

        // Test 2: Iese overflow
        a = 16'hFFFF;
        b = 16'h0001; 
        #10;
        $display("Test2: y = %b",y);

        // Test 3:
        a = 16'h0000; 
        b = 16'hABCD;
        #10;
      $display("Test3: y = %b",y);



        $finish;
    end
      
endmodule