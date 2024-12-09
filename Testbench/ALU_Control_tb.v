module ALU_Control_tb;
  reg [1:0] alu_input;
  reg [5:0] funct;
  wire [3:0] alu_output;

  ALU_Control alu_control (
    .alu_input(alu_input),
    .funct(funct),
    .alu_output(alu_output)
  );

  initial begin
    alu_input = 2'b00; funct = 6'bxxxxxx; #10;
    alu_input = 2'b01; funct = 6'bxxxxxx; #10;
    alu_input = 2'b10; funct = 6'b100000; #10;
    alu_input = 2'b10; funct = 6'b100010; #10;
    alu_input = 2'b10; funct = 6'b100100; #10;
    alu_input = 2'b10; funct = 6'b100101; #10;
    alu_input = 2'b10; funct = 6'b101010; #10;
    alu_input = 2'b10; funct = 6'b111111; #10;
    alu_input = 2'b11; funct = 6'bxxxxxx; #10;
    $stop;
  end

endmodule