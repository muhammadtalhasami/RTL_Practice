module shiftrightreg (clk,rst,a,out);
    input wire clk;
    input wire rst;
    input wire a;
    
    output reg [3:0] out;

    always@(posedge clk)begin
        if(rst)begin
        out <= 4'b0000;
        end
        else begin
            out = {a,out[3:1]};
        end
    end
endmodule