module rx (
    input wire busy,
    input wire valid_i,
    input wire [3:0] data_i,
    input wire clk,
    output reg ready_o
);
reg [3:0] rx;
    always @ (posedge clk) begin
        if(busy)begin
            ready_o <= 1'b0;
        end
        else begin
            ready_o <= 1'b1;
        end
    end
    always @ (posedge clk) begin
        if(ready_o)begin
        rx=data_i;
        end
    end
endmodule
