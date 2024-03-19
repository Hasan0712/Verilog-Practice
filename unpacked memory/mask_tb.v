`timescale 1ns/1ps
module bitmask_tb ();
reg [7:0] addr_tb;
reg [31:0] data_tb;
reg c_en_tb;
reg wr_tb;
reg[31:0] wrmask_tb;
wire[31:0]r_data_tb;


     initial begin
        c_en_tb=1;
        data_tb= 100100000000001110100000000000000;
        addr_tb=8'b00000001;
        wr_tb=1;
       wrmask_tb= 11110000000000000000000000000000;
       #10;
     end
     bitmask u_mem(.addr(addr_tb),
              .data(data_tb),
              .c_en(c_en_tb),
              .wr(wr_tb),
              .wrmask(wrmask_tb),
              .r_data(r_data_tb));
              

initial begin
     $dumpfile("bitmask.vcd");
     $dumpvars(0,bitmask_tb);
end





    
endmodule
