`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2023 05:44:32 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory#(parameter W = 16)(
    input wire [W-1:0] pc,
    output reg [W-1:0] instruction);
    
    reg [15:0] rom_memory [15:0];
    
    initial begin
        /*aici se vor stoca codurile tutror instrctiunilor folosite*/
        /*rom_memory[0] = 16'b...;*/
    end
    
    always @(*) begin
        instruction = rom_memory[pc];
    end
    
endmodule
