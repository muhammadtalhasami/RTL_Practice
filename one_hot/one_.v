
module one_hot(in,out);
  

    localparam  binary_width = 4;
    localparam one_hot_width = 16;
    input   wire[binary_width-1:0] in;
    output  reg[one_hot_width-1:0] out;

    always@(*)begin
        out = 1'b1<<in;
    end
    


endmodule