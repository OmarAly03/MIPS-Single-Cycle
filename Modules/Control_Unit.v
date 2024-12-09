module Control_Unit (opcode, RegDst, ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOP1, ALUOP0);
  input [5:0] opcode;
  output reg RegDst, ALUsrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOP1, ALUOP0;

  always @(*) begin
    RegDst = 0;
    ALUsrc = 0;
    MemtoReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    ALUOP1 = 0;
    ALUOP0 = 0;

    case (opcode)
      6'd0: begin // r
        RegDst = 1;
        ALUsrc = 0;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOP1 = 1;
        ALUOP0 = 0;
      end

      6'd35: begin // lw 
        RegDst = 0;
        ALUsrc = 1;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        ALUOP1 = 0;
        ALUOP0 = 0;
      end

      6'd43: begin // sw 
        RegDst = 1'bx; 
        ALUsrc = 1;
        MemtoReg = 1'bx; 
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        ALUOP1 = 0;
        ALUOP0 = 0;
      end

      6'd4: begin // beq 
        RegDst = 1'bx; 
        ALUsrc = 0;
        MemtoReg = 1'bx;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        ALUOP1 = 0;
        ALUOP0 = 1;
      end

      default: begin

      end
    endcase
  end
endmodule
