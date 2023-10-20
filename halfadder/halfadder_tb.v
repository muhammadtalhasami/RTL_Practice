`timescale 1ns/1ps
module halfadder_tb();

    reg a_tb;
    reg b_tb;

    wire sum_tb;
    wire cout_tb;

    halfadder u_halfadder0(
        .a(a_tb),
        .b(b_tb),
        .sum(sum_tb),
        .cout(cout_tb)
    );

    initial begin
        a_tb = 0;
        b_tb =1;
        #10;

        a_tb = 1;
        b_tb =1;
        #10;
    end

    initial begin
       $dumpfile("halfadder.vcd");
       $dumpvars(0,halfadder_tb);
    end

endmodule