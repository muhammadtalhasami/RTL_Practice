module dffp_tb();
    reg clk_tb;
    reg reset_tb;
    reg d_tb;

    wire q_tb;
    wire q_syncrst_tb;
    wire q_asyncrst_tb;

    dffp u_dffp0(
        .clk(clk_tb),
        .reset(reset_tb),
        .d(d_tb),
        .q(q_tb),
        .q_asyncrst(q_asyncrst_tb),
        .q_syncrst(q_syncrst)
        );

    initial begin
        clk_tb = 0;
        #7.5;
        reset_tb = 0;
        d_tb = 0;
        #5;

        reset_tb = 1;
        d_tb = 1;
        #5;

        reset_tb = 0;
        d_tb = 1;
        #10;
    $finish;
    end
    initial begin
       $dumpfile("dffp.vcd");
       $dumpvars(0,dffp_tb);

    end

    always begin
        #5 clk_tb= ~clk_tb;
    end



endmodule