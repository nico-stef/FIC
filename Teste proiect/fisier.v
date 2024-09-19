`timescale 1ns/1ns
module control_unit(
    input [6:0] opcode,
    input rst,
    output reg[4:0]alu_op,
    output reg jump, branch_zero, branch_negative, branch_carry, branch_overflow, branch_always, alu_source, write_enable_DM, write_enable_RF, pc_or_data, mem_to_reg, write_address_DM, imm_pos, ret
);

always @(*) begin
    if(rst) begin
        alu_op = 5'b00000;
	    alu_source = 0;
        jump = 0;
        branch_zero = 0;
	    branch_negative = 0;
	    branch_carry = 0;
	    branch_overflow = 0;
	    branch_always = 0;
        write_enable_DM = 0;
        write_enable_RF = 0;
        pc_or_data = 0;
        mem_to_reg = 0;
        write_address_DM = 0;
        imm_pos = 0;
        ret = 0;
    end
    else begin
    case(opcode)
	//arithmetic
        6'b000000: begin
            alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b000001: begin
            alu_op = 5'b00001;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b000010: begin
            alu_op = 5'b00010;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b000011: begin
            alu_op = 5'b00011;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b000100: begin
            alu_op = 5'b00100;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b000101: begin
            alu_op = 5'b00101;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b000110: begin
            alu_op = 5'b00110;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b000111: begin
            alu_op = 5'b00111;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001000: begin
            alu_op = 5'b01000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001001: begin
            alu_op = 5'b01001;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001010: begin
            alu_op = 5'b01010;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001011: begin
            alu_op = 5'b01011;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001100: begin
            alu_op = 5'b01100;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001101: begin
            alu_op = 5'b01101;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001110: begin
            alu_op = 5'b01110;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b001111: begin
            alu_op = 5'b01111;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b010000: begin
            alu_op = 5'b10000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b010001: begin
            alu_op = 5'b10001;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100000: begin
            alu_op = 5'b00000;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100001: begin
            alu_op = 5'b00001;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100010: begin
            alu_op = 5'b00010;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100011: begin
            alu_op = 5'b00011;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100100: begin
            alu_op = 5'b00100;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100101: begin
            alu_op = 5'b00101;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100110: begin
            alu_op = 5'b00110;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b100111: begin
            alu_op = 5'b00111;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101000: begin
            alu_op = 5'b01000;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101001: begin
            alu_op = 5'b01001;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101010: begin
            alu_op = 5'b01010;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101011: begin
            alu_op = 5'b01011;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101100: begin
            alu_op = 5'b01100;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101101: begin
            alu_op = 5'b01101;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101110: begin
            alu_op = 5'b01110;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b101111: begin
            alu_op = 5'b01111;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b110000: begin
            alu_op = 5'b10000;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
        6'b110001: begin
            alu_op = 5'b10001;
	        alu_source = 1;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
        end
	//end of arithmetic
	//branch
	6'b010010 : begin //brz
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 1;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 0;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
	end
	6'b010011 : begin //brn
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 1;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 0;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
	end
	6'b010100 : begin //brc
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 1;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 0;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
	end
	6'b010101 : begin //bro
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 1;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 0;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
	end
	6'b010110 : begin //bra
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 1;
            write_enable_DM = 0;
            write_enable_RF = 0;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
	end
	6'b010111 : begin //jmp
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 1;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 1;
            write_enable_RF = 0;
            pc_or_data = 1;
            mem_to_reg = 0;
            write_address_DM = 1;
            imm_pos = 0;
            ret = 0;
	end
	6'b011000 : begin //ret
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 0;
            pc_or_data = 0;
            mem_to_reg = 1;
            write_address_DM = 1;
            imm_pos = 0;
            ret = 1;
	end
	//end of branch
	//load and store
	6'b011001 : begin //lw
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 0;
            write_enable_RF = 1;
            pc_or_data = 0;
            mem_to_reg = 1;
            write_address_DM = 0;
            imm_pos = 0;
            ret = 0;
	end
	6'b011010 : begin //sw
	        alu_op = 5'b00000;
	        alu_source = 0;
            jump = 0;
            branch_zero = 0;
	        branch_negative = 0;
	        branch_carry = 0;
 	        branch_overflow = 0;
	        branch_always = 0;
            write_enable_DM = 1;
            write_enable_RF = 0;
            pc_or_data = 0;
            mem_to_reg = 0;
            write_address_DM = 0;
            imm_pos = 1;
            ret = 0;
	end
	//end of load and store
      endcase
    end
end

endmodule
