`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 09:19:45 AM
// Design Name: 
// Module Name: subBytes
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


module subBytes#(
    parameter BLOCK_SIZE = 128,
    parameter B_S_DIV_8 = 16
    )(
    input clk,
    input rst,
//    input start,
    input [BLOCK_SIZE-1:0] data_i,
    output reg [BLOCK_SIZE-1:0] data_o 
    );

wire [BLOCK_SIZE-1:0] subbyte;
//(*KEEP = "TRUE"*) reg [BLOCK_SIZE-1:0] buff;
//reg start_i;
generate
    genvar i;
        for(i = 0; i < B_S_DIV_8 ; i = i + 1) begin
             assign subbyte[((i+1)*8)-1:i*8] = sbox(data_i[((i+1)*8)-1:i*8]);
        end
endgenerate

always@(posedge clk) begin
//    buff <= data_i;
//    start_i <= start;
    if(rst) begin
       data_o <= {BLOCK_SIZE{1'b0}}; 
    end
    else begin
//        if(start) begin
            data_o <= subbyte;
//        end
//        else begin
//            data_o <= data_o;
//        end 
    end
end

function [7:0] sbox;
    input[7:0] address;
 
    begin
    case (address)
      8'h0 : sbox = 8'h63;
      8'h1 : sbox = 8'h7C;
      8'h2 : sbox = 8'h77;
      8'h3 : sbox = 8'h7B;
      8'h4 : sbox = 8'hF2;
      8'h5 : sbox = 8'h6B;
      8'h6 : sbox = 8'h6F;
      8'h7 : sbox = 8'hC5;
      8'h8 : sbox = 8'h30;
      8'h9 : sbox = 8'h1;
      8'hA : sbox = 8'h67;
      8'hB : sbox = 8'h2B;
      8'hC : sbox = 8'hFE;
      8'hD : sbox = 8'hD7;
      8'hE : sbox = 8'hAB;
      8'hF : sbox = 8'h76;
      8'h10 : sbox = 8'hCA;
      8'h11 : sbox = 8'h82;
      8'h12 : sbox = 8'hC9;
      8'h13 : sbox = 8'h7D;
      8'h14 : sbox = 8'hFA;
      8'h15 : sbox = 8'h59;
      8'h16 : sbox = 8'h47;
      8'h17 : sbox = 8'hF0;
      8'h18 : sbox = 8'hAD;
      8'h19 : sbox = 8'hD4;
      8'h1A : sbox = 8'hA2;
      8'h1B : sbox = 8'hAF;
      8'h1C : sbox = 8'h9C;
      8'h1D : sbox = 8'hA4;
      8'h1E : sbox = 8'h72;
      8'h1F : sbox = 8'hC0;
      8'h20 : sbox = 8'hB7;
      8'h21 : sbox = 8'hFD;
      8'h22 : sbox = 8'h93;
      8'h23 : sbox = 8'h26;
      8'h24 : sbox = 8'h36;
      8'h25 : sbox = 8'h3F;
      8'h26 : sbox = 8'hF7;
      8'h27 : sbox = 8'hCC;
      8'h28 : sbox = 8'h34;
      8'h29 : sbox = 8'hA5;
      8'h2A : sbox = 8'hE5;
      8'h2B : sbox = 8'hF1;
      8'h2C : sbox = 8'h71;
      8'h2D : sbox = 8'hD8;
      8'h2E : sbox = 8'h31;
      8'h2F : sbox = 8'h15;
      8'h30 : sbox = 8'h4;
      8'h31 : sbox = 8'hC7;
      8'h32 : sbox = 8'h23;
      8'h33 : sbox = 8'hC3;
      8'h34 : sbox = 8'h18;
      8'h35 : sbox = 8'h96;
      8'h36 : sbox = 8'h5;
      8'h37 : sbox = 8'h9A;
      8'h38 : sbox = 8'h7;
      8'h39 : sbox = 8'h12;
      8'h3A : sbox = 8'h80;
      8'h3B : sbox = 8'hE2;
      8'h3C : sbox = 8'hEB;
      8'h3D : sbox = 8'h27;
      8'h3E : sbox = 8'hB2;
      8'h3F : sbox = 8'h75;
      8'h40 : sbox = 8'h9;
      8'h41 : sbox = 8'h83;
      8'h42 : sbox = 8'h2C;
      8'h43 : sbox = 8'h1A;
      8'h44 : sbox = 8'h1B;
      8'h45 : sbox = 8'h6E;
      8'h46 : sbox = 8'h5A;
      8'h47 : sbox = 8'hA0;
      8'h48 : sbox = 8'h52;
      8'h49 : sbox = 8'h3B;
      8'h4A : sbox = 8'hD6;
      8'h4B : sbox = 8'hB3;
      8'h4C : sbox = 8'h29;
      8'h4D : sbox = 8'hE3;
      8'h4E : sbox = 8'h2F;
      8'h4F : sbox = 8'h84;
      8'h50 : sbox = 8'h53;
      8'h51 : sbox = 8'hD1;
      8'h52 : sbox = 8'h0;
      8'h53 : sbox = 8'hED;
      8'h54 : sbox = 8'h20;
      8'h55 : sbox = 8'hFC;
      8'h56 : sbox = 8'hB1;
      8'h57 : sbox = 8'h5B;
      8'h58 : sbox = 8'h6A;
      8'h59 : sbox = 8'hCB;
      8'h5A : sbox = 8'hBE;
      8'h5B : sbox = 8'h39;
      8'h5C : sbox = 8'h4A;
      8'h5D : sbox = 8'h4C;
      8'h5E : sbox = 8'h58;
      8'h5F : sbox = 8'hCF;
      8'h60 : sbox = 8'hD0;
      8'h61 : sbox = 8'hEF;
      8'h62 : sbox = 8'hAA;
      8'h63 : sbox = 8'hFB;
      8'h64 : sbox = 8'h43;
      8'h65 : sbox = 8'h4D;
      8'h66 : sbox = 8'h33;
      8'h67 : sbox = 8'h85;
      8'h68 : sbox = 8'h45;
      8'h69 : sbox = 8'hF9;
      8'h6A : sbox = 8'h2;
      8'h6B : sbox = 8'h7F;
      8'h6C : sbox = 8'h50;
      8'h6D : sbox = 8'h3C;
      8'h6E : sbox = 8'h9F;
      8'h6F : sbox = 8'hA8;
      8'h70 : sbox = 8'h51;
      8'h71 : sbox = 8'hA3;
      8'h72 : sbox = 8'h40;
      8'h73 : sbox = 8'h8F;
      8'h74 : sbox = 8'h92;
      8'h75 : sbox = 8'h9D;
      8'h76 : sbox = 8'h38;
      8'h77 : sbox = 8'hF5;
      8'h78 : sbox = 8'hBC;
      8'h79 : sbox = 8'hB6;
      8'h7A : sbox = 8'hDA;
      8'h7B : sbox = 8'h21;
      8'h7C : sbox = 8'h10;
      8'h7D : sbox = 8'hFF;
      8'h7E : sbox = 8'hF3;
      8'h7F : sbox = 8'hD2;
      8'h80 : sbox = 8'hCD;
      8'h81 : sbox = 8'hC;
      8'h82 : sbox = 8'h13;
      8'h83 : sbox = 8'hEC;
      8'h84 : sbox = 8'h5F;
      8'h85 : sbox = 8'h97;
      8'h86 : sbox = 8'h44;
      8'h87 : sbox = 8'h17;
      8'h88 : sbox = 8'hC4;
      8'h89 : sbox = 8'hA7;
      8'h8A : sbox = 8'h7E;
      8'h8B : sbox = 8'h3D;
      8'h8C : sbox = 8'h64;
      8'h8D : sbox = 8'h5D;
      8'h8E : sbox = 8'h19;
      8'h8F : sbox = 8'h73;
      8'h90 : sbox = 8'h60;
      8'h91 : sbox = 8'h81;
      8'h92 : sbox = 8'h4F;
      8'h93 : sbox = 8'hDC;
      8'h94 : sbox = 8'h22;
      8'h95 : sbox = 8'h2A;
      8'h96 : sbox = 8'h90;
      8'h97 : sbox = 8'h88;
      8'h98 : sbox = 8'h46;
      8'h99 : sbox = 8'hEE;
      8'h9A : sbox = 8'hB8;
      8'h9B : sbox = 8'h14;
      8'h9C : sbox = 8'hDE;
      8'h9D : sbox = 8'h5E;
      8'h9E : sbox = 8'hB;
      8'h9F : sbox = 8'hDB;
      8'hA0 : sbox = 8'hE0;
      8'hA1 : sbox = 8'h32;
      8'hA2 : sbox = 8'h3A;
      8'hA3 : sbox = 8'hA;
      8'hA4 : sbox = 8'h49;
      8'hA5 : sbox = 8'h6;
      8'hA6 : sbox = 8'h24;
      8'hA7 : sbox = 8'h5C;
      8'hA8 : sbox = 8'hC2;
      8'hA9 : sbox = 8'hD3;
      8'hAA : sbox = 8'hAC;
      8'hAB : sbox = 8'h62;
      8'hAC : sbox = 8'h91;
      8'hAD : sbox = 8'h95;
      8'hAE : sbox = 8'hE4;
      8'hAF : sbox = 8'h79;
      8'hB0 : sbox = 8'hE7;
      8'hB1 : sbox = 8'hC8;
      8'hB2 : sbox = 8'h37;
      8'hB3 : sbox = 8'h6D;
      8'hB4 : sbox = 8'h8D;
      8'hB5 : sbox = 8'hD5;
      8'hB6 : sbox = 8'h4E;
      8'hB7 : sbox = 8'hA9;
      8'hB8 : sbox = 8'h6C;
      8'hB9 : sbox = 8'h56;
      8'hBA : sbox = 8'hF4;
      8'hBB : sbox = 8'hEA;
      8'hBC : sbox = 8'h65;
      8'hBD : sbox = 8'h7A;
      8'hBE : sbox = 8'hAE;
      8'hBF : sbox = 8'h8;
      8'hC0 : sbox = 8'hBA;
      8'hC1 : sbox = 8'h78;
      8'hC2 : sbox = 8'h25;
      8'hC3 : sbox = 8'h2E;
      8'hC4 : sbox = 8'h1C;
      8'hC5 : sbox = 8'hA6;
      8'hC6 : sbox = 8'hB4;
      8'hC7 : sbox = 8'hC6;
      8'hC8 : sbox = 8'hE8;
      8'hC9 : sbox = 8'hDD;
      8'hCA : sbox = 8'h74;
      8'hCB : sbox = 8'h1F;
      8'hCC : sbox = 8'h4B;
      8'hCD : sbox = 8'hBD;
      8'hCE : sbox = 8'h8B;
      8'hCF : sbox = 8'h8A;
      8'hD0 : sbox = 8'h70;
      8'hD1 : sbox = 8'h3E;
      8'hD2 : sbox = 8'hB5;
      8'hD3 : sbox = 8'h66;
      8'hD4 : sbox = 8'h48;
      8'hD5 : sbox = 8'h3;
      8'hD6 : sbox = 8'hF6;
      8'hD7 : sbox = 8'hE;
      8'hD8 : sbox = 8'h61;
      8'hD9 : sbox = 8'h35;
      8'hDA : sbox = 8'h57;
      8'hDB : sbox = 8'hB9;
      8'hDC : sbox = 8'h86;
      8'hDD : sbox = 8'hC1;
      8'hDE : sbox = 8'h1D;
      8'hDF : sbox = 8'h9E;
      8'hE0 : sbox = 8'hE1;
      8'hE1 : sbox = 8'hF8;
      8'hE2 : sbox = 8'h98;
      8'hE3 : sbox = 8'h11;
      8'hE4 : sbox = 8'h69;
      8'hE5 : sbox = 8'hD9;
      8'hE6 : sbox = 8'h8E;
      8'hE7 : sbox = 8'h94;
      8'hE8 : sbox = 8'h9B;
      8'hE9 : sbox = 8'h1E;
      8'hEA : sbox = 8'h87;
      8'hEB : sbox = 8'hE9;
      8'hEC : sbox = 8'hCE;
      8'hED : sbox = 8'h55;
      8'hEE : sbox = 8'h28;
      8'hEF : sbox = 8'hDF;
      8'hF0 : sbox = 8'h8C;
      8'hF1 : sbox = 8'hA1;
      8'hF2 : sbox = 8'h89;
      8'hF3 : sbox = 8'hD;
      8'hF4 : sbox = 8'hBF;
      8'hF5 : sbox = 8'hE6;
      8'hF6 : sbox = 8'h42;
      8'hF7 : sbox = 8'h68;
      8'hF8 : sbox = 8'h41;
      8'hF9 : sbox = 8'h99;
      8'hFA : sbox = 8'h2D;
      8'hFB : sbox = 8'hF;
      8'hFC : sbox = 8'hB0;
      8'hFD : sbox = 8'h54;
      8'hFE : sbox = 8'hBB;
      8'hFF : sbox = 8'h16;
      default : sbox = 8'h0;
    endcase
    end
  endfunction
  
endmodule