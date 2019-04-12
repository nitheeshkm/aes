`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 05:40:17 PM
// Design Name: 
// Module Name: keySchedule_testbench
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


module keySchedule_testbench#(
    parameter BLOCK_SIZE = 128
    );
    reg clk;
    reg rst;
    reg [3:0] state_i;
    reg fetch_rcon;
    reg [BLOCK_SIZE-1:0] key_i;
    wire [BLOCK_SIZE-1:0] key_o;
    
    integer period = 10;
    
    initial begin
        clk = 1;
        forever #(period/2) clk = ~clk;
    end
    
    keySchedule#(BLOCK_SIZE) uut(clk,rst,state_i,fetch_rcon,key_i,key_o);
    
    initial begin
        rst = 1;
        #period
        rst = 0;
        #period
        state_i = 4'h0;
//        key_i = 128'h24_75_A2_B3_34_75_56_88_31_E2_12_00_13_AA_54_87;
        key_i = 128'h00;
        #period
        state_i = 4'h1;
        fetch_rcon = 0;
        key_i = 0;
//        key_i = 128'ha1_af_bc_2e_23_78_39_a3_6c_05_74_66_54_89_b2_2c;
        #period
        fetch_rcon =1;
        #period
        fetch_rcon = 1;
        #period
        fetch_rcon = 0;
         #(period*2)
        state_i = 4'h2;
        fetch_rcon = 0;
        #period 
        fetch_rcon = 0;
        #period
        fetch_rcon = 1;
        #(period*2)
        fetch_rcon = 0;
        #(period*2)
        state_i = 4'h3;
        fetch_rcon = 0;
        #period 
        fetch_rcon = 0;
        #period
        fetch_rcon = 1;
        #(period*2)
        fetch_rcon = 0;
    end
endmodule
