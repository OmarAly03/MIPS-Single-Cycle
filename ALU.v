module ALU (operand1, operand2, operation, result, zeroFlag);
  input [31:0] operand1;
  input [31:0] operand2;
  input [3:0] operation;
  output reg [31:0] result;
  output wire zeroFlag;
  
  assign zeroFlag = (result == 0);
  
  always @(*)
    begin
      case(operation)
          4'b0000: result <= operand1 & operand2;
          4'b0001: result <= operand1 | operand2;
          4'b0010: result <= operand1 + operand2;
          4'b0110: result <= operand1 - operand2;
          4'b0111: result <= (operand1 < operand2) ? 32'd1 : 32'd0;
          4'b1100: result <= ~(operand1 | operand2);
      endcase
    end
endmodule