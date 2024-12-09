module dataMemory 
    #(parameter addressWidth = 10, parameter dataWidth = 32)
    (
        input clk,
        input WE,                               
        input [dataWidth-1:0] WD,              
        input [addressWidth-1:0] Address,       
        output reg [dataWidth-1:0] RD           
    );

    reg [dataWidth-1:0] dataMemory [(2**(addressWidth-2))-1:0];

    always @(*) begin
        RD = dataMemory[Address[addressWidth - 1:2]];
    end

    always @(posedge clk) begin
        if (WE) begin
            dataMemory[Address[addressWidth - 1:2]] <= WD;
        end
    end
endmodule