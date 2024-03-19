module transreciever (clk,rst,readyo,datai,validi,busy);
input wire clk;
input wire rst;
input wire busy;
input wire validi;
input wire [3:0] datai;
output reg readyo;

reg [3:0] rx;

always @(posedge clk)begin
    if (busy)begin
        readyo<=1'b0;

    end
    else begin
        readyo<=1'b1;
    end
end
always @(posedge clk)begin
    if(readyo)begin
        rx=datai;
    end
end
    
endmodule