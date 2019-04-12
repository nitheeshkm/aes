`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 05:16:54 PM
// Design Name: 
// Module Name: mixColumns_32bit
// Project Name: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mixColumns_32bit(
    input clk,
    input reset,
    input [32-1:0] data_i,
    output reg [32-1:0] data_o
    );

wire [8-1:0] hw0;
wire [8-1:0] hw1;
wire [8-1:0] hw2;
wire  [8-1:0] hw3;

mixColumns_8bit0 fr_c(clk, reset, data_i, hw0);
mixColumns_8bit1 sr_c(clk, reset, data_i, hw1);
mixColumns_8bit2 tr_c(clk, reset, data_i, hw2);
mixColumns_8bit3 for_c(clk, reset, data_i, hw3);

always@(posedge clk) begin
    if(reset) begin
        data_o <= 8'b0;
    end
    else begin
        data_o <= {hw0,hw1,hw2,hw3};
    end
end


endmodule
