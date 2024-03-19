module transmitter (clk,rst,tx,readyi,valido,datao);
    
    input wire clk;
    input wire rst;
    input wire tx;
    input wire readyi;
    output reg valido;
    output reg [3:0]datao;

    localparam IDLE =2'b00 ;
    localparam TX=2'b01;
    localparam VALID=2'b10;

reg [1:0] state;           //state machine SEQUENTIOL BLOCK
reg [1:0] nextstate;        //AS WE HAVE TWO BITS IN TERMS OF STATE AND NEXT STATE
//SEQUENTIOL BLOCK
always @(posedge clk)begin
    if (rst)begin
        state<=IDLE;
    end
    else begin
        state<=nextstate;
    end
end   
//COMBINATIONAL BLOCK
always @(*)begin
    case (state)
        IDLE:begin
            nextstate<=TX;
            valido<=1'b0;
        end 
        TX:begin
            nextstate<=(tx)? VALID:TX;
            valido<=1'b0;

        end
        VALID:
    begin
        nextstate<=(readyi)? VALID:TX;
        valido<=1'b1;
        datao<=4'b1111;
    end
        default: nextstate<=IDLE;
    endcase
end                      //INITIAL STATE 00= IDLE IF RST MOVE TO TX IF tx==0 RMAIN ON THE SAME STATE 
                             //AND IF tx =1 MOVE TO VALID STATE IF READY =1 MOVE BACK TO TX








endmodule