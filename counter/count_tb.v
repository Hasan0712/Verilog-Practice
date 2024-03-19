`timescale 1ns/1ps
module count_tb( );

reg [4:0]cntin_tb;
reg load_tb;
reg enable_tb;
reg clk_tb;
reg rst_tb;
wire [5:0]cntout;
initial begin
   #20; 
 cntin_tb=10101;
 load_tb=1;
 enable_tb=1;
 clk_tb=0;
 rst_tb=0;
 /* #10;
cntin_tb=01010;
 load_tb=1;
 enable_tb=1;
 clk_tb=
 rst_tb=0;
#10;
cntin_tb=11111;
 load_tb=1;
 enable_tb=1;
 clk_tb=
 rst_tb=0;
#10;
cntin_tb=11111;
 load_tb=1;
 enable_tb=1;
 clk_tb=
 rst_tb=1;
#10;
 cntin_tb=11111;
 load_tb=1;
 enable_tb=1;
 clk_tb=
 rst_tb=0;
#10;
cntin_tb=11111;
 load_tb=0;
 enable_tb=1;
 clk_tb=
 rst_tb=0;*/

end
count u_ad(.cntin(cntin_tb),.load(load_tb),.enable(enable_tb),.clk(clk_tb),.rst(rst_tb));
initial begin
    $dumpfile("count.vcd");
    $dumpvars(0,count_tb);
    end
always begin
        #10 clk_tb= ~clk_tb;
    end


    
endmodule