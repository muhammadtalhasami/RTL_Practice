`timescale 1ns/1ps
module counter_odd_tb();
    reg clk_tb;
    reg rst_tb;

    wire [7:0]  cnt_o_tb;

    counter_odd u_counter_odd0(
        .clk(clk_tb),
        .rst(rst_tb),
        .cnt_o(cnt_o_tb)
    );

    initial begin
        clk_tb = 0;
        rst_tb = 0;
        #10;

        rst_tb = 1;
        #10;

        rst_tb = 0;
        #100;
       $finish;
    end

    initial begin
       $dumpfile("count.vcd");
       $dumpvars(0,counter_odd_tb);
    end

    always begin
        #5 clk_tb= ~clk_tb;
    end
endmodule