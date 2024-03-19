`timescale 1ns/1ps

module control ();




reg [2:0] phase_tb;
reg [2:0] opcode_tb;
reg zero_tb;

wire     rd_tb;
wire     sel_tb;
wire     id_ir_tb;
wire     inc_pc_tb;
wire     halt_tb;
wire     id_pc_tb;
wire     data_e_tb;
wire     id_ac_tb;
wire     wr_tb;

initial begin
    phase_tb=000;
    opcode_tb=011;
    zero_tb=0;
    #2;
     phase_tb=010;
    opcode_tb=001;
     zero_tb=0;
    #2;
     phase_tb=100;
    opcode_tb=111;
    zero_tb=0;
    #2;
end
controller u_cd(.phase(phase_tb),.opcode(opcode_tb) sel=1,;d=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
,.zero(zero_tb),.sel(sel_tb),.rd(rd_tb),.id_ir(id_ir_tb)
,.inc_pc(inc_pc_tb),.halt(halt_tb),.id_pc(id_pc_tb)
,.data_e(data_e_tb),.id_ac(id_ac_tb),.wr(wr_tb);
)

initial begin
$dumpfile("control.vcd");
$dumpvars(0,control);

end

    
endmodule