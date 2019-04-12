`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2019 09:16:38 AM
// Design Name: 
// Module Name: top_testbench
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


module top_testbench#(
    parameter BLOCK_SIZE = 128,
    parameter B_S_DIV_8 = 16
    );
    reg clk;
    reg rst;
    reg start;
    reg [BLOCK_SIZE-1:0] i;
    reg [BLOCK_SIZE-1:0] k;
    wire [BLOCK_SIZE-1:0] o;
    
    integer period = 10;
    
    initial begin
        clk = 1;
        forever #(period/2) clk = ~clk;
    end
    
    top#(BLOCK_SIZE,B_S_DIV_8)uut(clk,rst,start,i,k,o);
    
    initial begin
        rst = 1;
        #period
        rst=0;
        #period
        start = 1;
//        i = 128'h00_04_12_14_12_04_12_00_0c_00_13_11_08_23_19_19;
//        i = 128'h00_11_22_33_44_55_66_77_88_99_AA_BB_CC_DD_EE_FF;
        i = 128'h0;
        k = 128'h0;
        #period
        start = 0;
        i = 0;
        k = 0;
        #(54*period)
        start = 1;
//        i = 128'h00_11_22_33_44_55_66_77_88_99_AA_BB_CC_DD_EE_FF;
//        i = 128'h00_44_88_CC_11_55_99_DD_22_66_AA_EE_33_77_BB_FF;
        i = 128'h0;
        k = 128'h0;
        #period
        start = 0;
        i = 0;
        k = 0;
    end
endmodule
