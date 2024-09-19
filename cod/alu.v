`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 11:09:46 AM
// Design Name: 
// Module Name: alu
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


module alu #(parameter W = 16)(
    input [4:0] alu_op,
    input [W-1:0] operandA,
    input [W-1:0] operandB,
    output reg [W-1:0] resultAccumulator,
    output reg [1:0] address,
    output [3:0] flags
    );
    
    reg N, Z, C, V;
    reg [W:0] carry_check;
    reg [W:0] auxDifference;
    reg [W-1:0] andResult;
    reg signed [W:0] signed_opA, signed_opB, signed_result;
    
    //ALU operation codes
    parameter ADD = 5'b00000;
    parameter SUB = 5'b00001;
    parameter LSR = 5'b00010;
    parameter LSL = 5'b00011;
    parameter MOV = 5'b00100;
    parameter RSR = 5'b00101;
    parameter RSL = 5'b00110;
    parameter MUL = 5'b00111;
    parameter DIV = 5'b01000;
    parameter MOD = 5'b01001;
    parameter AND = 5'b01010;
    parameter OR = 5'b01011;
    parameter XOR = 5'b01100;
    parameter NOT = 5'b01101;
    parameter CMP = 5'b01110;
    parameter TST = 5'b01111;
    parameter INC = 5'b10000;
    parameter DEC = 5'b10001;    
    //Setting for MOV
    parameter ACCUMULATOR = 2'b00;
    parameter X = 2'b01;
    parameter Y = 2'b10;
    
    always @* begin
        case(alu_op)
            ADD : resultAccumulator = operandA + operandB;
            SUB : resultAccumulator = operandA - operandB;
            LSR : resultAccumulator = operandA >> operandB;
            LSL : resultAccumulator = operandA << operandB;
            RSR : begin
                    if (operandB > 0 && operandB < W) begin
                        resultAccumulator = operandA >> operandB | operandA << (W - operandB);
                    end else begin
                        resultAccumulator = operandA;
                    end
                  end
            RSL : begin
                    if (operandB > 0 && operandB < W) begin
                        resultAccumulator = operandA << operandB | operandA >> (W - operandB);
                    end else begin
                        resultAccumulator = operandA;
                    end
                  end
            MUL : resultAccumulator = operandA * operandB;
            DIV : resultAccumulator = operandA / operandB;
            MOD : resultAccumulator = operandA % operandB;
            AND : resultAccumulator = operandA & operandB;
            OR : resultAccumulator = operandA | operandB;
            XOR : resultAccumulator = operandA ^ operandB;
            NOT : resultAccumulator = ~operandA;
            CMP : begin
                    auxDifference = operandA - operandB;
                    N = auxDifference[W-1];
                    Z = ~|auxDifference;
                    C = auxDifference[W];
                  end
            TST : begin
                    andResult = operandA & operandB;
                    if(andResult == 16'h0000) begin
                        Z = 1;
                    end
                    else begin
                        Z = 0;
                    end
                    
                    N = andResult[W-1];
                    C = 0;
                    V = 0;
                  end
            INC : resultAccumulator = operandA + 1;
            DEC : resultAccumulator = operandA - 1;
            MOV : begin
                address = operandA[1:0];
                resultAccumulator = operandB;
            end
            default : begin
                resultAccumulator = 16'hxxxx;
                address = 2'bxx;
            end
        endcase
    end
    
    always @* begin
        if(alu_op != CMP && alu_op != TST) begin
            carry_check = operandA + operandB;
            N = resultAccumulator[W-1];
            Z = (resultAccumulator == 0);
            C = carry_check[W];
            
            signed_opA = operandA;
            signed_opB = operandB;

            case (alu_op)
                ADD: begin
                    signed_result = signed_opA + signed_opB;
                    V = ((signed_opA[W-1] == signed_opB[W-1]) && (signed_result[W-1] != signed_opA[W-1]));
                end
                SUB: begin
                    signed_result = signed_opA - signed_opB;
                    V = ((signed_opA[W-1] != signed_opB[W-1]) && (signed_result[W-1] != signed_opA[W-1]));
                end
                default: begin
                    V = 0;
                end
            endcase
        end
    end
    
    assign flags = {N, Z, C, V};
    
endmodule
