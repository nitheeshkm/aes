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


module mixColumns_8bit2(
    input clk,
    input reset,
    input [32-1:0] data_i,
    output reg [8-1:0] data_o
    );

wire [8-1:0] buff0;
wire [8-1:0] buff1;
wire [8-1:0] buff2;
wire  [8-1:0] buff3;



assign buff0 =  data_i[31:24];
assign buff1 =  data_i[23:16];
assign buff2 = data_i[15] ? {data_i[14:8],1'b0} ^ 8'h1b : {data_i[14:8],1'b0}  ;
assign buff3 =  data_i[7] ? {data_i[6:0], 1'b0} ^ 8'h1b ^ data_i[7:0] : {data_i[6:0], 1'b0} ^ data_i[7:0];

//assign buff0 = data_i[31] ? {data_i[30:24],1'b0} ^ 8'h1b : {data_i[30:24],1'b0};
//assign buff1 = data_i[23] ? {data_i[22:16],1'b0} ^ 8'h1b ^ data_i[23:16] : {data_i[22:16], 1'b0} ^ data_i[23:16];
//assign buff2 = data_i[15] ? data_i[15:8] ^ 8'h1b : data_i[15:8];
//assign buff3 = data_i[7] ? data_i[7:0] ^ 8'h1b : data_i[7:0];

always@(posedge clk) begin
    if(reset) begin
        data_o <= 8'b0;
    end
    else begin
        data_o <= buff0 ^ buff1 ^ buff2 ^ buff3;
    end
end


endmodule
