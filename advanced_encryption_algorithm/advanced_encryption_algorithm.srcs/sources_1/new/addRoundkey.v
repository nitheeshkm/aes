`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 03:19:37 PM
// Design Name: 
// Module Name: addRoundkey
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


module addRoundkey#(
    parameter BLOCK_SIZE = 128,
    parameter B_S_DIV_8 = 16)(
    input clk,
    input rst,
    input start,
    input [BLOCK_SIZE-1:0] data_i,
    input [BLOCK_SIZE-1:0] key,
    output reg [BLOCK_SIZE-1:0] data_o,
    output reg output_en
    );

wire [BLOCK_SIZE-1:0] buff; 

generate
    genvar i;
    for(i = 0; i < B_S_DIV_8; i = i + 1) begin
        assign buff[((i+1)*8)-1:i*8] = (data_i[((i+1)*8)-1:i*8]) ^ (key[((i+1)*8)-1:i*8]);
    end
endgenerate

always@(posedge clk) begin
    if(rst) begin
        data_o <= {BLOCK_SIZE{1'b0}};
        output_en <= 0;
    end
    else begin
        if(start) begin
            data_o <= buff;
            output_en <= 1;
        end
        else begin 
            data_o <= data_o;
            output_en <= 0;
        end
    end
end

endmodule
