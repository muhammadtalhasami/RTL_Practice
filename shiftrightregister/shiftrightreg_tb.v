`timescale 1ns/1ps
module shiftrightreg_tb();
    reg clk_tb;
    reg rst_tb;
    reg a_tb;

    wire [3:0]out_tb;

    shiftrightreg u_shiftrightreg0
    (
        .clk(clk_tb),
        .rst(rst_tb),
        .a(a_tb),
        .out(out_tb)
    );

    initial begin
        rst_tb = 0;
        clk_tb = 0;
        #5
        rst_tb = 1;
        #5;

        rst_tb = 0;
        a_tb = 1'b1;
        #5;

        a_tb = 1'b1;
        #5;

        a_tb = 1'b0;
        #5;

        a_tb = 1'b0;
    end

    initial begin
       $dumpfile("shiftrightreg.vcd");
       $dumpvars(0,shiftrightreg_tb);
    end

     always begin
        #5 clk_tb= ~clk_tb;
    end
endmodule