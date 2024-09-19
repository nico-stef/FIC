`timescale 1ns/1ns
module file_register#(parameter W = 16)(
    input wire clk,
    input wire rst,
    input wire write_enable,
  input [1:0] write_destination,
    input [W-1:0] write_data,
    input [5:0] opcode,
    input  [1:0] read_sources_1,
    input  [1:0] read_sources_2,
    output [W-1:0] register_data_1,
    output [W-1:0] register_data_2
);

parameter X = 0;
parameter Y = 1;
parameter ACCUMULATOR = 2;

reg     [15:0]     reg_array [2:0];

  initial begin
    reg_array[1] = 16'b0000000000000101;
    reg_array[2] = 16'b0000000000000011;
  end

always @(posedge clk, posedge rst) begin
  if(rst==0) begin
        reg_array[ACCUMULATOR] <= 16'b0;
        reg_array[X] <= 16'b0;
        reg_array[Y] <= 16'b0;
    end
    else begin
        if(write_enable) begin
           reg_array[write_destination] <= write_data;
        end
    end
end

parameter MOV = 6'b000100;
parameter IMOV = 6'b100100;

assign register_data_1 = (opcode == MOV || opcode == IMOV)? {14'b0,read_sources_1} : reg_array[read_sources_1]; // here check if we have mov and send read_sources_1;
assign register_data_2 = reg_array[read_sources_2];

endmodule