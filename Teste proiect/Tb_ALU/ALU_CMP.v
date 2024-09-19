`include "alu.v"

`timescale 1ns/1ns

module tb_alu;

     //Parametrii 
    parameter W = 16;
    parameter SIM_TIME = 100;

     //Semnale intrare
  	reg signed [W-1:0] operandA, operandB;
  	reg [4:0] alu_op;

     //Semnale iesire
  	wire signed [W-1:0] result;
  	wire [3:0] flags;

     //Instantierea modulului alu
    alu #(W) dut (
        .alu_op(alu_op),
        .operandA(operandA),
        .operandB(operandB),
        .resultAccumulator(result),
        .flags(flags)
    );

    initial begin
         //Test 1 CMP
        operandA = -32;
        operandB = 5;
        alu_op = 5'b01110;
      	#10;
      $display("OperandA=%0d, OperandB=%0d,Flags=%b", operandA,operandB,flags);
      
        //Test 2 CMP
        operandA = -13;
        operandB = -3;
        alu_op = 5'b01110;
      	#10;
      $display("OperandA=%0d, OperandB=%0d,Flags=%b", operandA,operandB,flags);
      
        //Test 3 CMP
        operandA = 9;
        operandB = -1;
        alu_op = 5'b01110;
     	 #10;
       $display("OperandA=%0d, OperandB=%0d,Flags=%b", operandA,operandB,flags);
      
       //Test 4 CMP
        operandA = 16;
        operandB = 11;
        alu_op = 5'b01110;
      	#10;
      $display("OperandA=%0d, OperandB=%0d,Flags=%b", operandA,operandB,flags);
 
        $finish;
    end

endmodule