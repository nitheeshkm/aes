`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:Nitheesh K Manjunath
// 
// Create Date: 04/03/2019 04:51:44 PM
// Design Name: 
// Module Name: galois_field_s_box_gen
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

//not doing this on hw because I have no idea how to perfom modulo by using just logic

module galois_field_s_box_gen(
    input  [8-1:0] a_i,
    output [8-1:0] b_o
    );
    
wire [8-1:0] b_i;
wire [8-1:0] b_ii;

//assign b_i = {a_i[0],a_i[1],a_i[2],a_i[3],a_i[4],a_i[5],a_i[6],a_i[7]};
assign b_i = a_i;
//assign {b_o[3:0],b_o[7:4]} = b_i ^ ({b_i[6:0],b_i[7]}) ^ ({b_i[5:0], b_i[7:6]}) ^ ({b_i[4:0],b_i[7:5]}) ^ ({b_i[3:0],b_i[7:4]}) ^ 8'b01100011;

//assign b_o = b_i ^ ({b_i[6:0],b_i[7]}) ^ ({b_i[5:0],b_i[7:6]}) ^ ({b_i[4:0],b_i[7:5]}) ^ ({b_i[3:0],b_i[7:4]}) ^ 8'b01100011;

//assign b_ii[0] = b_i[0] ^ b_i[1] ^ b_i[2] ^ b_i[3] ^ b_i[7];
//assign b_ii[1] = b_i[1] ^ b_i[2] ^ b_i[3] ^ b_i[4] ^ b_i[0];
//assign b_ii[2] = b_i[2] ^ b_i[3] ^ b_i[4] ^ b_i[5] ^ b_i[1];
//assign b_ii[3] = b_i[3] ^ b_i[4] ^ b_i[5] ^ b_i[6] ^ b_i[2];
//assign b_ii[4] = b_i[4] ^ b_i[5] ^ b_i[6] ^ b_i[7] ^ b_i[3];
//assign b_ii[5] = b_i[5] ^ b_i[6] ^ b_i[7] ^ b_i[0] ^ b_i[4];
//assign b_ii[6] = b_i[6] ^ b_i[7] ^ b_i[0] ^ b_i[1] ^ b_i[5];
//assign b_ii[7] = b_i[7] ^ b_i[0] ^ b_i[1] ^ b_i[2] ^ b_i[6];

assign b_ii[0] = b_i[0] ^ b_i[4] ^ b_i[5] + b_i[6] + b_i[7];
assign b_ii[1] = b_i[0] + b_i[1] + b_i[5] + b_i[6] + b_i[7];
assign b_ii[2] = b_i[0] + b_i[1] + b_i[2] + b_i[6] + b_i[7];
assign b_ii[3] = b_i[0] + b_i[1] + b_i[2] + b_i[3] + b_i[7];
assign b_ii[4] = b_i[0] + b_i[1] + b_i[2] + b_i[3] + b_i[4];
assign b_ii[5] = b_i[1] + b_i[2] + b_i[3] + b_i[4] + b_i[5];
assign b_ii[6] = b_i[2] + b_i[3] + b_i[4] + b_i[5] + b_i[7];
assign b_ii[7] = b_i[3] + b_i[4] + b_i[5] + b_i[6] + b_i[7];

assign b_o = b_ii ^ 8'b11000110;

endmodule
