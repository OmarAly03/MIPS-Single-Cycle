`include "../Modules/dataMemory.v"

module dataMemory_tb;
    reg clk;
    reg WE;
    reg [31:0] WD;
    reg [9:0] Address;
    wire [31:0] RD;

    // Instantiate the dataMemory module
    dataMemory memory (
        .clk(clk),
        .WE(WE),
        .WD(WD),
        .Address(Address),
        .RD(RD)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period

    // Test sequence
    initial begin
        // Initialize
        WE = 0; 
        WD = 32'h00000000; 
        Address = 10'h000;
    	   #10
    	   
        // Write and read test
        WE = 1; 
        WD = 32'hDEADBEEF; 
        Address = 10'h000;  // Write to address 0
        #10 
        
        WE = 0; 
        Address = 10'h000;  // Read from address 0
        #10 
        
        WE = 1; 
        WD = 32'hCAFEBABE; 
        Address = 10'h004;  // Write to address 1
        #10 
        
        WE = 0; 
        Address = 10'h004;  // Read from address 1
        #10

        // Observe output
        $display("Memory[0] = %h", memory.dataMemory[0]);
        $display("Memory[1] = %h", memory.dataMemory[1]);
       	#10
       	
        // Finish simulation
        $stop;
    end
endmodule

