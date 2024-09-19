`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2023 06:08:00 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory#(parameter ADDR_WIDTH = 16, parameter DATA_WIDTH = 16)(
        input wire clk,
        input [ADDR_WIDTH-1:0] address,
        input [DATA_WIDTH-1:0] data_input,
        input wire write_enable,
        output reg [DATA_WIDTH-1:0] data_output
    );
    
    reg [DATA_WIDTH-1:0] ram_memory [255:0];
    
    always @(posedge clk) begin
        if(write_enable) begin
            ram_memory[address] <= data_input;
        end
        else begin
            data_output <= ram_memory[address];
        end
    end
    
endmodule
