`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 05:04:26 PM
// Design Name: 
// Module Name: g_f_s_box_gen_testbench
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


module g_f_s_box_gen_testbench(
);

reg [7:0]i;
wire [7:0]o;

galois_field_s_box_gen uut(i,o);

initial begin
    i = 8'h9a;
end
endmodule
