module fsm  #(parameter a0 =0,a1=1 )
(clk,reset,out);
input wire clk;
input wire reset;
//input wire in;

output reg out;







reg nextstate=a1;
always @(posedge clk or negedge reset)begin
if (reset)
begin
    out <=a0;
end
else
begin
   out <=nextstate;
end
end


  
endmodule