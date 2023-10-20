module lfsr (clk,rst,out);

    input wire clk;
    input wire rst;

    output wire[3:0] out;

    reg [3:0] l;
    wire [3:0] nxt_lfsr;

    always@(posedge clk or posedge rst)begin
        if (rst)begin
        l<= 4'b0010;
        end
        
        else begin
        l <= nxt_lfsr;
        end
    end
        assign nxt_lfsr = {l[2:0], l[1] ^ l[3]};

        assign out = l;

endmodule