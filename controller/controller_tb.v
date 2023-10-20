`timescale 1ns/1ps
module controller_tb();

    reg zero_tb;
    reg [2:0]phase_tb;
    reg [2:0]opcode_tb;

    wire sel_tb;
    wire rd_tb;
    wire ld_ir_tb;
    wire inc_pc_tb;
    wire halt_tb;
    wire ld_pc_tb;
    wire data_c_tb;
    wire ld_ac_tb;
    wire wr_tb;
    

    initial begin
        zero_tb = 0;
        phase_tb = 3'b000;
        opcode_tb = 3'b000;
        #5;
        phase_tb = 3'b001;

        #5;
        zero_tb = 0;
        opcode_tb = 3'b011;
        #5;
        phase_tb = 3'b000;

        #5;
        zero_tb = 1;
        opcode_tb = 3'b001;
        #5;
        phase_tb = 3'b110;

        #5;
        zero_tb = 0;
        opcode_tb = 3'b101;
        #5;
        phase_tb = 3'b111;

        #2;
    end

    controller u_controller0
    (
        .zero(zero_tb),
        .phase(phase_tb),
        .opcode(opcode_tb),
        .sel(sel_tb),
        .rd(rd_tb),
        .ld_ir(ld_ir_tb),
        .inc_pc(inc_pc_tb),
        .halt(halt_tb),
        .ld_pc(ld_pc_tb),
        .data_c(data_c_tb),
        .ld_ac(ld_ac_tb),
        .wr(wr_tb)
    );

    initial begin
        $dumpfile("controller.vcd");
        $dumpvars(0,controller_tb);
    end
endmodule