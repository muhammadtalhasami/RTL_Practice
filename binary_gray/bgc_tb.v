`timescale 1ns/1ps
module binary_gray_tb();
    reg [3:0]binary;
    wire [3:0]gray;

    binary_gray u_binary_gray0(
        .binary(binary),
        .gray(gray)
    );

    initial begin
        binary = 4'b1001;
        #10;

        binary = 4'b1101;
        #10;

        $finish;
    end

    initial begin
       $dumpfile("binarygray.vcd");
       $dumpvars(0,binary_gray_tb);
    end
endmodule