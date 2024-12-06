`include "../Modules/ALU.v"

module ALU_tb;
  reg [31:0] operand1;
  reg [31:0] operand2;
  reg [3:0] operation;
  wire [31:0] result;
  wire zeroFlag;
  
  ALU alu(.operand1(operand1), .operand2(operand2), .operation(operation), .result(result), .zeroFlag(zeroFlag));
  
  initial
    begin
      operand1 = 32'd5;
      operand2 = 32'd6;
      operation = 4'b0010;
      #10;
      
      operand1 = 32'd15;
      operand2 = 32'd15;
      operation = 4'b0110;
      #10;
      
      operand1 = 32'hAAAAAAAA;
      operand2 = 32'h55555555;
      operation = 4'b0001;
      #10;
      
      operand1 = 32'd15;
      operand2 = 32'd15;
      operation = 4'b0000;
      #10;
            
      operand1 = 32'hAAAAAAAA;
      operand2 = 32'h55555555;
      operation = 4'b1100;
      #10;
      
      operand1 = 32'd15;
      operand2 = 32'd16;
      operation = 4'b0111;
      #10;
      
      $stop;
    end
endmodule