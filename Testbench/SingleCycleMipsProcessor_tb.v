module SingleCycleMipsProcessor_tb;
    reg clk;
    reg reset;

    // Instantiate the processor
    SingleCycleMipsProcessor MIPS(
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Set up waveform dump for ModelSim
        $display("Starting MIPS Processor Testbench");
        
        // Initialize and reset
        reset = 0;
        #10;
        reset = 1;
        
        // Wait for instructions to execute
        // The pre-loaded instructions in instruction memory are:
        /*
        memory[0] = 32'h20020005; // addi $2, $0, 5 
        memory[1] = 32'h2003000c; // addi $3, $0, 12
        memory[2] = 32'h20670009; // addi $7, $3, 9
        memory[3] = 32'h00e22025; // or $4, $7, $2 
        memory[4] = 32'h00642824; // and $5, $3, $4
        memory[5] = 32'h00a42820; // add $5, $5, $4 
        memory[6] = 32'h10a70008; // beq $5, $7, 8 
        memory[7] = 32'h0064202a; // slt $4, $3, $4 
        memory[8] = 32'h10800001; // beq $4, $0, 1 
        memory[9] = 32'h20050000; // addi $5, $0, 0 
      //around:
        memory[10] = 32'h00e2202a; // slt $4, $7, $2 
        memory[11] = 32'h00853820; // add $7, $4, $5 
        memory[12] = 32'h00e23822; // sub $7, $7, $2 
        memory[13] = 32'hac670044; // sw $7, 68($3) 
        memory[14] = 32'h8c020050; // lw $2, 80($0) 
      //end:
        memory[15] = 32'hac020054; // sw $2, 84($0)
        */
        // Wait for 5 clock cycles for instructions to complete
        #170;
        
        // Add more test scenarios here
        // Call dump_registers from the registerFile module
        MIPS.regFile.dump_registers();
        MIPS.dmem.dump_memory();
        // End simulation
        //#10;
        $display("Testbench completed");
        //$stop;
    end
    /*
    // Monitor changes
    always @(posedge clk) begin
        $display("Time=%0t PC=%h Instruction=%h", $time, dut.PC_current, dut.instruction);
        if (dut.RegWrite)
            $display("Writing %h to register %d", dut.writeData, dut.writeRegister);
        if (dut.MemWrite)
            $display("Writing %h to memory address %h", dut.readData2, dut.ALUResult);
    end*/

endmodule

