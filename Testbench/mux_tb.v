`include "mux.v"

module mux_tb;
  reg [31:0] first, second;
  reg EN;
  wire [31:0] out;
  
  mux #(32) m (first, second, EN, out);
  
  initial
    begin 
      first = 32'd1;
      second = 32'd2;
      EN = 0;
      #10;
      
      first = 32'd10;
      second = 32'd20;
      EN = 1;
      #10;
    end
endmodule
      
  
  
