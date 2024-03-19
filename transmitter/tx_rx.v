`include "tx.v"
`include "rx.v"
module top(
    input wire clk,
    input wire rst,
    input wire busy,
    input wire readyi,
    input wire tx);
    wire validi;
    wire valido;
    wire [3:0]datai;
    wire [3:0]datao;
    wire readyo;
transmitter u_tx1(.clk(clk),
        .rst(rst),
        .tx(tx),
        .readyi(readyi),
        .datao(datao),
        .valido(valido));
transreciever u_rx1(.busy(busy),
        .validi(valido),
        .datai(datao),
        .clk(clk),
        .readyo(readyi));       


endmodule