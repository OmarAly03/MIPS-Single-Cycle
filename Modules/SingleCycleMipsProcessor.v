module SingleCycleMipsProcessor(
    input wire clk,
    input wire reset
);

    wire [31:0] PC_current, PC_next, PC_plus4;
    wire [31:0] instruction;
    wire [31:0] readData1, readData2, writeData;
    wire [31:0] signExtendedImm;
    wire [31:0] shiftedSignExtendedImm;
    wire [31:0] ALUResult;
    wire [31:0] readDataFromMem;
    wire [31:0] ALUOperand2;
    wire [4:0] writeRegister;
    wire [3:0] ALUControl;
    wire [1:0] ALUOp;
    wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    wire zeroFlag;
    wire [31:0] branchTarget;
    wire PCBranchSelect;

    // PC Logic
    assign PCBranchSelect = Branch & zeroFlag;
    assign PC_plus4 = PC_current + 32'd4;
    
    // Module instantiations
    programCounter pc(
        .PCNext(PCBranchSelect ? branchTarget : PC_plus4),
        .clk(clk),
        .reset(reset),
        .PC(PC_current)
    );

    instructionMemory imem(
        .address(PC_current),
        .instruction(instruction)
    );

    Control_Unit mainControl(
      .OpCode(instruction[31:26]), // Changed "opcode" to "OpCode" to match the module definition
      .RegDst(RegDst),
      .ALUSrc(ALUSrc),             // Corrected "ALUsrc" to "ALUSrc" to align with the module naming
      .MemtoReg(MemtoReg),
      .RegWrite(RegWrite),
      .MemRead(MemRead),
      .MemWrite(MemWrite),
      .Branch(Branch),
      .ALUOp(ALUOp)                // Combined ALUOP1 and ALUOP0 into a single 2-bit signal "ALUOp"
    );


    mux #(5) regDstMux(
        .first(instruction[20:16]),
        .second(instruction[15:11]),
        .EN(RegDst),
        .out(writeRegister)
    );

    registerFile regFile(
        .readRegister1(instruction[25:21]),
        .readRegister2(instruction[20:16]),
        .writeRegister(writeRegister),
        .writeData(writeData),
        .WE(RegWrite),
        .readData1(readData1),
        .readData2(readData2),
        .clk(clk)
    );

    signExtend signExt(
        .immediate(instruction[15:0]),
        .extendedImmediate(signExtendedImm)
    );

    shiftLeftBy2 branchShift(
        .immediate(signExtendedImm),
        .shiftedImmediate(shiftedSignExtendedImm)
    );

    adder branchAdder(
        .op1(PC_plus4),
        .op2(shiftedSignExtendedImm),
        .result(branchTarget)
    );

    mux #(32) aluSrcMux(
        .first(readData2),
        .second(signExtendedImm),
        .EN(ALUSrc),
        .out(ALUOperand2)
    );

    ALU_Control aluCtrl(
        .alu_input(ALUOp),
        .funct(instruction[5:0]),
        .alu_output(ALUControl)
    );

    ALU alu(
        .operand1(readData1),
        .operand2(ALUOperand2),
        .operation(ALUControl),
        .result(ALUResult),
        .zeroFlag(zeroFlag)
    );

    dataMemory #(10,32) dmem(
        .clk(clk),
        .WE(MemWrite),
        .WD(readData2),
        .Address(ALUResult[9:0]),
        .RD(readDataFromMem)
    );

    mux #(32) memToRegMux(
        .first(ALUResult),
        .second(readDataFromMem),
        .EN(MemtoReg),
        .out(writeData)
    );

endmodule