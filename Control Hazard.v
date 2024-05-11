`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 02:51:34 PM
// Design Name: 
// Module Name: Control_Hazard
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


module Control_Hazard(
input RegWriteM,RegWriteW,
input ResultSrcE_0,
input PcSrc,
input [4:0] Rs1D,Rs2D,
input [4:0] Rs1E,Rs2E,
input [4:0] RdE,RdM,RdW,
output [1:0] ForwardAE,ForwardBE,
output FlushE,StallD,StallF,FlushD
    );
    
    wire lwStall;
    
    assign ForwardAE = ( (Rs1E == RdM) & (Rs1E != 5'h0) & RegWriteM ) ? 2'b10:
                       ( (Rs1E == RdW) & (Rs1E != 5'h0) & RegWriteW ) ? 2'b01: 2'b00; 
                       
    assign ForwardBE = ( (Rs2E == RdM) & (Rs2E != 5'h0) & RegWriteM ) ? 2'b10:
                       ( (Rs2E == RdW) & (Rs2E != 5'h0) & RegWriteW ) ? 2'b01: 2'b00;    
    
    assign lwStall = ResultSrcE_0 & ((Rs1D == RdE) | (Rs2D == RdE)); 
    assign StallF = lwStall;
    assign StallD = lwStall;
    assign FlushD = PcSrc;
    assign FlushE = lwStall | PcSrc ; 
    
endmodule
