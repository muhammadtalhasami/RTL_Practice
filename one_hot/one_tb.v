`timescale 1ns/1ps
module one_hot_tb();
    reg [3:0]in;
    wire [15:0]out;

    one_hot u_one_hot0(
        .in(in),
        .out(out)
    );

    initial begin
        #10;
        in = 4'b0111;

        #10;
        in = 4'b0010;

        #10;
        in = 4'b0011;
        #10;

        $finish;
        end
    initial begin
       $dumpfile("one.vcd");
       $dumpvars(0,one_hot_tb);
    end
endmodule