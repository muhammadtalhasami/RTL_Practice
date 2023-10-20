module mem (addr,wr,clk,bit_mask,c_en,wr_data,rd_data);
   
    input wire [7:0] addr;
    input wire clk;
    input wire wr;
    input wire c_en;
    input wire [31:0] bit_mask;
    input wire [31:0] wr_data;
    output reg [31:0] rd_data;


    reg [31:0] mem_array [255:0];

    always @(posedge clk) begin
      
    if (c_en) begin
        
        if (wr) begin
           mem_array[addr][31:0] <= wr_data & bit_mask;
          end
        
         if(!wr) begin
         rd_data <= mem_array[addr][31:0];
        end
     
     
      end

      else begin
     rd_data <= mem_array[addr][31:0];
      end

    end

endmodule