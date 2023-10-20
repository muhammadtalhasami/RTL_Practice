module counter(rst,clk,out);

    //inputs clock and reset

    input wire rst;
    input wire clk;

    //output reg for store the value for next count

    output reg[3:0] out;

    always @(posedge clk)
    begin
        if (rst)
        begin
            out <= 4'b0000;
        end
        else
        begin
            out <= out + 1'b1;
        end
    end
endmodule