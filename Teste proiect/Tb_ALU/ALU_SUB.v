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
        // Test 1: ADD
        operandA = 10;
        operandB = 5;
        alu_op = 5'b00001;
        #10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);
      
       // Test 2: ADD
        operandA = -13;
        operandB = -7;
        alu_op = 5'b00001;
        #10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);
      
       // Test 3: ADD
        operandA = 1;
        operandB = -9;
        alu_op = 5'b00001;
	#10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);

	// Test 4: ADD
        operandA = 3;
        operandB = -7;
        alu_op = 5'b00001;
	#10;
        $display("OperandA: %0d, OperandB: %0d, Result: %0d", operandA, operandB, result);

        $finish;
    end

endmodule