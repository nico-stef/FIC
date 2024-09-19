`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2024 10:45:46 PM
// Design Name: 
// Module Name: clock_decrement
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


module clock_decrement(
input [15:0] count_input,
input wire clk,
input wire rst,
output reg [15:0] count_output);

 always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_output <= count_input;
        end else begin
            count_output <= count_output - 1;
        end
    end
endmodule
