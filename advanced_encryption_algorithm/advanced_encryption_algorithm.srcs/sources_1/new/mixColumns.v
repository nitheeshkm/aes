`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 02:08:49 PM
// Design Name: 
// Module Name: mixColumns
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: http://www.cs.siue.edu/~tgamage/S19/CS490/L/WK05.pdf
// https://crypto.stackexchange.com/questions/2402/how-to-solve-mixcolumns
// https://en.wikipedia.org/wiki/Rijndael_MixColumns
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mixColumns#(
    parameter BLOCK_SIZE = 128
    )(
    input clk,
    input rst,
//    input start,
    input [BLOCK_SIZE-1:0] data_i,
    output [BLOCK_SIZE-1:0] data_o
    );
    
wire [BLOCK_SIZE-1:0] buff;
//reg [BLOCK_SIZE-1:0] i;  //debug
// reg start_1 = 0;
// reg start_2 = 0;
mixColumns_32bit first_column(clk, rst, data_i[127:96], buff[127:96]);
mixColumns_32bit second_column(clk, rst, data_i[95:64], buff[95:64]);
mixColumns_32bit third_column(clk, rst, data_i[63:32], buff[63:32]);
mixColumns_32bit fourth_column(clk, rst, data_i[31:0], buff[31:0]);

//mixColumns_32bit first_column(clk, rst, i[127:96], buff[127:96]); //debug
//mixColumns_32bit second_column(clk, rst, i[95:64], buff[95:64]);
//mixColumns_32bit third_column(clk, rst, i[63:32], buff[63:32]);
//mixColumns_32bit fourth_column(clk, rst, i[31:0], buff[31:0]);



//always@(posedge clk) begin
////    i <= data_i; //debug
////    start_1 <= start;
////    start_2 <= start_1;
//    if(rst) begin
//        data_o <= {BLOCK_SIZE{1'b0}};
//    end
//    else begin
//        if(start_1) 
//            data_o <= buff;
//        else 
//           data_o <= data_o;
//    end
//end

//always@(negedge clk)begin
//    start_1 <= start;
//    start_2 <= start_1;
//end

assign data_o = rst ? {BLOCK_SIZE{1'b0}} :  buff ;

endmodule
