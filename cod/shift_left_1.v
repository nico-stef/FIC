`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2023 04:17:46 PM
// Design Name: 
// Module Name: shift_left_2
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


module shift_left_1#(parameter W = 16)(
    input [W-1:0] data_to_shift,
    output reg [W-1:0] shifted_data
);

always @* begin
    shifted_data = {data_to_shift[W-2:0], 1'b0};
end

endmodule
