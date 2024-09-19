`include "shift_extend.v"

`timescale 1ns / 1ps

module sign_extend_tb;

    parameter W = 8;

    // Inputs
    reg [W-1:0] input_data;

    // Outputs
    wire [2*W-1:0] extended_data;

    // Instantiate the Unit Under Test (UUT)
    sign_extend #(.W(W)) uut (
        .input_data(input_data),
        .extended_data(extended_data)
    );


    initial begin
        input_data = 0;

        // Test 1: numar maxim
        input_data = 8'b11111111;
	#10; 
      $display("extended_data=%b",extended_data);

        // Test 2:numar negativ
        input_data = 8'b10000000;
	#10;
       $display("extended_data=%b",extended_data);

        // Test 3: numar random pozitiv
        input_data = 8'b01110101;
	#10;
       $display("extended_data=%b",extended_data);

        // Test 4: numar random negativ
        input_data = 8'b11110010;
	#10;
       $display("extended_data=%b",extended_data);

        $finish;
    end
      
endmodule