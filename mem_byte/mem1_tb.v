`timescale 1ns / 1ps

module bytemasking_tb ();

  reg clk;
  reg [7:0] addr;
  reg wr;
  reg c_en;
  reg [31:0] wr_data;
  reg [3:0] w_mask;

  wire [31:0] rd_data;

  initial begin

    clk  = 1;
    c_en = 1;
    wr   = 1;
    addr = 255;
    #10;
    wr_data = 32'b00000000000000000000000000000111;
    w_mask = 4'b0000;
  

    #10;
    wr   = 0;
    c_en = 0;
    addr = 255;
    #20;

    wr = 1;
    c_en = 1;
    addr = 255;
    wr_data = 32'b00000000000000000000000000000101;
    w_mask= 4'b0001;
    #10;

    wr   = 0;
    addr = 255;

    #10;
    $display("The value of data is %d", rd_data);

    $finish;
  end

  initial begin
    $dumpfile("bytemasking.vcd");
    $dumpvars(0, bytemasking_tb);
  end

  always begin
    #5 clk = ~clk;
  end
  bytemasking u_bytemasking (
      .c_en(c_en),
      .clk(clk),
      .addr(addr),
      .w_mask(w_mask),
      .wr(wr),
      .wr_data(wr_data),
      .rd_data(rd_data)
  );

endmodule