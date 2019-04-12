`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 12:42:38 PM
// Design Name: 
// Module Name: mixColumns_8bit_testbench
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


module mixColumns_8bit_testbench(

    );
    
    reg clk, reset;
    reg [31:0] i;
    wire [32-1:0] o;
    
    integer period = 10;
    
    initial begin
       clk = 1;
       forever #(period/2) clk = ~clk;
    end
    mixColumns_32bit uut(clk, reset, i, o);
    initial begin
        reset = 1;
        #period
        reset = 0;
        #period
//        i = 32'hd4bf5d30;
//        i = 32'hdb135345;
        i = 32'h2d26314c;
//        i = 32'h63f27dd4;
        
    end
endmodule
