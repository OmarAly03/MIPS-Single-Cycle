`include "instructionMemory.v"

module instructionMemory_tb;
  reg [31:0] address;
  wire [31:0] instruction;

  instructionMemory imem (address, instruction);

  initial 
    begin
      address = 32'h00000000; #10; 
      address = 32'h00000004; #10;
      address = 32'h00000008; #10;
      address = 32'h0000000C; #10; 
      $stop;
  end
endmodule
