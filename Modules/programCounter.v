module programCounter(PCNext, clk, reset, PC);
  input [31:0] PCNext;
  input clk, reset;
  output reg [31:0] PC;
  
  always @(posedge clk or negedge reset)
    begin 
      if(!reset)
        PC <= 32'd0;
      else
        PC <= PCNext;
    end
endmodule
