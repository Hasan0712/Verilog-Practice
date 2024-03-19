
`timescale 1ns/1ps
module statemachine ();
 
 reg clk_tb;
 reg reset_tb;
 wire out_tb;


 fsm #(
    .a0(1),.a1(1)
 )
u_fsm0(.clk(clk_tb),
       .reset(reset_tb),
       .out(out_tb));

       initial begin
        clk_tb=0;
        reset_tb=1;
        #10;
       reset_tb=0;
      #10;
       end


initial begin
    $dumpfile("fsm.vcd");
    $dumpvars(0,statemachine);
    end
always begin
        #10 clk_tb= ~clk_tb;
    end




    
endmodule