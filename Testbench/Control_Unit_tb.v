module Control_Unit_tb;
  reg [5:0] opcode;
  wire RegDst, ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOP1, ALUOP0;

  Control_Unit control (
    .opcode(opcode),
    .RegDst(RegDst),
    .ALUsrc(ALUsrc),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUOP1(ALUOP1),
    .ALUOP0(ALUOP0)
  );

  initial begin
    opcode = 6'd0; #10;
    opcode = 6'd35; #10;
    opcode = 6'd43; #10;
    opcode = 6'd4; #10;
    opcode = 6'd15; #10;
    $stop;
  end

endmodule
