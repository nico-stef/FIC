`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2024 03:21:48 PM
// Design Name: 
// Module Name: clock_counter
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


module clock_counter(
input wire clk,
input wire rst,
output reg [15:0] count);

 always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 16'b0;
        end else begin
            count <= count + 1;
        end
    end
endmodule
