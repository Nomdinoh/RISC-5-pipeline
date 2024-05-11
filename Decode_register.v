`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2024 10:08:16 AM
// Design Name: 
// Module Name: Decode_register
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


module Decode_register(
input clk,
input CLR_E,
input RegWriteD,MemWriteD,jumpD,branchD,ALUSrcD,
input [4:0] Rs1D,Rs2D,
input [4:0] RdD,
input [1:0] ResultSrcD,
input [2:0] ALUControlD,
input [31:0] RD1,RD2,PCD,ImmExtD,PCPlus4D,
output reg RegWriteE,MemWriteE,jumpE,branchE,ALUSrcE,
output reg [4:0] Rs1E,Rs2E,
output reg [4:0] RdE,
output reg [1:0] ResultSrcE,
output reg [2:0] ALUControlE,
output reg [31:0] RD1_E,RD2_E,PCE,ImmExtE,PCPlus4E
    );
    
    always @(posedge clk)
    begin
        if(CLR_E)
        begin
            RegWriteE <= 1'b0;
            MemWriteE <= 1'b0;
            jumpE <= 1'b0;
            branchE <= 1'b0;
            ALUSrcE <= 1'b0;
            ResultSrcE <= 2'b0;
            ALUControlE <= 3'b0;
            
            RD1_E <= 32'b0;
            RD2_E <= 32'b0;
            Rs1E <= 5'h0;
            Rs2E <= 5'h0;
            RdE <= 5'h0;
            PCE <= 32'b0;
            ImmExtE <= 32'b0;
            PCPlus4E <= 32'b0;
        end
        else begin
            RegWriteE <= RegWriteD;
            MemWriteE <= MemWriteD;
            jumpE <= jumpD;
            branchE <= branchD;
            ALUSrcE <= ALUSrcD;
            ResultSrcE <= ResultSrcD;
            ALUControlE <= ALUControlD;
                    
            RD1_E <= RD1;
            RD2_E <= RD2;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            RdE <= RdD;
            PCE <= PCD;
            ImmExtE <= ImmExtD;
            PCPlus4E <= PCPlus4D;
        end
    end
    
endmodule
