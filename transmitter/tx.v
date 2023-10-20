module tx (
    input wire tx,
    input wire clk,
    input wire rst,
    input wire ready_i,
    output reg valid_o,
    output reg [3:0]d,
    output reg [3:0] data_o
);



localparam IDLE = 2'b00;
localparam TX = 2'b01;
localparam VALID = 2'b10;

reg [1:0] state;
reg [1:0] next_state;



// Sequential block
always @(posedge clk) begin
    if (rst) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

// Combinational block
always @(*) begin
    case (state)
        IDLE: begin
            next_state <= TX;
            valid_o <= 1'b0;
        end
        TX: begin
            next_state <= (tx) ? VALID : TX;
            valid_o <= 1'b0;
        end
        VALID: begin
            next_state <= (ready_i) ? TX : VALID;
            valid_o <= 1'b1;
            data_o<= 4'b0001;
            if(ready_i==1)begin
                d<=data_o;
            end
        end
        default: next_state <= IDLE;
    endcase
    
end



endmodule
