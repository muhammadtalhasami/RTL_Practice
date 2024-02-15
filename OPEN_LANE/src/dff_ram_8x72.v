module dff_ram_8x72 (
    input wire clk,
    input wire [1:0] add,
    input wire en_n,
    input wire wr_n,
    input wire [71:0] wdata,

    output wire [71:0] rdata2
);

    wire [71:0] read0;
    wire [71:0] read1;
    
    dff_ram_4x72 u_dff_ram_4x72_inst0 (
        .clk(clk),
        .add(add),
        .en_n(en_n),
        .wr_n(wr_n),
        .wdata(wdata),
        .rdata(read0)
    );

    dff_ram_4x72 u_dff_ram_4x72_inst1 (
        .clk(clk),
        .add(add),
        .en_n(en_n),
        .wr_n(wr_n),
        .wdata(wdata),
        .rdata(read1)
    );

    assign rdata2 = read1;

endmodule
