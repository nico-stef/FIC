`include "control_unit.v"

`timescale 1ns / 1ps

module control_unit_tb;

    // Inputs
  reg [5:0] opcode;
    reg rst;

    // Outputs
    wire [4:0] alu_op;
    wire jump, branch_zero, branch_negative, branch_carry, branch_overflow, branch_always, alu_source, write_enable_DM, write_enable_RF, pc_or_data, mem_to_reg, write_address_DM, imm_pos, ret;

    // Instantiate the Unit Under Test (UUT)
    control_unit uut (
        .opcode(opcode),
        .rst(rst),
        .alu_op(alu_op),
        .jump(jump),
        .branch_zero(branch_zero),
        .branch_negative(branch_negative),
        .branch_carry(branch_carry),
        .branch_overflow(branch_overflow),
        .branch_always(branch_always),
        .alu_source(alu_source),
        .write_enable_DM(write_enable_DM),
        .write_enable_RF(write_enable_RF),
        .pc_or_data(pc_or_data),
        .mem_to_reg(mem_to_reg),
        .write_address_DM(write_address_DM),
        .imm_pos(imm_pos),
        .ret(ret)
    );

 
    initial begin
        // Initialize Inputs
        opcode = 0;
        rst = 1;

        // Reset
        #100;
        rst = 0;
      
        //Test1 : opcode - ADD
        opcode = 6'b000000; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
        //Test2 : opcode - DIV 
        opcode = 6'b001000; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;

      //Test3 : opcode - XOR  
      opcode = 6'b001100; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
      //Test4 : opcode - NOT 
       opcode = 6'b001101; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
       //Test5 : opcode - MOD immediate
        opcode = 6'b101001; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
      //Test6 : opcode - DEC immediate
       opcode = 6'b110001; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
      //Test7 : opcode - BRN 
       opcode = 6'b010011; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
      //Test8 : opcode - RET 
      opcode = 6'b011000; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
      //Test9 : opcode - SW   
       opcode = 6'b011010; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
        #20;
      
        //Test10 : opcode - MUL 
        rst = 1;
        #20;
       opcode = 6'b000111; $display("Test1:alu_op=%b,alu_source=%d,jump=%d,branch_zero=%d,branch_negative=%d,branch_carry=%d,branch_overflow=%d,branch_always=%d,write_enable_DM=%d,write_enable_RF=%d,pc_or_data=%d,mem_to_reg=%d,write_address_DM=%d,imm_pos=%d,ret=%d",alu_op,alu_source,jump,branch_zero,branch_negative,branch_carry,branch_overflow,branch_always,write_enable_DM,write_enable_RF,pc_or_data,mem_to_reg,write_address_DM,imm_pos,ret);
      

        $finish;
    end
      
endmodule