`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 02:35:44 PM
// Design Name: 
// Module Name: decide_branching
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


module decide_branching(
    input [3:0] flags,
    input wire branch_always,
    input wire branch_overflow,
    input wire branch_carry,
    input wire branch_zero,
    input wire branch_negative,
    output reg if_branch
);

always begin
    if(branch_always)
            if_branch = 1;
    else if(branch_overflow && flags[0])
            if_branch = 1;
    else if(branch_carry && flags[1])
            if_branch = 1;
    else if(branch_zero && flags[2])
            if_branch = 1;
    else if(branch_negative && flags[3])
            if_branch = 1;
    else
            if_branch = 0;
end

endmodule
