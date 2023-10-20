module binary_gray(binary,gray);
    localparam  width= 4;

    input     wire[width-1:0] binary;
    output    wire[width-1:0] gray;

  assign gray[width-1] = binary[width-1];

  genvar  i;

  for (i=width-2; i>=0; i=i-1)
    assign gray[i] = binary[i+1] ^ binary[i];

endmodule