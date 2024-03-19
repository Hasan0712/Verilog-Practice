module count (cntin,enable,load,clk,cntout,rst) ;


input wire [4:0]cntin;
input wire enable;
input wire load;
input wire clk;
input wire rst;

output reg [4:0]cntout;
always @(posedge clk)begin
    

if(rst==1)
begin
    cntout = 5'b00000;
end

else 
begin
    cntout <= (load | enable)? cntin:5'b00000;
end


end
endmodule