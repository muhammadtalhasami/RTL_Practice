`timescale 1ns/1ps
module dff_ram_8x72_tb ();
    reg clk;
    reg [1:0]add;
    reg en_n;
    reg wr_n;
    reg [71:0]wdata;

    wire [71:0]rdata2;

    dff_ram_8x72  u_dff_ram_8x72_tb0
    (
       .clk(clk),
       .add(add),
       .en_n(en_n),
       .wr_n(wr_n),
       .wdata(wdata),
       .rdata2(rdata2)
    );

    initial begin
        clk=0;
        en_n=1;
        wr_n=1;
        add=2'b00;
        #10;

        add = 2'b00;
        en_n=0;
        wr_n=0;
        wdata=72'b1;
        #10;

        add = 2'b00;
        en_n=0;
        wr_n=1;
        #10;

        add = 2'b11;
        en_n=0;
        wr_n=0;
        wdata=72'd2;
        #10;

        add = 2'b11;
        en_n=0;
        wr_n=1;
        #10;


        #10;
        #10;

        $finish;

    end
    initial begin
       $dumpfile("temp/dff8.vcd");
       $dumpvars(0,dff_ram_8x72_tb);
    end

    always begin
        #5 clk= ~clk;
    end



endmodule