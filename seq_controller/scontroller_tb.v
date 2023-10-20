`timescale 1ns/1ps
module scontroller_tb();

    reg [2:0]opcode_tb;
    reg zero_tb;
    reg clk_tb;
    reg rst_tb;

    wire mem_rd_tb;
    wire load_ir_tb;
    wire halt_tb;
    wire inc_pc_tb;
    wire load_ac_tb;
    wire load_pc_tb;
    wire mem_wr_tb;

    initial begin
        zero_tb=0;
        opcode_tb=3'b000;
        clk_tb=0;
        rst_tb=0;

        #10;
        zero_tb=0;
        opcode_tb=3'b001;
        rst_tb=1;
        $display(" mem= %d" ,mem_rd_tb ,"load= %d" ,load_ir_tb, "halt= %d" ,halt_tb,"inc_pc_tb= %d" ,inc_pc_tb,"load_ac_tb= %d" ,load_ac_tb,"load_pc_tb= %d" ,load_pc_tb,"mem_wr_tb= %d" ,mem_wr_tb);

        #10;
        zero_tb=0;
        opcode_tb=3'b010;
        rst_tb=1;
        $display(" mem= %d" ,mem_rd_tb ,"load= %d" ,load_ir_tb, "halt= %d" ,halt_tb,"inc_pc_tb= %d" ,inc_pc_tb,"load_ac_tb= %d" ,load_ac_tb,"load_pc_tb= %d" ,load_pc_tb,"mem_wr_tb= %d" ,mem_wr_tb);


        #10;
        zero_tb=0;
        opcode_tb=3'b011;
        rst_tb=1;
        $display(" mem= %d" ,mem_rd_tb ,"load= %d" ,load_ir_tb, "halt= %d" ,halt_tb,"inc_pc_tb= %d" ,inc_pc_tb,"load_ac_tb= %d" ,load_ac_tb,"load_pc_tb= %d" ,load_pc_tb,"mem_wr_tb= %d" ,mem_wr_tb);


        #10;
        zero_tb=0;
        opcode_tb=3'b100;
        rst_tb=1;
        $display(" mem= %d" ,mem_rd_tb ,"load= %d" ,load_ir_tb, "halt= %d" ,halt_tb,"inc_pc_tb= %d" ,inc_pc_tb,"load_ac_tb= %d" ,load_ac_tb,"load_pc_tb= %d" ,load_pc_tb,"mem_wr_tb= %d" ,mem_wr_tb);


        #10;
        zero_tb=0;
        opcode_tb=3'b101;
        rst_tb=1;
        $display(" mem= %d" ,mem_rd_tb ,"load= %d" ,load_ir_tb, "halt= %d" ,halt_tb,"inc_pc_tb= %d" ,inc_pc_tb,"load_ac_tb= %d" ,load_ac_tb,"load_pc_tb= %d" ,load_pc_tb,"mem_wr_tb= %d" ,mem_wr_tb);


        #10;
        zero_tb=0;
        opcode_tb=3'b110;
        rst_tb=1;
        $display(" mem= %d" ,mem_rd_tb ,"load= %d" ,load_ir_tb, "halt= %d" ,halt_tb,"inc_pc_tb= %d" ,inc_pc_tb,"load_ac_tb= %d" ,load_ac_tb,"load_pc_tb= %d" ,load_pc_tb,"mem_wr_tb= %d" ,mem_wr_tb);


        #10;
        zero_tb=0;
        opcode_tb=3'b111;
        rst_tb=1;
        $display(" mem= %d" ,mem_rd_tb ,"load= %d" ,load_ir_tb, "halt= %d" ,halt_tb,"inc_pc_tb= %d" ,inc_pc_tb,"load_ac_tb= %d" ,load_ac_tb,"load_pc_tb= %d" ,load_pc_tb,"mem_wr_tb= %d" ,mem_wr_tb);


        #10;
    end

    always begin
        #5;
        clk_tb = ~clk_tb;
    end

    scontroller u_scontroller0(
        .opcode(opcode_tb),
        .zero(zero_tb),
        .clk(clk_tb),
        .rst(rst_tb),
        .mem_rd(mem_rd_tb),
        .load_ir(load_ir_tb),
        .halt(halt_tb),
        .inc_pc(inc_pc_tb),
        .load_ac(load_ac_tb),
        .load_pc(load_pc_tb),
        .mem_wr(mem_wr_tb)
    );

    initial begin
        $dumpfile("scontroller.vcd");
        $dumpvars(0,scontroller_tb);
    end
endmodule