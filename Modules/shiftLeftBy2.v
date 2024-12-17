module shiftLeftBy2(immediate, shiftedImmediate);
  input [31:0] immediate;
  output reg [31:0] shiftedImmediate;

  always @(*) 
    begin
      shiftedImmediate = immediate << 2;
    end
endmodule

