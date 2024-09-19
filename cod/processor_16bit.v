module processor_16bit#(parameter W = 16)(
    input clk,
    input rst,
    output [W-1:0] pc_new,
    output [W-1:0] output_final_alu
);
//variables
wire [W-1:0] fetched_instruction;
wire signed[W-1:0] pc_next,pc2,pc_branch,pc_next_patial;
reg [W-1:0] pc_current;
wire [4:0] alu_op;
wire [3:0] flags;
wire branch; 
wire [W-1:0] stack_pointer_output;
wire [W-1:0] alu_out_partial;
wire [W-1:0] exetend_immediate_used_shifted;
wire [W-1:0] immediate;
wire [W-1:0] data_written_RF;
wire [W-1:0] data_written_DM;
wire [W-1:0] data_address_DM;
wire [W-1:0] data_output_DM;
wire [W-1:0] alu_out;
wire [1:0] write_detination_RF = 2'b00;
wire [W-1:0] output_data_RF_1;
wire [W-1:0] output_data_RF_2;
wire [7:0] immediate_1;
wire [7:0] immediate_2;
wire [7:0] immediate_used;
wire signed [W-1:0] extended_immediate_used;
wire [W-1:0] alu_operand_1;
wire [9:0] jump_address_shifted;
wire [W-1:0] jump_address_extended;
wire [3:0] alu_flags;
wire [W-1:0] stack_pointer = 16'b0000000110010000;
wire [W-1:0] power_operand_2;
wire [W-1:0] multiplier_result;
wire [W-1:0] count;
wire [W-1:0] regular_alu_out;
wire [W-1:0] power_result;
wire [W-1:0] factorial_result;
wire [W-1:0] operand_fact_2;
wire [W-1:0] partial_fact;
wire [W-1:0] partial_fact_output;
wire select_operand_multiplier;
wire select_demux;
wire [W-1:0] input_demux;
wire jump, branch_zero, branch_negative, branch_carry, branch_overflow, branch_always, alu_source, write_enable_DM, write_enable_RF, pc_or_data, mem_to_reg, write_address_DM, imm_pos, ret, power, factorial;
//variables

always @(posedge clk or posedge rst) begin
    if(rst)
        pc_current <= 16'd0;
    else
        pc_current <= pc_next;
end

assign pc2 = pc_current + 16'd2;
assign power_operand_2 = 16'd1;
  
//luam instructiunea din instruction memory
instruction_memory instruction_memory(
.pc(pc_current), 
.instruction(fetched_instruction));

//initializarea control_unit conform instructiuni
control_unit control_unit(
.opcode(fetched_instruction[15:10]),
.rst(rst),
.alu_op(alu_op),
.jump(jump),
.branch_zero(branch_zero),
.branch_negative(branch_negative),
.branch_carry(branch_carry),
.branch_overflow(branch_overflow),
.branch_always(branch_always),
.alu_source(alu_source),
.write_enable_DM(write_address_DM),
.write_enable_RF(write_enable_RF),
.pc_or_data(pc_or_data),
.mem_to_reg(mem_to_reg),
.write_address_DM(write_address_DM),
.imm_pos(imm_pos),
.ret(ret),
.power(power),
.factorial(factorial)
);

//register file
file_register file_register(
.clk(clk),
.rst(rst),
.write_enable(write_enable_RF),
.write_destination(write_detination_RF), //fetched_instruction[9:7]
.write_data(data_written_RF),
.opcode(fetched_instruction[15:10]),
.read_sources_1(fetched_instruction[9:8]),
.read_sources_2(fetched_instruction[7:6]),
.register_data_1(output_data_RF_1),
.register_data_2(output_data_RF_2)
);

//decide size of immediate
assign immediate_1 = fetched_instruction[7:0];
assign immediate_2 = {2'b0, fetched_instruction[5:0]};
mux2 mux2(
.d0(immediate_1),
.d1(immediate_2),
.s(imm_pos),
.y(immediate_used)
);

//extend immediate
sign_extend sign_extend(
.input_data(immediate_used),
.extended_data(extended_immediate_used)
);

//jump address
shift_left_1 #(10) shift_left_jump(
.data_to_shift(fetched_instruction[9:0]),
.shifted_data(jump_address_shifted)
);

//alu part
mux2 #(16) mux_alu_src(
.d0(output_data_RF_1),
.d1(extended_immediate_used),
.s(alu_source),
.y(alu_operand_1)
);

//power operation
  
multiplier multiplier(
.a(output_data_RF_2),
.b(power_operand_2),
.y(multiplier_result)
);

clock_counter clock_counter(
.clk(clk),
.rst(rst),
.count(count)
);

comparator comparator_0(
.a(count),
.b(16'b0),
.equal(select_operand_multiplier)
);

mux2 #(16) sel_operator(
.d0(multiplier_result),
.d1(1),
.s(select_operand_multiplier),
.y(input_demux)
);

comparator comparator_1(
.a(count),
.b(alu_operand_1),
.equal(select_demux)
);

demux2 demux2(
.input_data(input_demux),
.select(select_demux),
.output_data_0(power_operand_2),
.output_data_1(power_result)
);


//factorial operation
assign count = alu_operand_1;
assign partial_fact = partial_fact_output;

comparator comparator_2(
.a(count),
.b(alu_operand_1),
.equal(select_operand_multiplier)
);

mux2 #(16) select_operand_fact(
.d0(partial_fact),
.d1(1),
.s(select_operand_multiplier),
.y(operand_fact_2)
);

clock_decrement clock_decrement(
.count_input(count),
.clk(clk),
.rst(rst),
.count_output(count)
);

multiplier mutiplier_fact(
.a(count),
.b(operand_fact_2),
.y(partial_fact)
);

comparator comparator_3(
.a(count),
.b(16'b0),
.equal(select_demux)
);

demux2 demux2_1(
.input_data(partial_fact),
.select(select_demux),
.output_data_0(partial_fact_output),
.output_data_1(factorial_result)
);

//alu operation
alu alu(
.alu_op(alu_op),
.operandA(alu_operand_1),
.operandB(output_data_RF_2),
.resultAccumulator(regular_alu_out),
.address(write_detination_RF),
.flags(alu_flags)
);

mux2 #(16) alu_result1(
.d0(regular_alu_out),
.d1(power_result),
.s(power),
  .y(alu_out_partial)
);

mux2 #(16) alu_result2(
.d0(alu_out_partial),
.d1(factorial_result),
.s(factorial),
.y(alu_out)
);

//write in data memory
sp_subtractor sp_subtractor(
.clk(clk),
.input_stack(stack_pointer),
.jump_enable(jump),
  .output_stack(stack_pointer_output)
);

mux2 #(16) data_DM(
.d0(output_data_RF_1),
.d1(pc2),
.s(pc_or_data),
.y(data_written_DM)
);

mux2 #(16) address_DM(
.d0(output_data_RF_2),
  .d1(stack_pointer_output),
.s(write_address_DM),
.y(data_address_DM)
);

data_memory data_memory(
.clk(clk),
.address(data_address_DM),
.data_input(data_written_DM),
.write_enable(write_enable_DM),
.data_output(data_output_DM)
);

//read from data memory, branchinf and jumping
mux2 #(16) memory_or_alu(
.d0(alu_out),
.d1(data_output_DM),
.s(mem_to_reg),
.y(data_written_RF)
);

sp_adder sp_adder(
.clk(clk),
.input_stack(stack_pointer_output),
.ret_enable(ret),
.output_stack(stack_pointer)
);

shift_left_1 shift_left_immediate(
.data_to_shift(extended_immediate_used),
.shifted_data(exetend_immediate_used_shifted)
);

adder adder(
.a(pc2),
.b(exetend_immediate_used_shifted),
.y(pc_branch)
);

mux2 #(16) if_ret(
.d0(pc_branch),
.d1(data_written_RF),
.s(ret),
.y(pc_next)
);

//branch_zero, branch_negative, branch_carry, branch_overflow, branch_always,
decide_branching decide_branching(
.flags(alu_flags),
.branch_always(branch_always),
.branch_overflow(branch_overflow),
.branch_carry(branch_carry),
.branch_zero(branch_zero),
.branch_negative(branch_negative),
.if_branch(branch)
);

mux2 #(16) if_branch(
.d0(pc2),
.d1(pc_next),
.s(branch),
.y(pc_next_patial)
);

assign jump_address_extended = {6'b0,jump_address_shifted};

mux2 #(16) if_jump(
.d0(pc_next_patial),
.d1(jump_address_extended),
.s(jump),
.y(pc_new)
);

assign output_final_alu = alu_out;

endmodule