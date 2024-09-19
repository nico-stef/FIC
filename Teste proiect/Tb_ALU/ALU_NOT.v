`include "alu.v"

`timescale 1ns/1ns

module tb_alu;

    // Parametrii 
    parameter W = 16;
    parameter SIM_TIME = 100;

    // Semnale intrare
    reg signed [W-1:0] operandA, operandB;
    reg [4:0] alu_op;

    // Semnale iesire
    wire signed [W-1:0] result;
    wire [3:0] flags;

    // Instantierea modulului alu
    alu #(W) dut (
        .alu_op(alu_op),
        .operandA(operandA),
        .operandB(operandB),
        .resultAccumulator(result),
        .flags(flags)
    );

    initial begin
        // Test 1: NOT
        operandA = -32;
        alu_op = 5'b01101;
	#10;
        $display("OperandA: %0d, Result: %0d", operandA, result);
      
       // Test 2: NOT
        operandA = -13;
        alu_op = 5'b01101;
	#10;
        $display("OperandA: %0d, Result: %0d", operandA, result);
      
       // Test 3: NOT
        operandA = 0;
        alu_op = 5'b01101;
	#10;
        $display("OperandA: %0d, Result: %0d", operandA, result);
      
      // Test 4: NOT
        operandA = 347;
        alu_op = 5'b01101;
	#10;
        $display("OperandA: %0d, Result: %0d", operandA, result);
      


        $finish;
    end

endmodule



