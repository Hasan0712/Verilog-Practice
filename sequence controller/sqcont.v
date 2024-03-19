module controller(zero,clk,opcode,rst,memrd,loadir,halt,incpc,loadac,loadpc,memwr);

input wire [2:0] opcode;
input wire  clk;
input wire  zero;
input wire  rst;

output reg  memrd;
output reg  loadir;
output reg  halt;
output reg  incpc;
output reg  loadac;
output reg  loadpc;
output reg  memwr;

localparam INST_ADDER = 3'b000;
localparam INST_FETCH = 3'b001;
localparam INST_LOAD  = 3'b010;
localparam IDLE       = 3'b011;
localparam OP_ADDER   = 3'b100;
localparam OP_FETCH   = 3'b101;
localparam ALU_OP     = 3'b110;
localparam STORE      = 3'b111;
reg [2:0] nextstate;
reg [2:0] state;
always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        state<=INST_ADDER;
    end
    else
    begin
        state<=nextstate;
    end

end
always@(*)begin
    case(state)
INST_ADDER:nextstate<=INST_FETCH;
INST_FETCH:nextstate<=INST_LOAD;
INST_LOAD:nextstate<=IDLE;
IDLE:nextstate<=OP_ADDER;
OP_ADDER:nextstate<=OP_FETCH;
OP_FETCH:nextstate<=ALU_OP;
ALU_OP:nextstate<=STORE;
default:nextstate<=INST_ADDER;
    endcase
end
reg A;
reg H;
reg J;
reg Z ;
reg S;


always @(opcode)begin
        H = (opcode == 3'b000)? 1:0;
        Z = (opcode == 3'b001 & zero == 1)? 1:0;
        A = (opcode == 3'b010 | opcode == 3'b011 | opcode == 3'b100 | opcode == 3'b101)? 1:0;
        S = (opcode == 3'b110)? 1:0;
        J = (opcode == 3'b111)? 1:0;
    end

always @(*)begin
    if(state==3'b000)begin
        memrd=0; loadir=0; halt=0; incpc=0; loadac=0; loadpc=0; memwr=0;    
        end
        if (state==3'b001)
        begin
            memrd=1; loadir=0; halt=0; incpc=0; loadac=0; loadpc=0; memwr=0;
        end
        if(state==3'b010)begin
            memrd=1; loadir=1; halt=0; incpc=0; loadac=0; loadpc=0; memwr=0;
        end
        else if (state == 3'b011) begin
            memrd=1; loadir=1; halt=0; incpc=0; loadac=0; loadpc=0; memwr=0;
        end
        else if (state == 3'b011) begin
            memrd=0; loadir=0; halt=H; incpc=1; loadac=0; loadpc=0; memwr=0;
        end
        else if (state == 3'b100) begin
            memrd=A; loadir=0; halt=0; incpc=0; loadac=0; loadpc=0; memwr=0;
        end
        else if (state == 3'b101) begin
            memrd=A; loadir=0; halt=0; incpc=Z; loadac=A; loadpc=J; memwr=0;
        end
        else begin
            memrd=A; loadir=0; halt=0; incpc=J; loadac=A; loadpc=J; memwr=S;
        end
    end




    

    
endmodule                               







//zero