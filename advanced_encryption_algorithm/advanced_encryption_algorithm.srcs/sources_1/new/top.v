`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UMBC-EEHPC
// Engineer: Nitheesh K Manjunath
// 
// Create Date: 04/07/2019 10:55:16 PM
// Design Name: 
// Module Name: top
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


module top#(
    parameter BLOCK_SIZE = 128,
    parameter B_S_DIV_8 = 16
    )( 
    input clk,
    input rst,
    input start,
    input [BLOCK_SIZE-1:0] data_i,
    input [BLOCK_SIZE-1:0] initial_key,
    output[BLOCK_SIZE-1:0] data_o,
    output encryption_done
    );
    
localparam[2:0] fsm_idle = 3'b000,
                fsm_addInitkey = 3'b001,
                fsm_subBytes = 3'b010,
                fsm_shiftRows = 3'b011,
                fsm_mixColumns_1 = 3'b100,
                fsm_mixColumns_2 = 3'b101,
                fsm_addRoundkey = 3'b110;
                
reg[2:0] currentState, nextState;
////////////////////////////
reg[3:0] counter = 0;
reg start_addInitkey = 0;
reg start_subBytes = 0;
reg rst_counter = 1;
reg start_shiftRows = 0;
reg start_addRoundkey = 0;
reg start_mixColumns = 0;
reg fetch = 0;
reg select = 0;
reg fetch_1 = 0;
reg output_en = 0;
reg counter_a = 0;
reg counter_0 = 0;
////////////////////////////
wire [BLOCK_SIZE-1:0] addRoundkey_out;
wire [BLOCK_SIZE-1:0] subBytes_out;
wire [BLOCK_SIZE-1:0] shiftRows_out;
wire [BLOCK_SIZE-1:0] mixColumns_out;
wire [BLOCK_SIZE-1:0] addRoundkey_in;
wire [BLOCK_SIZE-1:0] key;
wire [BLOCK_SIZE-1:0] key_in;
reg [BLOCK_SIZE-1:0] addRoundkey_data;
////////////////////////////
wire addRoundkey_en;
wire key_generated;
wire fetch_en;
wire cipherText_ready;
addRoundkey#(
        BLOCK_SIZE,
        B_S_DIV_8
        )addRoundkey_inst(
        clk,
        rst,
        addRoundkey_en,
        addRoundkey_data,
        key_in,
        addRoundkey_out,
        cipherText_ready);

subBytes#(
        BLOCK_SIZE,
        B_S_DIV_8
        )subBytes_inst(
        clk,
        rst,
//        start_subBytes,
        addRoundkey_out,
        subBytes_out);
    
shiftRows#(
        BLOCK_SIZE
        ) shiftRows_inst(
        clk,
        rst,
//        start_shiftRows,
        subBytes_out,
        shiftRows_out);
        
mixColumns#(
        BLOCK_SIZE
        )mixColumns_inst(
        clk,
        rst,
//        start_mixColumns,
        shiftRows_out,
        mixColumns_out);

keySchedule#(
        BLOCK_SIZE
        )keySchedule_inst(
        clk,
        rst,
        counter,
        fetch_en,
        key_generated,
        initial_key,
        key);
        
        
always@(posedge clk or posedge rst) begin
    if(rst) begin
        currentState <= fsm_idle;
    end
    else begin
        currentState <= nextState;
    end
end

//always@(negedge clk) begin
//     subBytes_in <= addRoundkey_out;
//end


always@(*) begin

    start_addInitkey = 0;
    start_subBytes = 0;
    rst_counter = 0;
    start_shiftRows = 0;
    start_addRoundkey = 0;
    start_mixColumns = 0;
    fetch = 0;
    select = 0;
    output_en = 0;
    
    case(currentState)
        fsm_idle : begin
            rst_counter = 1;
            if(start) begin
                nextState = fsm_addInitkey;
            end
            else begin
                nextState = fsm_idle;
            end
        end
        
        fsm_addInitkey : begin
            start_addInitkey = 1;
            nextState = fsm_subBytes;
        end
        
        fsm_subBytes : begin
            start_subBytes = 1;
            nextState = fsm_shiftRows;
        end
        
        fsm_shiftRows : begin
            start_shiftRows = 1;
            fetch = 1;
            if(counter<4'ha) begin
                nextState = fsm_mixColumns_1;
                select = 0;
            end
            else begin
                nextState = fsm_addRoundkey;
                select = 1;
            end
        end
        
        fsm_mixColumns_1 : begin
            start_mixColumns = 1;
//            fetch = 1;
            nextState = fsm_mixColumns_2;
        end
        
        fsm_mixColumns_2 : begin
            nextState = fsm_addRoundkey;
        end
        
        fsm_addRoundkey : begin
            if(key_generated) begin
                start_addRoundkey = 1;
                if(counter<4'ha) begin
                    nextState = fsm_subBytes;
                end
                else begin
                    nextState = fsm_idle;
                end
            end
            else begin
                start_addRoundkey = 0;
                nextState = fsm_addRoundkey;
            end
        end
        
        default : begin
            nextState  = fsm_idle;
        end
        
    endcase
end

always@(posedge clk) begin
    fetch_1 <= fetch;
    if(rst || rst_counter ) begin
        counter <= 4'b0;
    end
    else begin
        if(start_subBytes) begin
            counter <= counter + 1;
        end
        else begin
            counter <= counter;
        end
    end
end         

always@(*) begin
    counter_a = 0;
    counter_0 = 0;
    case(counter)
        4'h0 : begin
            addRoundkey_data  = data_i;
            counter_0 = 1;
        end
        4'ha : begin
            addRoundkey_data = shiftRows_out;
            counter_a = 1;
        end
        default : begin
            addRoundkey_data = mixColumns_out;
        end
    endcase
end

assign fetch_en = fetch_1 | fetch;
assign addRoundkey_en = start_addRoundkey | start_addInitkey;
assign key_in = counter_0 ? initial_key : key;
assign data_o = (counter_a && cipherText_ready) ? addRoundkey_out : {BLOCK_SIZE{1'bz}};
assign encryption_done = (counter_a && cipherText_ready) ? 1'b1 : 1'b0;

endmodule
