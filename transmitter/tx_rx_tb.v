`timescale 1ns/1ps
module tx_rx_tb();
    reg tx;
    reg busy;
    reg rst;
    reg clk;

    top u_top0(
        .tx(tx),
        .busy(busy),
        .clk(clk),
        .rst(rst)
    );
    
    initial begin
        #10;
        clk = 0;
        rst = 0;
        busy = 1;
        tx = 0;

        #10;

        rst = 1;
        busy = 1;
        tx = 0;

        #10;

        rst =0;
        busy = 1;
        tx=0;
        #10;
        busy=1;
        tx=1;
        #10;
 
        busy=1;
        tx=0;
        #10;
        busy=0;
        tx=0;
        #10;
        busy=1;
        tx=0;
        #10;        
        $finish;
       
    end

    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("tx_rx.vcd");
        $dumpvars(0,tx_rx_tb);
    end

endmodule