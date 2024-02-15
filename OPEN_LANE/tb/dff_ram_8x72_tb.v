`timescale 1ns/1ns
module tb_dff_ram_8x72;

    reg clk;
    reg wr_n;
    reg [2:0] address;
    reg [71:0] wdata;
    wire [71:0] rdata;

    // Instantiate the module under test
    dff_ram_8x72 dut (
        .clk(clk),
        .wr_n(wr_n),
        .address(address),
        .wdata(wdata),
        .rdata(rdata)
    );

    // Test stimuli
    initial begin
        clk = 0;
        wr_n = 0;
        
        // Write data to specific addresses
        #10;
        address = 0;
        wr_n = 0;
        // Initialize data
        wdata = 72'd1;

        #10;
        address = 1;
        wr_n = 0;
        wdata = 72'd2;

        #10;
        address = 2;
        wr_n = 0;
        // Initialize data
        wdata = 72'd3;

        #10;
        address = 3;
        wr_n = 0;
        wdata = 72'd4;

        #10;
        address = 4;
        wr_n = 0;
        // Initialize data
        wdata = 72'd5;

        #10;
        address = 5;
        wr_n = 0;
        wdata = 72'd6;

        #10;
        address = 6;
        wr_n = 0;
        // Initialize data
        wdata = 72'd7;

        #10;
        address = 7;
        wr_n = 0;
        wdata = 72'd8;

        // Read data from written addresses
        #10;
        address = 0;
        wr_n = 1;

        #10; 
        address = 1;
        wr_n = 1;

        #10;
        address = 2;
        wr_n = 1;

        #10; 
        address = 3;
        wr_n = 1;

        #10;
        address = 4;
        wr_n = 1;

        #10; 
        address = 5;
        wr_n = 1;

        #10;
        address = 6;
        wr_n = 1;

        #10; 
        address = 7;
        wr_n = 1;
        #20;

        $finish;
    end

    initial begin
       $dumpfile("temp/dff8.vcd");
       $dumpvars(0,tb_dff_ram_8x72);
    end

    always #5 clk = ~clk;

endmodule