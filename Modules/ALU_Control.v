module ALU_Control (alu_input, funct, alu_output);
  input [1:0] alu_input;
  input [5:0] funct;
  output reg [3:0] alu_output;

always @(*) 
  begin
    case (alu_input)
        2'b00: alu_output <= 4'b0010;
        2'b01: alu_output <= 4'b0110; 
        2'b10: begin 
            case (funct)
                6'b100000: alu_output <= 4'b0010; 
                6'b100010: alu_output <= 4'b0110; 
                6'b100100: alu_output <= 4'b0000; 
                6'b100101: alu_output <= 4'b0001; 
                6'b101010: alu_output <= 4'b0111; 
                default: alu_output <= 4'bxxxx;
            endcase
        end
        default: alu_output <= 4'bxxxx; 
    endcase
  end
endmodule