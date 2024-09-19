`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 12:35:20 PM
// Design Name: 
// Module Name: sp_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sp_adder#(parameter W = 16)(
    input clk,
    input [W-1:0] input_stack,
    input ret_enable,
    output reg [W-1:0] output_stack
);

always @(posedge clk) begin
    if(ret_enable)
        output_stack = input_stack + 2;
    else
        output_stack = input_stack;
end
endmodule
