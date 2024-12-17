module mux #(parameter size = 32)(first, second, EN, out);
  input [size-1:0] first, second;
  input EN;
  output reg [size-1:0] out;
  
  always @(*)
    begin
      out = EN ? second : first;
    end
endmodule
