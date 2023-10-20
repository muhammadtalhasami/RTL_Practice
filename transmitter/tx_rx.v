`include "tx.v"
`include "rx.v"
module top(
    input wire tx,
    input wire busy,
    input wire rst,
    input wire clk
);
 
    wire valid_o;
    wire valid_i;
    wire ready_o;
    wire [3:0]data_i;
    wire [3:0]data_o;
    wire [3:0]d;
  
    tx u_tx0 (
        .tx(tx),
        .clk(clk),
        .rst(rst),
        .ready_i(ready_i),
        .data_o(data_o),
        .d(d),
        .valid_o(valid_o)
    );

   
    rx u_rx0(
        .busy(busy),
        .valid_i(valid_o),
        .data_i(d),
        .clk(clk),
        .ready_o(ready_i)
    );

endmodule
