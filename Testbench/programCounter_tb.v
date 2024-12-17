`include "programCounter.v"

module programCounter_tb;
  reg [31:0] PCNext;
  reg clk, reset;
  wire [31:0] PC;
  
  programCounter pc (PCNext, clk, reset, PC);
  
  always #5 clk = ~clk;
  
  initial 
    begin

      clk = 0;       
      reset = 1;     
      PCNext = 32'd0; 

      #10 reset = 0;  
      #10 reset = 1;  
      #10;
      
      PCNext = 32'h12345678;
      #10;
      
      PCNext = 32'h56781234; 
      #10;
      
      $stop; 
    end
endmodule
