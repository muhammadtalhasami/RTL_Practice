`timescale 1ns/1ps
module lfsr_tb();

    reg clk;
    reg rst;

    wire [3:0]out;

    lfsr u_lfsr0(
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    initial begin
        clk = 0 ;
        rst = 1 ;
        #10;

        rst = 0 ;
        #10;

        #200;

        $finish;
    end

    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("lfsr.vcd");
        $dumpvars(0,lfsr_tb);
    end
endmodule