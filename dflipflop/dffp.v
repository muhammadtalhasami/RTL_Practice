module dffp(clk,reset,d,q,q_syncrst,q_asyncrst);
  
  input   wire     clk;
  input   wire     reset;
  input   wire     d;

  output    reg     q;
  output    reg     q_syncrst;
  output    reg     q_asyncrst;

  // No reset
  always@(posedge clk)
    q <= d;

  // Sync reset
  always@(posedge clk)
    if (reset)
      q_syncrst<= 1'b0;
    else
      q_syncrst <= d;

  // Async reset
  always@(posedge clk or posedge reset)
    if (reset)
      q_asyncrst<= 1'b0;
    else
      q_asyncrst <= d;

endmodule