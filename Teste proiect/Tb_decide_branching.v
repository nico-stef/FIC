`include "decide_branching.v"

`timescale 1ns / 1ps

module decide_branching_tb;

    // Inputs
    reg [3:0] flags;
    reg branch_always;
    reg branch_overflow;
    reg branch_carry;
    reg branch_zero;
    reg branch_negative;

    // Output
    wire if_branch;

    // Instantiate the Unit Under Test (UUT)
    decide_branching uut (
        .flags(flags),
        .branch_always(branch_always),
        .branch_overflow(branch_overflow),
        .branch_carry(branch_carry),
        .branch_zero(branch_zero),
        .branch_negative(branch_negative),
        .if_branch(if_branch)
    );

    // Test procedure
    initial begin
        flags = 4'b0000;
        branch_carry = 0;
        branch_zero = 0;
        branch_always = 0;
        branch_overflow = 0;
        branch_negative = 0;

        // Wait for global reset
        #100;

        // Test 1: Branch Always
        branch_always = 1;
        #20;
      $display("Branch Always-if_branch: %d",if_branch);

        // Test 2: Branch Overflow
        branch_always = 0;
        branch_overflow = 1;
        flags = 4'b0001;
        #20;
      $display("Branch Overflow-if_branch: %d",if_branch);

        // Test 3: Branch Carry
        branch_overflow = 0;
        branch_carry = 1;
        flags = 4'b0010;
      $display("Branch Carry-if_branch: %d",if_branch);
        #20;

        // Test 4: Branch Zero
        branch_carry = 0;
        branch_zero = 1;
        flags = 4'b0100;
        #20;
       $display("Branch Zero-if_branch: %d",if_branch);

        // Test 5: Branch Negative
        branch_zero = 0;
        branch_negative = 1;
        flags = 4'b1000;
      $display("Branch Negative-if_branch: %d",if_branch);
        #20;
      
        // Test 6: Another Case 1
        flags = 4'b1010;
        branch_carry = 0;
        branch_zero = 1;
        branch_always = 0;
        branch_overflow = 1;
        branch_negative = 1;
        #20;
      $display("Another case 1-if_branch: %d",if_branch);
      
       // Test 7: Another Case 2
        flags = 4'b0110;
        branch_carry = 0;
        branch_zero = 0;
        branch_always = 0;
        branch_overflow = 1;
        branch_negative = 1;
      #10;
      $display("Another case 2-if_branch: %d",if_branch);
        

        $finish;
    end
      
endmodule