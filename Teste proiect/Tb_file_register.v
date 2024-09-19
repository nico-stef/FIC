`include "file_register.v"

`timescale 1ns / 1ns

module file_register_tb;

    parameter W = 16;
    reg clk;
    reg rst;
    reg write_enable;
    reg [1:0] write_destination;
    reg [W-1:0] write_data;
    reg [5:0] opcode;
    reg [1:0] read_sources_1;
    reg [1:0] read_sources_2;
    wire [W-1:0] register_data_1;
    wire [W-1:0] register_data_2;

      // Instantiate the Unit Under Test (UUT)
    file_register #(.W(W)) uut (
        .clk(clk),
        .rst(rst),
        .write_enable(write_enable),
        .write_destination(write_destination),
        .write_data(write_data),
        .opcode(opcode),
        .read_sources_1(read_sources_1),
        .read_sources_2(read_sources_2),
        .register_data_1(register_data_1),
        .register_data_2(register_data_2)
    );

  // Generarea semnalelor de ceas
  always begin
    #5 clk = ~clk;
  end
  
  initial begin

    clk = 0;
      write_enable = 0;
        write_destination = 0;
        write_data = 0;
        opcode = 0;
        read_sources_1 = 0;
        read_sources_2 = 0;

  end
  

  // Initializarea semnalelor
  initial begin
    
        //Test1
        opcode = 6'b000100;
        read_sources_1 = 2;
        read_sources_2 = 2;
        write_enable = 1;
        write_destination = 2;
        write_data = 16'hEAAE;
    #20;
       $display("register_data1: %b, register_data2: %b",register_data_1, register_data_2);
    
            //Test2
        opcode = 6'b100100;
        read_sources_1 = 3;
        read_sources_2 = 2;
        write_enable = 1;
        write_destination = 1;
        write_data = 16'hABCD;
    #20;
       $display("register_data1: %b, register_data2: %b",register_data_1, register_data_2);
    
            //Test3
        opcode = 6'b101010;
        read_sources_1 = 1;
        read_sources_2 = 1;
        write_enable = 0;
        write_destination = 0;
        write_data = 16'h0935;
    #20;
       $display("register_data1: %b, register_data2: %b",register_data_1, register_data_2);
    
        $finish();
  end
  initial begin
    rst = 1;
    #10; 
    rst = 0;
    #10000;

  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule






