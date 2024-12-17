`include "shiftLeftBy2.v"

module shiftLeftBy2_tb;
  reg [31:0] immediate;
  wire [31:0] shiftedImmediate;
  
  shiftLeftBy2 slb2 (immediate, shiftedImmediate);
  
  initial 
    begin
      immediate = 32'd1; #10;
      immediate = 32'd2; #10;
      immediate = 32'd4; #10;
      $stop;
    end
endmodule      
