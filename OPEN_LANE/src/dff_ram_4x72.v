module dff_ram_4x72 (
    input wire clk,
    input wire [1:0]add,
    input wire en_n,
    input wire wr_n,
    input wire [71:0]wdata,

    output reg [71:0]rdata
);
    reg [71:0] mem [0:3];

    always @(posedge clk) begin
        if(!en_n & !wr_n)begin
                mem[add]<= wdata;
        end
        else if(wr_n) begin
            rdata<=mem[add];
        end
end



endmodule