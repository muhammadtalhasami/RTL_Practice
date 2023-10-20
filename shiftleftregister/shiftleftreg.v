module shiftleftreg (clk,rst,a,out);
    input wire clk;
    input wire rst;
    input wire a;
    
    output reg [3:0] out;

    always@(posedge clk)begin
        if(rst)begin
        out <= 4'b0000;
        end
        else begin
            out = {out[2:0],a};
        end
    end
endmodule
