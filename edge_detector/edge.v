
module edge_detect (clk,rst,a,rise,fall);
    input wire clk;
    input wire rst;
    input wire a;

    output reg rise;
    output reg fall;

    reg d;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            d <= 1'b0;
        end
        else begin
            d <= a;
        end
        if(a)begin
        // Rising edge when delayed signal is 0 but current is 1
    rise = ~d & a;
        end
    else begin
    // Falling edge when delayed signal is 1 but current is 0
    fall = d & ~a;
    end
    end

    
    
endmodule
