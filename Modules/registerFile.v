module registerFile(readRegister1, readRegister2, writeRegister, writeData, WE, readData1, readData2, clk);
  input [4:0] readRegister1, readRegister2, writeRegister;
  input [31:0] writeData;
  input WE, clk;
  output reg [31:0] readData1, readData2;

  reg [31:0] RegisterFile [31:0];
  integer i;

  initial begin
    for (i = 0; i < 32; i = i + 1) begin
      RegisterFile[i] = 32'b0;
    end
  end

  always @(*) begin
    readData1 = (readRegister1 == 5'd0) ? 32'd0 : RegisterFile[readRegister1];
    readData2 = (readRegister2 == 5'd0) ? 32'd0 : RegisterFile[readRegister2];
  end

  always @(posedge clk) begin
    if (WE && (writeRegister != 5'd0)) begin
      RegisterFile[writeRegister] <= writeData;
    end
  end
endmodule