module controller (phase,opcode,zero,sel,rd,id_ir,inc_pc,halt,id_pc,data_e,id_ac,wr);
input wire [2:0]phase;
input wire [2:0]opcode;
input wire zero;

output reg sel;
output reg rd;
output reg id_ir;
output reg inc_pc;
output reg halt;
output reg id_pc;
output reg data_e;
output reg id_ac;
output reg wr;
reg H=0,A=0,Z=0,J=0,S=0;
always @(phase)begin
    if (phase==8'd0)begin
        sel=1;rd=0;id_ir=0;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    
    else if(phase==8'd1)begin
      sel=1;rd=1;id_ir=0;inc_pc=0;halt=0,;d_pc=0;data_e=0;id_ac=0;wr=0;        
    end
    else if(phase==8'd2)begin
        sel=1;rd=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if(phase 8'd3)begin
        sel=1,;d=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if(phase==8'd4)begin
         sel=1,;d=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if(phase== 8'd5)begin
     sel=1,;d=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
        
    end
    else if(phase== 8'd6)begin
         sel=1,;d=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if(phase== 8'd7)begin
          sel=1,;d=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else begin
          sel=0;d=0;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
end
    always @ (*) begin
    if(opcode==0)begin
         H=1;
    end
        
          
    
    else if (opcode == 1)begin
        Z=1;
    end
    else if (opcode == 2)begin
        A=1;
    end
    else if (opcode == 3)begin
        A=1;        
    end
    else if (opcode == 4)begin
        A=1;
    end
    else if (opcode == 5)begin
        A=1;
    end
    else if (opcode == 6)begin
        S=1;
    end
    else if (opcode== 7)begin
        J=1;
    end

    end


    
endmodule