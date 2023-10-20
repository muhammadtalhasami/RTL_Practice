`timescale 1ns/1ps

module mem_tb();

    reg clk;
    reg [7:0] addr;
    reg wr;
    reg c_en;
    reg [31:0] wr_data;
    reg [31:0] bit_mask;
    
    wire [31:0] rd_data;

    initial begin
    
        clk=1;
        c_en=1;
        wr = 1;
        addr = 198;
        #10;

        wr_data = 32'b00000000000000000000000000000111;
        bit_mask =32'b00000000000000000000000000000011;
 

        #10;
        wr=0;
        c_en=0;
        addr=198;
        #10;

        wr=1;
        c_en=1;
        addr=198;
        wr_data = 32'b00000000000000000000000000001111;
        bit_mask =32'b0000000000000000000000000000101;
        #10;

        wr=0;
        addr=198;

        #10;
        $display("The value of data is %d", rd_data);

        $finish;
    end

    initial begin
        $dumpfile("mem.vcd");
        $dumpvars(0, mem_tb);
    end

 always begin
        #5 clk= ~clk;
    end
    mem u_mem (
        .c_en(c_en),
        .clk(clk),
        .addr(addr),
        .bit_mask(bit_mask),
        .wr(wr),
        .wr_data(wr_data),
        .rd_data(rd_data)
    );

endmodule