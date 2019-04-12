`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 10:26:31 AM
// Design Name: 
// Module Name: subByte_testbench
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


module subByte_testbench#(
    parameter BLOCK_SIZE = 128,
    parameter B_S_DIV_8 = 16
    )(
);
reg clk,rst,start;
reg [BLOCK_SIZE-1:0] i;
wire [BLOCK_SIZE-1:0] o;
integer period = 10;

initial begin
    clk = 1;
    forever #(period/2) clk = ~clk;
end

subBytes#(BLOCK_SIZE,B_S_DIV_8)uut(clk,rst,start,i,o);

initial begin
    rst = 1;
    #period
    rst = 0;
    #period
    start = 1;
    i = 128'h00_04_12_14_12_04_12_00_0c_00_13_11_08_23_19_19;
    #period 
    start = 0;
//    #period
//    start = 1;
//    i = 128'h04_04_12_14_12_04_12_00_0c_00_13_11_08_23_19_00;
//    #period
//    start = 0;
end

endmodule
