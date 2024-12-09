module registerFile_tb;
  reg [4:0] readRegister1, readRegister2, writeRegister;
  reg [31:0] writeData;
  reg WE, clk;
  wire [31:0] readData1, readData2;

  registerFile registerfile (
    .readRegister1(readRegister1),
    .readRegister2(readRegister2),
    .writeRegister(writeRegister),
    .writeData(writeData),
    .WE(WE),
    .readData1(readData1),
    .readData2(readData2),
    .clk(clk)
  );
  
  always #5 clk = ~clk;
    
  initial begin
    clk = 0;
    WE = 0;
    writeRegister = 5'd0;
    writeData = 32'd0;
    readRegister1 = 5'd0;
    readRegister2 = 5'd0; #10;

    WE = 1; writeRegister = 5'd1; writeData = 32'd123; #10;
    WE = 1; writeRegister = 5'd2; writeData = 32'd456; #10;
    WE = 0; readRegister1 = 5'd1; readRegister2 = 5'd2; #10;
    WE = 1; writeRegister = 5'd3; writeData = 32'd789; #10;
    WE = 0; readRegister1 = 5'd3; readRegister2 = 5'd1; #10;
    WE = 1; writeRegister = 5'd0; writeData = 32'd111; #10;
    WE = 0; readRegister1 = 5'd0; readRegister2 = 5'd3; #10;
    $stop;
  end

endmodule