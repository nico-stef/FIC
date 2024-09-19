`include "shift_left.v"

`timescale 1ns / 1ps

module shift_left_tb;

    parameter W = 8;

    // Inputs
  reg [W-1:0] data_to_shift;

    // Outputs
    wire [W-1:0] shifted_data;

    // Instantiate the Unit Under Test (UUT)
    shift_left #(.W(W)) uut (
        .data_to_shift(data_to_shift),
        .shifted_data(shifted_data)
    );


    initial begin
        data_to_shift = 0;

        // Test 1: numar maxim
        data_to_shift = 8'b11111111;
	#10; 
      $display("shifted_data=%b",shifted_data);

        // Test 2:numar negativ
        data_to_shift = 8'b10000000;
	#10;
      $display("shifted_data=%b",shifted_data);

        // Test 3: numar random pozitiv
        data_to_shift = 8'b01110101;
        #10;
      $display("shifted_data=%b",shifted_data);

        // Test 4: numar random negativ
        data_to_shift = 8'b11110010;
	#10;
      $display("shifted_data=%b",shifted_data);

        $finish;
    end
      
endmodule