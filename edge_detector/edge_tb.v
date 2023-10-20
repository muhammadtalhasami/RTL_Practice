`timescale 1ns/1ps
module edge_detect_tb();

    reg clk;
    reg rst;
    reg a;

    wire rise;
    wire fall;

    
    edge_detect u_edge_detect0(
        .clk(clk),
        .rst(rst),
        .a(a),
        .rise(rise),
        .fall(fall)
    );

    // Clock generation
    always begin #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 1;
        a = 0;
        #10;
        #10; 
        
        rst = 0;
        a = 1;
        #10; 
        a = 0;
        #10; 
        a = 1;
        #10;
        $finish;

    end
    initial begin
       $dumpfile("edge_.vcd");
       $dumpvars(0,edge_detect_tb);
    end

endmodule
