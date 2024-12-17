`include "adder.v"

module adder_tb;
  reg [31:0] op1, op2;
  wire [31:0] result;
  
  adder adr (op1, op2, result);
  
  initial 
    begin 
      op1 = 32'd100;
      op2 = 32'd200;
      #10;
      
      op1 = 32'd300;
      op2 = 32'd400;
      #10;
      
      op1 = 32'd500;
      op2 = 32'd600;
      #10;
      $stop;
    end
endmodule
