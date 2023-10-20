`timescale 1ns/1ps
module counter_load_tb();
    reg clk;
    reg rst;
    reg load;
    reg [3:0]load_h;

    wire [3:0]count;

    counter_load u_counter_load(
        .clk(clk),
        .rst(rst),
        .load(load),
        .load_h(load_h),
        .count(count)
    );

    initial begin
        clk=0;
        rst=1;
        load=0;
        load_h=4'b0000;
        #10;

        rst=0;
        load=1;
        load_h=4'b0001;
        #10;

        #130;
        $finish;
    end

    initial begin
        $dumpfile("cload.vcd");
        $dumpvars(0,counter_load_tb);
    end

    always begin
            #5 clk= ~clk;
    end


endmodule