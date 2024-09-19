`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2023 04:10:42 PM
// Design Name: 
// Module Name: sign_extend
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


module sign_extend#(parameter W = 8)(
    input [W-1:0] input_data,
    output reg [2*W-1:0] extended_data
);

always @* begin
    extended_data = {{(W-1){input_data[W-1]}}, input_data};
end

endmodule
