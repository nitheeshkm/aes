`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 02:54:30 PM
// Design Name: 
// Module Name: mixColumns_testbench
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


module mixColumns_testbench#(
    parameter BLOCK_SIZE = 128
    );
    
reg clk,rst,start;
reg [127:0] i;
wire [127:0] o;
wire oo;

integer period = 10;

initial begin
    clk = 1;
    forever #(period/2) clk = ~clk;
end

mixColumns#(BLOCK_SIZE)uut(clk,rst,i,o,oo);

initial begin
    rst = 1;
    #period
    rst = 0;
    #period
    start = 1;
    i = 128'h63_f2_7d_d4_c9_63_d4_fa_fe_26_c9_63_30_f2_c9_82;
    #period
    start = 0;
    
end
endmodule
