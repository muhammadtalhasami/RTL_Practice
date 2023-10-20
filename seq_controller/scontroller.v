module scontroller(opcode,zero,clk,rst,mem_rd,load_ir,halt,inc_pc,load_ac,load_pc,mem_wr);

    input wire [2:0]opcode;
    input wire zero;
    input wire clk;
    input wire rst;

    output reg mem_rd;
    output reg load_ir;
    output reg halt;
    output reg inc_pc;
    output reg load_ac;
    output reg load_pc;
    output reg mem_wr;

    localparam INST_ADDER = 3'b000 ;
    localparam INST_FETCH = 3'b001 ;
    localparam INST_LOAD = 3'b010 ;
    localparam IDLE = 3'b011 ;
    localparam OP_ADDER = 3'b100 ;
    localparam OP_FETCH = 3'b101 ;
    localparam ALU_OP = 3'b110 ;
    localparam STORE = 3'b111 ;

    reg [2:0]state;
    reg [2:0]next_state;

//sequential block
always@(posedge clk or negedge rst)begin
    if(!rst)begin
        state<=INST_ADDER;
    end
    else begin
        state<= next_state;
    end
end

//combinatinal block
    always@(*)begin
        case(state)
        INST_ADDER: next_state = INST_FETCH;
        INST_FETCH: next_state = INST_LOAD;
        INST_LOAD: next_state = IDLE;
        IDLE: next_state = OP_ADDER;
        OP_ADDER: next_state = OP_FETCH;
        OP_FETCH: next_state = ALU_OP;
        ALU_OP: next_state = STORE;
        default: next_state = INST_ADDER;
        endcase
    end

    reg H,Z,A,S,J;

    always @(opcode)begin
        H = (opcode == 3'b000)? 1:0;
        Z = (opcode == 3'b001 & zero == 1)? 1:0;
        A = (opcode == 3'b010 | opcode == 3'b011 | opcode == 3'b100 | opcode == 3'b101)? 1:0;
        S = (opcode == 3'b110)? 1:0;
        J = (opcode == 3'b111)? 1:0;
    end

    always@(state)begin
        if(state==3'b000)begin
            mem_rd=0; 
            load_ir=0; 
            halt=0; 
            inc_pc=0; 
            load_ac=0; 
            load_pc=0; 
            mem_wr=0;
        end
        else if (state == 3'b001) begin
            mem_rd=1; 
            load_ir=0; 
            halt=0; 
            inc_pc=0; 
            load_ac=0; 
            load_pc=0; 
            mem_wr=0;
        end
        else if (state == 3'b010) begin
            mem_rd=1; 
            load_ir=1; 
            halt=0; 
            inc_pc=0; 
            load_ac=0; 
            load_pc=0; 
            mem_wr=0;
        end
        else if (state == 3'b011) begin
            mem_rd=1; 
            load_ir=1; 
            halt=0; 
            inc_pc=0; 
            load_ac=0; 
            load_pc=0; 
            mem_wr=0;
        end
        
        else if (state == 3'b100) begin
            mem_rd=0; 
            load_ir=0; 
            halt=H; 
            inc_pc=1; 
            load_ac=0; 
            load_pc=0; 
            mem_wr=0;
        end
        else if (state == 3'b101) begin
            mem_rd=A; 
            load_ir=0; 
            halt=0; 
            inc_pc=0; 
            load_ac=0; 
            load_pc=0; 
            mem_wr=0;
        end
        else if (state == 3'b110)begin
            mem_rd=A; 
            load_ir=0; 
            halt=0; 
            inc_pc=Z; 
            load_ac=A; 
            load_pc=J; 
            mem_wr=0;
        end
          else begin
            mem_rd=A; 
            load_ir=0; 
            halt=0; 
            inc_pc=J; 
            load_ac=A; 
            load_pc=J; 
            mem_wr=S;
        end
    end

    
endmodule