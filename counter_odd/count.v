module counter_odd(clk,rst,cnt_o);
    input     wire   clk;
    input     wire   rst;

    output    reg[7:0]  cnt_o;


  always@(posedge clk or posedge rst)begin
     if (rst)begin
      cnt_o <= 8'h1;
     end
    else begin
      cnt_o <= cnt_o + 8'h2;
    end

    

  end   
endmodule