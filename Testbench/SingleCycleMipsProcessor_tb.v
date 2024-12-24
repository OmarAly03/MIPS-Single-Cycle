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
        // memory[0] = 32'h8C0A0020; // lw $t2, 32($zero)
        // memory[1] = 32'hAD310004; // sw $s1, 4($t1)
        // memory[2] = 32'h02328020; // add $s0, $s1, $s2
        // memory[3] = 32'h016D4022; // sub $t0, $t3, $t5
        
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
