module adder(op1, op2, result);
  input [31:0] op1, op2;
  output reg [31:0] result;
  
  always @(*)
    begin
      result = op1 + op2;
    end
endmodule
