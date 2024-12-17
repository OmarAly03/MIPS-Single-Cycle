module instructionMemory(address, instruction); 
  input [31:0] address; 
  output reg [31:0] instruction; 
  
  reg [31:0] memory [0:31];
  
  initial begin
    memory[0] = 32'h8C0A0020; // lw
    memory[1] = 32'hAD310004; // sw
    memory[2] = 32'h02328020; // add
    memory[3] = 32'h016D4022; // sub
  end
  
  always @(*) 
    begin
      instruction = memory[address >> 2];
    end
endmodule
