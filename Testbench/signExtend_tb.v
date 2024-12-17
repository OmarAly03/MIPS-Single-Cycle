`include "signExtend.v"

module signExtend_tb;
  reg [15:0] immediate;
  wire [31:0] extendedImmediate;
  
  signExtend se (immediate, extendedImmediate);
  
  initial
    begin
      immediate = 16'hFFFF; #10;
      immediate = 16'h0FFF; #10;
    end
endmodule