                                                                
`timescale 1ns/1ps

module ha();
reg a_tb;
reg b_tb;
wire sum_tb;
wire cout_tb;


initial begin
    
a_tb=0;
b_tb=1;
#2;
a_tb=0;
b_tb=0;
#2;
a_tb=1;
b_tb=1;
#2;


end

half_adder u_ab(.a(a_tb)
,.b(b_tb)
,.sum(sum_tb)
,.cout(cout_tb));
initial begin

$dumpfile("ha.vcd");
$dumpvars(0,ha);



end

endmodule
