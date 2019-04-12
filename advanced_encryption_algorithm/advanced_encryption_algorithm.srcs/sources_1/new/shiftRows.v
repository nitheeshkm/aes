`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 11:10:46 AM
// Design Name: 
// Module Name: shiftRows
// Project Name: 
// Target Devices: 
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


module shiftRows#(
    parameter BLOCK_SIZE = 128
    )(
    input clk,
    input rst,
//    input start,
    input [BLOCK_SIZE-1:-0] data_i,
    output reg [BLOCK_SIZE-1:-0] data_o
    );

wire [BLOCK_SIZE-1:-0] buff;

assign buff = {data_i[127:120],data_i[87:80],data_i[47:40],data_i[7:0],
               data_i[95:88],data_i[55:48],data_i[15:8],data_i[103:96],
               data_i[63:56],data_i[23:16],data_i[111:104],data_i[71:64],
               data_i[31:24],data_i[119:112],data_i[79:72],data_i[39:32]};
/*
assign buff = {data_i[7:0],data_i[47:40],data_i[87:80],data_i[127:120],
               data_i[39:32],data_i[79:72],data_i[119:112], data_i[31:24], 
               data_i[71:64], data_i[111:104],data_i[23:16],data_i[63:56],
               data_i[103:96],data_i[15:8],data_i[55:48],data_i[95:88]};
*/              

always@(posedge clk) begin
    if(rst) begin
        data_o <= {BLOCK_SIZE{128'b0}};
    end
    else begin
//        if(start) begin
           data_o <= buff;
//        end
//        else /begin
//            data_o <= data_o;
//        end
    end
end

endmodule
