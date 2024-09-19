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
        // Test 1: XOR
        operandA = -32;
        operandB = 5;
        alu_op = 5'b01100;
	#10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);
      
       // Test 2: XOR
        operandA = -13;
        operandB = -3;
        alu_op = 5'b01100;
	#10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);
      
       // Test 3: XOR
        operandA = 9;
        operandB = 0;
        alu_op = 5'b01100;
	#10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);
      
      // Test 4: XOR
        operandA = 16;
        operandB = 16;
        alu_op = 5'b01100;
	#10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);
      
      // Test 5: XOR
        operandA = 16;
        operandB = -10;
        alu_op = 5'b01100;
	#10;
        $monitor("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);

        $finish;
    end

endmodule



