`include "demux2.v"
`timescale 1ns / 1ps

module demux2_tb;

    parameter W = 16;

    // Inputs
    reg [W-1:0] input_data;
  	reg select;

    // Outputs
    wire [W-1:0] output_data_0;
 	wire [W-1:0] output_data_1;

    // Instantiate the Unit Under Test (UUT)
    demux2 #(.W(W)) uut (
        .input_data(input_data),
        .select(select),
        .output_data_0(output_data_0),
      	.output_data_1(output_data_1)
    );

    initial begin
        // Initialize Inputs
        input_data = 0;
        select = 0;

        // Test 1:
        select = 0;
        input_data = 16'hAAFF;  
		#10;
      	$display("output_data_0 = %b,output_data_1 = %b",output_data_0,output_data_1);

        // Test 2:
        select = 1; 
        input_data = 16'hFF8F; 
		#10;
       	$display("output_data_0 = %b,output_data_1 = %b",output_data_0,output_data_1);

        $finish;
    end
      
endmodule