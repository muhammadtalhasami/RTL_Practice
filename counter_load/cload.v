module counter_load(clk,rst,load,load_h,count);
    input     wire          clk;
    input     wire          rst;
    input     wire          load;
    input     wire[3:0]     load_h;

    output    reg[3:0]     count;

    reg[3:0] load_ff;
    reg[3:0] count_ff;
    reg[3:0] nxt_count;


    always@(posedge clk or posedge rst)begin
        if (rst)begin
            load_ff <= 4'b0000;
        end
        else if (load)begin
        load_ff <= load_h;
        end
    end

    always @(posedge clk or posedge rst)begin
        if (rst)begin
        count_ff <= 4'b0000;
        end
        else begin
        count_ff <= nxt_count;
        end

    nxt_count <= load ? load_h :(count_ff == 4'b1111) ? load_ff :count_ff + 4'b0001;
    count<= count_ff;
    end



endmodule