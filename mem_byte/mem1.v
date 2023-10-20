module bytemasking (addr,wr,clk,w_mask,c_en,wr_data,rd_data);

    input wire [7:0] addr;
    input wire clk;
    input wire wr;
    input wire c_en;
    input wire [3:0] w_mask;
    input wire [31:0] wr_data;
    output reg [31:0] rd_data;


    reg [31:0] mem_array[255:0];

    always @(posedge clk) begin
      if(wr)begin
      if(w_mask[0])begin
        mem_array[addr][7:0]<=wr_data[7:0];
      end
        if(w_mask[1])begin
        mem_array[addr][15:8]<=wr_data[15:8];
      end
        if(w_mask[2])begin
        mem_array[addr][23:16]<=wr_data[23:16];
      end
        if(w_mask[3])begin
        mem_array[addr][31:24]<=wr_data[31:24];
      end
       else begin
     rd_data <= mem_array[addr][31:0];
      end
      end
      
      else begin
     rd_data <= mem_array[addr][31:0];
      end
    end

  endmodule