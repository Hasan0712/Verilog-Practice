module  controller_tb();

reg [2:0] opcode_tb;
reg clk_tb;
reg rst_tb;
reg zero_tb;
 

wire memrd_tb;
wire loadir_tb;
wire halt_tb;
wire incpc_tb;
wire loadac_tb;
wire loadpc_tb;
wire memwr_tb;
 controller u_control(.opcode(opcode_tb),
 .clk(clk_tb),
 .rst(rst_tb),
 .zero(zero_tb),
 .memrd(memrd_tb),
 .loadir(loadir_tb),
 .halt(halt_tb),
 .incpc(incpc_tb),
 .loadac(loadac_tb),
 .loadpc(loadpc_tb),
 .memwr(memwr_tb));        

    initial begin
        zero_tb=0;
        opcode_tb=3'b000;
        clk_tb=0;
        rst_tb=0;

        #5;
        zero_tb=0;
        opcode_tb=3'b001;
        rst_tb=1;

        #5;
        zero_tb=0;
        opcode_tb=3'b010;
        rst_tb=1;

        #5;
        zero_tb=0;
        opcode_tb=3'b011;
        rst_tb=1;

        #5;
        zero_tb=0;
        opcode_tb=3'b100;
        rst_tb=1;

        #5;
        zero_tb=0;
        opcode_tb=3'b101;
        rst_tb=1;

        #5;
        zero_tb=0;
        opcode_tb=3'b110;
        rst_tb=1;

        #5;
        zero_tb=0;
        opcode_tb=3'b111;
        rst_tb=1;

        #5;
    end

    always begin
        #5;
        clk_tb = ~clk_tb;
    end


    initial begin
        $dumpfile("sqcont.vcd");
        $dumpvars(0,controller_tb);
    end
endmodule






    