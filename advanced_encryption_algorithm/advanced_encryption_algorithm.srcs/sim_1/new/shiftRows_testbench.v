`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 01:15:38 PM
// Design Name: 
// Module Name: shiftRows_testbench
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


module shiftRows_testbench#(
    parameter BLOCK_SIZE = 128
    );
    
reg clk, rst, start;
reg [127:0] i;
wire [127:0] o;
integer period = 10;

initial begin
    clk = 1;
    forever #(period/2) clk = ~clk; 
end

shiftRows#(BLOCK_SIZE)uut(clk,rst,start,i,o);

initial begin
rst = 1;
#period
rst= 0;
#period
start = 1;
i = 128'h63_f2_c9_fa_c9_f2_c9_63_fe_63_7d_82_30_26_d4_d4;
#period 
start = 0;
end


endmodule