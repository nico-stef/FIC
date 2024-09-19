`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2024 02:58:11 PM
// Design Name: 
// Module Name: demux2
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


module demux2 #(parameter W = 16) (
    input [W-1:0] input_data,
    input select,
    output reg[W-1:0] output_data_0,
    output reg[W-1:0] output_data_1);
    
    always @(*) begin
        case(select)
            1'b0 : begin
                output_data_0 = input_data;
                output_data_1 = 16'b0;
            end
            1'b1 : begin
                output_data_0 = 16'b0;
                output_data_1 = input_data;
            end
        endcase
    end
endmodule
